-- ============================================
-- 訂單異動與差額處理（以 BOOKING_SLOT 為準，不再用 BLOCKED_SLOT）
-- 交易內流程：
-- 1) 鎖定目標訂單（FOR UPDATE）
-- 2) 產生「新切片」new_slots
-- 3) 檢查：開放規則、封場(BLOCKED_SLOT)、與其他訂單切片衝突
-- 4) 重算金額
-- 5) 刪舊切片 → 插入新切片 → 更新 BOOKING
-- 6) 產生補收/退款 PAYMENT（Pending）
-- 若任一步失敗 → ROLLBACK
-- ============================================

-- 範例 DO：請自行替換變數值後執行
-- DO $$
-- DECLARE
--   v_booking_id     BIGINT := 2;
--   v_new_date       DATE   := DATE '2025-01-20';
--   v_new_start_time TIME   := TIME '14:00:00';
--   v_new_end_time   TIME   := TIME '17:00:00';
--   v_new_venue_id   BIGINT := NULL;       -- NULL=沿用舊場地
--   v_new_people     INT    := NULL;       -- NULL=沿用舊人數

--   v_old_date DATE; v_old_start TIME; v_old_end TIME; v_old_venue BIGINT;
--   v_old_amount NUMERIC(10,2); v_old_status TEXT; v_old_people INT;
--   v_ver_id BIGINT; v_aff TEXT; v_weekday INT; v_slot_min INT;
--   v_new_amount NUMERIC(10,2); v_amount_diff NUMERIC(10,2);
-- BEGIN
--   -- 1) 鎖定訂單（避免重入）
--   SELECT date, start_time, end_time, venue_id, amount_est, status,
--          people, version_id, affiliation_cached
--   INTO   v_old_date, v_old_start, v_old_end, v_old_venue,
--          v_old_amount, v_old_status, v_old_people, v_ver_id, v_aff
--   FROM BOOKING
--   WHERE booking_id = v_booking_id
--   FOR UPDATE;
--   IF NOT FOUND THEN
--     RAISE EXCEPTION '訂單不存在 %', v_booking_id;
--   END IF;

--   IF v_new_venue_id IS NULL THEN
--     v_new_venue_id := v_old_venue;
--   END IF;
--   IF v_new_people IS NULL THEN
--     v_new_people := v_old_people;
--   END IF;

--   -- 2) 取得 slot_minute（無定義時預設 30）
--   v_weekday := EXTRACT(DOW FROM v_new_date);
--   SELECT COALESCE((
--     SELECT slot_minute FROM TIMESLOT_RULE
--     WHERE venue_id = v_new_venue_id AND weekday = v_weekday
--     LIMIT 1
--   ), 30) INTO v_slot_min;

--   -- 3) 檢核：開放時間（整段需納入 open/close）
--   PERFORM 1
--   FROM TIMESLOT_RULE tr
--   WHERE tr.venue_id = v_new_venue_id
--     AND tr.weekday  = v_weekday
--     AND tr.open_time <= v_new_start_time
--     AND tr.close_time >= v_new_end_time;
--   IF NOT FOUND THEN
--     RAISE EXCEPTION '不符場地開放規則（% 週% %–%）', v_new_venue_id, v_weekday, v_new_start_time, v_new_end_time;
--   END IF;

--   -- 產生新切片（不落地表，先用 CTE/子查詢）
--   -- 注意：若你們有跨段規則計費，要分段累加；這裡先簡化為「單一匹配規則」。
--   -- 檢核：封場（BLOCKED_SLOT）是否重疊
--   IF EXISTS (
--     SELECT 1
--     FROM BLOCKED_SLOT bs
--     WHERE bs.venue_id = v_new_venue_id
--       AND bs.date     = v_new_date
--       AND (
--         (bs.start_time <= v_new_start_time AND bs.end_time > v_new_start_time) OR
--         (bs.start_time <  v_new_end_time   AND bs.end_time >= v_new_end_time) OR
--         (bs.start_time >= v_new_start_time AND bs.end_time <= v_new_end_time)
--       )
--   ) THEN
--     RAISE EXCEPTION '新時段與封場衝突（BLOCKED_SLOT）';
--   END IF;

--   -- 檢核：與其他訂單切片衝突（以 BOOKING_SLOT 為準）
--   IF EXISTS (
--     WITH new_slots AS (
--       SELECT generate_series(
--                (v_new_date::text||' '||v_new_start_time::text)::timestamp,
--                (v_new_date::text||' '||v_new_end_time::text)::timestamp - (v_slot_min||' minutes')::interval,
--                (v_slot_min||' minutes')::interval
--              ) AS slot_start
--     )
--     SELECT 1
--     FROM BOOKING_SLOT s
--     JOIN new_slots ns ON ns.slot_start = s.slot_start
--     WHERE s.venue_id   = v_new_venue_id
--       AND s.booking_id <> v_booking_id
--     LIMIT 1
--   ) THEN
--     RAISE EXCEPTION '新時段與他單衝突（BOOKING_SLOT）';
--   END IF;

--   -- 4) 重算金額（簡化版：以 BOOKING.version_id + 單一 PRICE_RULE 覆蓋整段）
--   --    若有跨多價格區間，請改為分段 SUM。
--   SELECT
--     /* 四捨五入到 step 分鐘的片數 × 每小時單價 */
--     (
--       CEIL( EXTRACT(EPOCH FROM (v_new_end_time - v_new_start_time))/60.0 / pr.step_minute )
--       * (pr.step_minute/60.0)
--     )::numeric
--     * GREATEST(pr.min_hours::numeric, 1.0) / GREATEST( (pr.step_minute/60.0)::numeric , 1.0)
--     * pr.base_fee_per_hour
--     * (1.0 + COALESCE(pr.peak_surcharge_pct,0)::numeric/100.0)
--   INTO v_new_amount
--   FROM PRICE_RULE pr
--   WHERE pr.version_id = v_ver_id
--     AND pr.affiliation = v_aff
--     AND pr.day_type = COALESCE(
--       (SELECT day_type FROM HOLIDAY WHERE date = v_new_date),
--       CASE WHEN EXTRACT(DOW FROM v_new_date) IN (0,6) THEN 'Weekend' ELSE 'Weekday' END
--     )
--     AND pr.start_time <= v_new_start_time
--     AND pr.end_time   >= v_new_end_time
--   LIMIT 1;

--   IF v_new_amount IS NULL THEN
--     -- 找不到精確覆蓋規則：退回原金額（或在此改為分段計價）
--     v_new_amount := v_old_amount;
--   END IF;

--   v_amount_diff := v_new_amount - v_old_amount;

--   -- 5) 套用變更：刪舊切片→插入新切片→更新 BOOKING
--   DELETE FROM BOOKING_SLOT WHERE booking_id = v_booking_id;

--   INSERT INTO BOOKING_SLOT (booking_id, venue_id, slot_start)
--   SELECT v_booking_id, v_new_venue_id, gs AS slot_start
--   FROM generate_series(
--          (v_new_date::text||' '||v_new_start_time::text)::timestamp,
--          (v_new_date::text||' '||v_new_end_time::text)::timestamp - (v_slot_min||' minutes')::interval,
--          (v_slot_min||' minutes')::interval
--        ) AS gs;

--   UPDATE BOOKING
--   SET date       = v_new_date,
--       start_time = v_new_start_time,
--       end_time   = v_new_end_time,
--       venue_id   = v_new_venue_id,
--       people     = v_new_people,
--       amount_est = v_new_amount,
--       status     = CASE
--                      WHEN v_old_status='Approved' AND ABS(v_amount_diff) > 100 THEN 'Pending' -- 需覆核
--                      ELSE v_old_status
--                    END
--   WHERE booking_id = v_booking_id;

--   -- 6) 產生補收/退款（Pending）
--   IF ABS(v_amount_diff) > 0.01 THEN
--     INSERT INTO PAYMENT (payment_id, booking_id, method, amount, type, status, created_at)
--     VALUES (
--       (SELECT COALESCE(MAX(payment_id),0)+1 FROM PAYMENT),
--       v_booking_id,
--       'Transfer',  -- 預設：系統產生差額用轉帳/內部處理
--       ABS(v_amount_diff),
--       CASE WHEN v_amount_diff>0 THEN 'Rent' ELSE 'Adjustment' END,
--       'Pending',
--       now()
--     );

--   END IF;

--   RAISE NOTICE 'OK: booking % 舊=%, 新=%, 差額=%', v_booking_id, v_old_amount, v_new_amount, v_amount_diff;
-- END $$;

CREATE OR REPLACE FUNCTION modify_booking(
  p_booking_id BIGINT,
  p_new_date DATE,
  p_new_start_time TIME,
  p_new_end_time TIME,
  p_new_venue_id BIGINT DEFAULT NULL,
  p_new_people INT DEFAULT NULL
) RETURNS JSON LANGUAGE plpgsql AS $$
DECLARE
  v_old_date DATE; v_old_start TIME; v_old_end TIME; v_old_venue BIGINT;
  v_old_amount NUMERIC(10,2); v_old_status TEXT; v_old_people INT;
  v_ver_id BIGINT; v_aff TEXT; v_weekday INT; v_slot_min INT;
  v_new_amount NUMERIC(10,2); v_amount_diff NUMERIC(10,2);
BEGIN
  -- 鎖訂單
  SELECT date, start_time, end_time, venue_id, amount_est, status,
         people, version_id, affiliation_cached
  INTO   v_old_date, v_old_start, v_old_end, v_old_venue,
         v_old_amount, v_old_status, v_old_people, v_ver_id, v_aff
  FROM BOOKING
  WHERE booking_id = p_booking_id
  FOR UPDATE;
  IF NOT FOUND THEN
    RETURN json_build_object('success', false, 'error', '訂單不存在');
  END IF;

  IF p_new_venue_id IS NULL THEN p_new_venue_id := v_old_venue; END IF;
  IF p_new_people   IS NULL THEN p_new_people   := v_old_people; END IF;

  v_weekday := EXTRACT(DOW FROM p_new_date);
  SELECT COALESCE((
    SELECT slot_minute FROM TIMESLOT_RULE
    WHERE venue_id = p_new_venue_id AND weekday = v_weekday
    LIMIT 1
  ),30) INTO v_slot_min;

  -- 開放規則
  PERFORM 1
  FROM TIMESLOT_RULE tr
  WHERE tr.venue_id = p_new_venue_id
    AND tr.weekday  = v_weekday
    AND tr.open_time <= p_new_start_time
    AND tr.close_time >= p_new_end_time;
  IF NOT FOUND THEN
    RETURN json_build_object('success', false, 'error', '不符開放規則');
  END IF;

  -- 封場衝突
  IF EXISTS (
    SELECT 1 FROM BLOCKED_SLOT bs
    WHERE bs.venue_id = p_new_venue_id
      AND bs.date     = p_new_date
      AND (
        (bs.start_time <= p_new_start_time AND bs.end_time > p_new_start_time) OR
        (bs.start_time <  p_new_end_time   AND bs.end_time >= p_new_end_time) OR
        (bs.start_time >= p_new_start_time AND bs.end_time <= p_new_end_time)
      )
  ) THEN
    RETURN json_build_object('success', false, 'error', '封場衝突');
  END IF;

  -- 與他單切片衝突
  IF EXISTS (
    WITH new_slots AS (
      SELECT generate_series(
               (p_new_date::text||' '||p_new_start_time::text)::timestamp,
               (p_new_date::text||' '||p_new_end_time::text)::timestamp - (v_slot_min||' minutes')::interval,
               (v_slot_min||' minutes')::interval
             ) AS slot_start
    )
    SELECT 1
    FROM BOOKING_SLOT s
    JOIN new_slots ns ON ns.slot_start = s.slot_start
    WHERE s.venue_id   = p_new_venue_id
      AND s.booking_id <> p_booking_id
    LIMIT 1
  ) THEN
    RETURN json_build_object('success', false, 'error', '與其他訂單衝突');
  END IF;

  -- 重算金額（簡化：單一規則覆蓋）
  SELECT
    (
      CEIL( EXTRACT(EPOCH FROM (p_new_end_time - p_new_start_time))/60.0 / pr.step_minute )
      * (pr.step_minute/60.0)
    )::numeric
    * GREATEST(pr.min_hours::numeric, 1.0) / GREATEST( (pr.step_minute/60.0)::numeric , 1.0)
    * pr.base_fee_per_hour
    * (1.0 + COALESCE(pr.peak_surcharge_pct,0)::numeric/100.0)
  INTO v_new_amount
  FROM PRICE_RULE pr
  WHERE pr.version_id = v_ver_id
    AND pr.affiliation = v_aff
    AND pr.day_type = COALESCE(
      (SELECT day_type FROM HOLIDAY WHERE date = p_new_date),
      CASE WHEN EXTRACT(DOW FROM p_new_date) IN (0,6) THEN 'Weekend' ELSE 'Weekday' END
    )
    AND pr.start_time <= p_new_start_time
    AND pr.end_time   >= p_new_end_time
  LIMIT 1;

  IF v_new_amount IS NULL THEN v_new_amount := v_old_amount; END IF;
  v_amount_diff := v_new_amount - v_old_amount;

  -- 套用切片 + 更新主檔
  DELETE FROM BOOKING_SLOT WHERE booking_id = p_booking_id;

  INSERT INTO BOOKING_SLOT (booking_id, venue_id, slot_start)
  SELECT p_booking_id, p_new_venue_id, gs
  FROM generate_series(
         (p_new_date::text||' '||p_new_start_time::text)::timestamp,
         (p_new_date::text||' '||p_new_end_time::text)::timestamp - (v_slot_min||' minutes')::interval,
         (v_slot_min||' minutes')::interval
       ) AS gs;

  UPDATE BOOKING
  SET date       = p_new_date,
      start_time = p_new_start_time,
      end_time   = p_new_end_time,
      venue_id   = p_new_venue_id,
      people     = p_new_people,
      amount_est = v_new_amount,
      status     = CASE
                     WHEN v_old_status='Approved' AND ABS(v_amount_diff) > 100 THEN 'Pending'
                     ELSE v_old_status
                   END
  WHERE booking_id = p_booking_id;

  IF ABS(v_amount_diff) > 0.01 THEN
    INSERT INTO PAYMENT (payment_id, booking_id, method, amount, type, status, created_at)
    VALUES (
      (SELECT COALESCE(MAX(payment_id),0)+1 FROM PAYMENT),
      p_booking_id,
      'Transfer',  -- ★ 這裡從 NULL 改成 'Transfer'
      ABS(v_amount_diff),
      CASE WHEN v_amount_diff>0 THEN 'Rent' ELSE 'Adjustment' END,
      'Pending',
      now()
    );
  END IF;


  RETURN json_build_object(
    'success', true,
    'booking_id', p_booking_id,
    'old_amount', v_old_amount,
    'new_amount', v_new_amount,
    'amount_diff', v_amount_diff,
    'new_status', (SELECT status FROM BOOKING WHERE booking_id = p_booking_id)
  );
EXCEPTION WHEN OTHERS THEN
  RETURN json_build_object('success', false, 'error', SQLERRM);
END;
$$;

-- 使用範例：
-- SELECT modify_booking(2, '2025-01-20', '14:00', '17:00', NULL, NULL);
