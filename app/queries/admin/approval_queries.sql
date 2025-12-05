-- =========================================================
-- approval_queries.sql  (BOOKING_SLOT 為唯一時段真相版本)
-- 變更重點：
-- 1) 核准流程不再 INSERT 到 BLOCKED_SLOT
-- 2) 以切片檢查衝突(BOOKING_SLOT + v_blocked_slot_slots)
-- 3) 在同一交易中：鎖單 → 檢查 → 插入 BOOKING_SLOT → 更新 BOOKING → 寫 APPROVAL
-- =========================================================

-- ---------------------------------------------------------
-- 0) 封館/維修用 BLOCKED_SLOT 的切片 view（僅供查詢，不寫入）
--    如已在別處建立，可略過此段
-- ---------------------------------------------------------
CREATE OR REPLACE VIEW v_blocked_slot_slots AS
SELECT
  bs.venue_id,
  gs AS slot_start
FROM BLOCKED_SLOT bs
CROSS JOIN LATERAL generate_series(
  (bs.date || ' ' || bs.start_time)::timestamp,
  (bs.date || ' ' || bs.end_time)::timestamp - interval '30 minutes',
  interval '30 minutes'
) AS gs;

-- ---------------------------------------------------------
-- 1) 待審清單  SEARCH_PENDING
-- ---------------------------------------------------------
SELECT *
FROM BOOKING
WHERE status = 'Pending'
ORDER BY created_at ASC;

-- ---------------------------------------------------------
-- 2) 待審詳情  SEARCH_PENDING_DETAIL
--    可改 WHERE b.booking_id = @booking_id
-- ---------------------------------------------------------
SELECT
  b.booking_id, b.purpose, b.date, b.start_time, b.end_time, b.people,
  b.amount_est, b.deposit, b.status, b.created_at AS booking_created_at,
  u.name  AS applicant_name, u.email AS applicant_email, u.phone AS applicant_phone,
  o.name  AS org_name,
  v.name  AS venue_name, v.type AS venue_type, v.capacity AS venue_capacity,
  bd.name AS building_name
FROM BOOKING b
JOIN "user"   u  ON b.user_id = u.user_id
LEFT JOIN ORG o  ON b.org_id = o.org_id
JOIN VENUE    v  ON b.venue_id = v.venue_id
JOIN BUILDING bd ON v.building_id = bd.building_id
WHERE b.status = 'Pending'
ORDER BY b.created_at ASC;

-- ---------------------------------------------------------
-- 3) 某申請審核歷史  SEARCH_PENDING_HISTORY
--    WHERE a.booking_id = @booking_id
-- ---------------------------------------------------------
SELECT
  a.approval_id, a.step, a.decision, a.comment, a.decided_at,
  u.name AS approver_name
FROM APPROVAL a
JOIN "user" u ON a.approver_id = u.user_id
WHERE a.booking_id = 2
ORDER BY a.step ASC, a.decided_at ASC;

-- ---------------------------------------------------------
-- 4) 綜合審核檢查（以切片檢查衝突） COMPREHENSIVE_APPROVAL_CHECK
--    WHERE b.booking_id = @booking_id AND b.status='Pending'
-- ---------------------------------------------------------
WITH slot_len AS (
  SELECT COALESCE((
    SELECT tr.slot_minute
    FROM TIMESLOT_RULE tr
    WHERE tr.venue_id = b.venue_id
      AND tr.weekday = EXTRACT(DOW FROM b.date)
    LIMIT 1
  ), 30)::int AS m
  FROM BOOKING b WHERE b.booking_id = 2
),
req AS (
  SELECT
    b.booking_id, b.venue_id,
    generate_series(
      (b.date || ' ' || b.start_time)::timestamp,
      (b.date || ' ' || b.end_time)::timestamp - (m || ' minutes')::interval,
      (m || ' minutes')::interval
    ) AS slot_start
  FROM BOOKING b, slot_len
  WHERE b.booking_id = 2
)
SELECT
  b.booking_id, b.purpose, b.date, b.start_time, b.end_time,
  u.name AS applicant_name, v.name AS venue_name,
  -- 這裡改成看 user.status
  CASE WHEN u.status = 'Frozen' THEN '⚠ 帳號已凍結' ELSE '✓' END AS user_status_check,
  CASE WHEN b.people > v.capacity THEN '⚠ 超容' ELSE '✓' END AS capacity_check,
  CASE WHEN v.open_status = 'Off' THEN '⚠ 場地關閉' ELSE '✓' END AS venue_status_check,
  CASE WHEN EXISTS (
    SELECT 1 FROM BOOKING_SLOT s
    JOIN BOOKING ob ON ob.booking_id = s.booking_id
    WHERE s.venue_id = b.venue_id
      AND ob.status IN ('Approved','PendingPayment') -- 視規則調整
      AND ob.booking_id <> b.booking_id
      AND s.slot_start IN (SELECT slot_start FROM req)
  ) THEN '⚠ 與已核准/保留衝突' ELSE '✓' END AS conflict_with_bookings,
  CASE WHEN EXISTS (
    SELECT 1 FROM v_blocked_slot_slots x
    WHERE x.venue_id = b.venue_id
      AND x.slot_start IN (SELECT slot_start FROM req)
  ) THEN '⚠ 與封館衝突' ELSE '✓' END AS conflict_with_blocked
FROM BOOKING b
JOIN "user" u ON b.user_id = u.user_id
JOIN VENUE   v ON b.venue_id = v.venue_id
WHERE b.booking_id = 2
  AND b.status = 'Pending';

-- ---------------------------------------------------------
-- 5) 核准（單關或最終關） APPROVE_PENDING
--    以函數處理：鎖單→檢查→切片插入→更新狀態→寫審核；原子性保證
-- ---------------------------------------------------------
CREATE OR REPLACE FUNCTION approve_booking(
  p_booking_id BIGINT,
  p_approver_id BIGINT,
  p_step INT DEFAULT 1,
  p_comment TEXT DEFAULT NULL,
  p_final BOOLEAN DEFAULT TRUE  -- 若多關卡，只有最後一關傳 TRUE
) RETURNS JSON AS $$
DECLARE
  v_status TEXT;
  v_venue BIGINT;
  v_date DATE;
  v_s TIME; v_e TIME;
  v_m INT := 30;
  v_expected INT;
  v_inserted INT;
BEGIN
  -- 1) 鎖住該 booking（避免並發）
  SELECT status, venue_id, date, start_time, end_time
  INTO v_status, v_venue, v_date, v_s, v_e
  FROM BOOKING
  WHERE booking_id = p_booking_id
  FOR UPDATE;

  IF NOT FOUND THEN
    RETURN json_build_object('success', false, 'error', 'booking not found');
  END IF;
  IF v_status <> 'Pending' THEN
    RETURN json_build_object('success', false, 'error', 'status must be Pending');
  END IF;

  -- 2) 取得 slot 長度
  SELECT COALESCE((
    SELECT tr.slot_minute
    FROM TIMESLOT_RULE tr
    WHERE tr.venue_id = v_venue
      AND tr.weekday = EXTRACT(DOW FROM v_date)
    LIMIT 1
  ), 30)::int INTO v_m;

  -- 3) 衝突檢查（BOOKING_SLOT + 封館切片）
  IF EXISTS (
    WITH req AS (
      SELECT generate_series(
        (v_date || ' ' || v_s)::timestamp,
        (v_date || ' ' || v_e)::timestamp - (v_m || ' minutes')::interval,
        (v_m || ' minutes')::interval
      ) AS slot_start
    )
    SELECT 1
    FROM BOOKING_SLOT s
    JOIN BOOKING ob ON ob.booking_id = s.booking_id
    WHERE s.venue_id = v_venue
      AND ob.status IN ('Approved','PendingPayment')
      AND ob.booking_id <> p_booking_id
      AND s.slot_start IN (SELECT slot_start FROM req)
    LIMIT 1
  ) THEN
    RETURN json_build_object('success', false, 'error', 'conflict with existing bookings');
  END IF;

  IF EXISTS (
    WITH req AS (
      SELECT generate_series(
        (v_date || ' ' || v_s)::timestamp,
        (v_date || ' ' || v_e)::timestamp - (v_m || ' minutes')::interval,
        (v_m || ' minutes')::interval
      ) AS slot_start
    )
    SELECT 1
    FROM v_blocked_slot_slots x
    WHERE x.venue_id = v_venue
      AND x.slot_start IN (SELECT slot_start FROM req)
    LIMIT 1
  ) THEN
    RETURN json_build_object('success', false, 'error', 'conflict with blocked slots');
  END IF;

  -- 4) 切片插入（避免競態：ON CONFLICT DO NOTHING + 驗證筆數）
  WITH req AS (
    SELECT generate_series(
      (v_date || ' ' || v_s)::timestamp,
      (v_date || ' ' || v_e)::timestamp - (v_m || ' minutes')::interval,
      (v_m || ' minutes')::interval
    ) AS slot_start
  ), ins AS (
    INSERT INTO BOOKING_SLOT (booking_id, venue_id, slot_start)
    SELECT p_booking_id, v_venue, r.slot_start
    FROM req r
    ON CONFLICT (venue_id, slot_start) DO NOTHING
    RETURNING 1
  )
  SELECT (SELECT COUNT(*) FROM req) AS expected,
         COALESCE((SELECT COUNT(*) FROM ins), 0) AS inserted
  INTO v_expected, v_inserted;

  IF v_inserted <> v_expected THEN
    -- 有競態或剛好被別人搶到，回滾
    RAISE EXCEPTION 'slot race: expected %, inserted %', v_expected, v_inserted;
  END IF;

  -- 5) 更新 BOOKING 狀態（若多關卡且非最終關，可保持 Pending）
  UPDATE BOOKING
  SET status = CASE WHEN p_final THEN 'Approved' ELSE 'Pending' END
  WHERE booking_id = p_booking_id;

  -- 6) 寫入 APPROVAL（若有序號欄位，建議用 DEFAULT；這裡保守寫法）
  INSERT INTO APPROVAL (booking_id, approver_id, step, decision, comment, decided_at)
  VALUES (p_booking_id, p_approver_id, p_step,
          CASE WHEN p_final THEN 'Approved' ELSE 'Pending' END,
          COALESCE(p_comment, ''),
          now());

  RETURN json_build_object('success', true,
                           'booking_id', p_booking_id,
                           'status', (SELECT status FROM BOOKING WHERE booking_id = p_booking_id),
                           'slots', v_inserted);
EXCEPTION
  WHEN OTHERS THEN
    RETURN json_build_object('success', false, 'error', SQLERRM);
END;
$$ LANGUAGE plpgsql;

-- 範例：
-- SELECT approve_booking(2, 1, 1, '通過', TRUE);

-- ---------------------------------------------------------
-- 6) 拒絕  REJECT_PENDING
-- ---------------------------------------------------------
CREATE OR REPLACE FUNCTION reject_booking(
  p_booking_id BIGINT,
  p_approver_id BIGINT,
  p_step INT DEFAULT 1,
  p_comment TEXT DEFAULT NULL
) RETURNS JSON AS $$
DECLARE
  v_status TEXT;
BEGIN
  SELECT status INTO v_status FROM BOOKING
  WHERE booking_id = p_booking_id
  FOR UPDATE;

  IF NOT FOUND THEN
    RETURN json_build_object('success', false, 'error', 'booking not found');
  END IF;
  IF v_status <> 'Pending' THEN
    RETURN json_build_object('success', false, 'error', 'status must be Pending');
  END IF;

  UPDATE BOOKING SET status = 'Rejected'
  WHERE booking_id = p_booking_id;

  INSERT INTO APPROVAL (booking_id, approver_id, step, decision, comment, decided_at)
  VALUES (p_booking_id, p_approver_id, p_step, 'Rejected', COALESCE(p_comment,''), now());

  RETURN json_build_object('success', true, 'booking_id', p_booking_id, 'status', 'Rejected');
END;
$$ LANGUAGE plpgsql;

-- 範例：
-- SELECT reject_booking(5, 1, 1, '時間衝突，退回');

-- ---------------------------------------------------------
-- 7) 要求補件 / 調整（退回草稿） REQUEST_CHANGES
-- ---------------------------------------------------------
CREATE OR REPLACE FUNCTION request_changes(
  p_booking_id BIGINT,
  p_approver_id BIGINT,
  p_step INT DEFAULT 1,
  p_comment TEXT DEFAULT '請補件'
) RETURNS JSON AS $$
DECLARE
  v_status TEXT;
BEGIN
  SELECT status INTO v_status FROM BOOKING
  WHERE booking_id = p_booking_id
  FOR UPDATE;

  IF NOT FOUND THEN
    RETURN json_build_object('success', false, 'error', 'booking not found');
  END IF;
  IF v_status <> 'Pending' THEN
    RETURN json_build_object('success', false, 'error', 'status must be Pending');
  END IF;

  UPDATE BOOKING SET status = 'Draft'
  WHERE booking_id = p_booking_id;

  INSERT INTO APPROVAL (booking_id, approver_id, step, decision, comment, decided_at)
  VALUES (p_booking_id, p_approver_id, p_step, 'Pending', p_comment, now());

  RETURN json_build_object('success', true, 'booking_id', p_booking_id, 'status', 'Draft');
END;
$$ LANGUAGE plpgsql;

-- 範例：
-- SELECT request_changes(2, 1, 1, '請補上活動說明與人數證明');

-- ---------------------------------------------------------
-- 8) 多關卡範例 MULTI_APPROVAL
--    第一步：只寫 APPROVAL 保持 Pending；最後一步呼叫 approve_booking(..., p_final=TRUE)
-- ---------------------------------------------------------
-- 第 1 關（記錄通過，但不切片、不改狀態）
INSERT INTO APPROVAL (booking_id, approver_id, step, decision, comment, decided_at)
VALUES (3, 1, 1, 'Approved', '第一關通過', now());

-- 第 2 關（最終，進入切片與核准）
-- SELECT approve_booking(3, 1, 2, '最終通過', TRUE);

-- ---------------------------------------------------------
-- 9) 管理員總覽  SEARCH_ALL_BOOKING_PROCESS
-- ---------------------------------------------------------
SELECT
  b.booking_id, b.purpose, b.date, b.status,
  u.name AS applicant_name, v.name AS venue_name,
  a.decision AS last_decision, a.decided_at AS last_decision_time
FROM BOOKING b
JOIN "user" u ON b.user_id = u.user_id
JOIN VENUE   v ON b.venue_id = v.venue_id
LEFT JOIN LATERAL (
  SELECT decision, decided_at
  FROM APPROVAL
  WHERE booking_id = b.booking_id
  ORDER BY decided_at DESC
  LIMIT 1
) a ON true
WHERE b.status IN ('Pending','Approved','Rejected','Draft')
ORDER BY b.created_at DESC;

-- ---------------------------------------------------------
-- 10) 其他檢查（沿用/微調）：容量、開放時段、設備充足性
--     CHECK_VENUE_SPECIFICATION / CHECK_TIME_RULE / CHECK_EQUIPMENT_REQUIREMENT
--     （邏輯與你現有版相同，可保留）
-- ---------------------------------------------------------
