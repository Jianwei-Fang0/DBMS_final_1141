-- ============================================
-- 審核申請功能完整流程
-- 1. 查詢所有待審核的申請
-- 2. 審核前檢查（黑名單、違規紀錄、場地規範、時段衝突）
-- 3. 審核通過或拒絕
-- 4. 要求補件或調整
-- 5. 通過後鎖定時段並流轉至付款狀態
-- 6. 產生審核意見紀錄
-- ============================================

-- ============================================
-- 1. 查詢待審核的申請（基本查詢）                   SEARCH_PENDING
-- ============================================
SELECT * 
FROM BOOKING 
WHERE status = 'Pending'
ORDER BY created_at ASC;

-- ============================================
-- 2. 查詢待審核申請（詳細資訊，包含申請人、場地等） SEARCH_PENDING_DETAIL
-- ============================================
SELECT 
    b.booking_id,
    b.purpose,
    b.date,
    b.start_time,
    b.end_time,
    b.people,
    b.amount_est,
    b.created_at,
    u.name AS applicant_name,
    u.email AS applicant_email,
	o.name as org_name,
    v.name AS venue_name,
    b.status
FROM BOOKING b
JOIN "USER" u ON b.user_id = u.user_id
JOIN VENUE v ON b.venue_id = v.venue_id
left JOIN org o using (org_id)
WHERE b.status = 'Pending'
ORDER BY b.created_at ASC;

-- ============================================
-- 3. 查看特定申請的審核歷史   SEARCH_PENDING_HISTORY
-- ============================================
SELECT 
    a.approval_id,
    a.step,
    a.decision,
    a.comment,
    a.decided_at,
    u.name AS approver_name
FROM APPROVAL a
JOIN "USER" u ON a.approver_id = u.user_id
WHERE a.booking_id = 2  -- 替換為實際的 booking_id
ORDER BY a.step ASC, a.decided_at ASC;

-- ============================================
-- 實用查詢：查看特定申請的完整資訊 or 特定id SEARCH_PENDING_DETAIL
-- ============================================
SELECT 
    b.booking_id,
    b.purpose,
    b.date,
    b.start_time,
    b.end_time,
    b.people,
    b.amount_est,
    b.deposit,
    b.status,
    u.name AS applicant_name,
    u.email AS applicant_email,
    u.phone AS applicant_phone,
    v.name AS venue_name,
    v.type AS venue_type,
    v.capacity AS venue_capacity,
    bv.name AS building_name,
    b.created_at AS booking_created_at
FROM BOOKING b
JOIN "USER" u ON b.user_id = u.user_id
JOIN VENUE v ON b.venue_id = v.venue_id
JOIN BUILDING bv ON v.building_id = bv.building_id
WHERE b.booking_id = 2;  -- 替換為實際的 booking_id

-- ============================================
-- 4 審核通过 approve_PENDING
-- ============================================
-- 這個範例展示完整的審核通過流程，包含所有步驟
BEGIN;

-- 步驟 1: 更新 BOOKING 狀態
UPDATE BOOKING 
SET status = 'Approved'
WHERE booking_id = 2  -- 替換為實際的 booking_id
  AND status = 'Pending';

-- 檢查是否有更新（在應用程式中檢查 affected_rows）
-- 如果 rowcount = 0，表示申請不存在或已被處理，應該 ROLLBACK

-- 步驟 2: 記錄審核
INSERT INTO APPROVAL (
    approval_id,
    booking_id,
    approver_id,
    step,
    decision,
    comment,
    decided_at
) VALUES (
    (SELECT COALESCE(MAX(approval_id), 0) + 1 FROM APPROVAL),
    2,  -- booking_id
    1,  -- approver_id
    1,  -- step
    'Approved',
    '符合使用規定，准予使用',
    NOW()
);

-- 步驟 3: 同步更新 BLOCKED_SLOT（標記時段已被占用）
INSERT INTO BLOCKED_SLOT (
    block_id,
    venue_id,
    date,
    start_time,
    end_time,
    reason
) 
SELECT 
    (SELECT COALESCE(MAX(block_id), 0) + 1 FROM BLOCKED_SLOT),
    venue_id,
    date,
    start_time,
    end_time,
    '已核准預約：' || purpose
FROM BOOKING
WHERE booking_id = 2;

-- 步驟 4: 建立 BOOKING_SLOT 切片（時段切段）
INSERT INTO BOOKING_SLOT (booking_id, venue_id, slot_start)
SELECT 
    b.booking_id,
    b.venue_id,
    generate_series(
        (b.date || ' ' || b.start_time)::TIMESTAMP,
        (b.date || ' ' || b.end_time)::TIMESTAMP - 
        (COALESCE(
            (SELECT slot_minute FROM TIMESLOT_RULE 
             WHERE venue_id = b.venue_id 
               AND weekday = EXTRACT(DOW FROM b.date)
             LIMIT 1),
            30
        ) || ' minutes')::INTERVAL,
        COALESCE(
            (SELECT slot_minute FROM TIMESLOT_RULE 
             WHERE venue_id = b.venue_id 
               AND weekday = EXTRACT(DOW FROM b.date)
             LIMIT 1),
            30
        ) || ' minutes'
    )::TIMESTAMP
FROM BOOKING b
WHERE b.booking_id = 2;

-- 如果一切正常，提交
COMMIT;

-- 如果有錯誤，回滾
-- ROLLBACK;
-- ============================================
-- 5. 審核拒絕（Rejected）  REJECT_PENDING
-- ============================================
BEGIN;

-- 步驟 1: 更新 BOOKING 狀態
UPDATE BOOKING 
SET status = 'Rejected'
WHERE booking_id = 5  -- 替換為實際的 booking_id
  AND status = 'Pending';

-- 步驟 2: 記錄到 APPROVAL 表
INSERT INTO APPROVAL (
    approval_id,
    booking_id,
    approver_id,
    step,
    decision,
    comment,
    decided_at
) VALUES (
    (SELECT COALESCE(MAX(approval_id), 0) + 1 FROM APPROVAL),
    5,  -- booking_id
    1,  -- approver_id
    1,  -- step
    'Rejected',
    '申請時間與其他活動衝突，不予核准',  -- 拒絕原因
    NOW()
);

-- 注意：拒絕時不需要更新 BLOCKED_SLOT，因為時段沒有被占用

COMMIT;



-- ============================================
-- 7. 多關卡審核範例（如果需要多層審核） MULTI_APPROVAL
-- ============================================
-- 第一關審核通過
BEGIN;

UPDATE BOOKING 
SET status = 'Pending'  -- 保持 Pending，等待下一關
WHERE booking_id = 3
  AND status = 'Pending';

INSERT INTO APPROVAL (
    approval_id,
    booking_id,
    approver_id,
    step,
    decision,
    comment,
    decided_at
) VALUES (
    (SELECT COALESCE(MAX(approval_id), 0) + 1 FROM APPROVAL),
    3,
    1,
    1,  -- 第一關
    'Approved',
    '第一關審核通過',
    NOW()
);

COMMIT;

-- 第二關審核通過（最終通過）
BEGIN;

UPDATE BOOKING 
SET status = 'Approved'  -- 最終通過
WHERE booking_id = 3
  AND status = 'Pending';

INSERT INTO APPROVAL (
    approval_id,
    booking_id,
    approver_id,
    step,
    decision,
    comment,
    decided_at
) VALUES (
    (SELECT COALESCE(MAX(approval_id), 0) + 1 FROM APPROVAL),
    3,
    1,
    2,  -- 第二關
    'Approved',
    '第二關審核通過',
    NOW()
);

-- ============================================
-- 8. 鎖定時段 ADD_BLOCKED_SLOT
-- ============================================
INSERT INTO BLOCKED_SLOT (
    block_id,
    venue_id,
    date,
    start_time,
    end_time,
    reason
) 
SELECT 
    (SELECT COALESCE(MAX(block_id), 0) + 1 FROM BLOCKED_SLOT),
    venue_id,
    date,
    start_time,
    end_time,
    '已核准預約：' || purpose
FROM BOOKING
WHERE booking_id = 3;

-- ============================================
-- 9. 建立 BOOKING_SLOT 切片（時段切段） ADD_BOOKING_SLOT
-- ============================================

INSERT INTO BOOKING_SLOT (booking_id, venue_id, slot_start)
SELECT 
    b.booking_id,
    b.venue_id,
    generate_series(
        (b.date || ' ' || b.start_time)::TIMESTAMP,
        (b.date || ' ' || b.end_time)::TIMESTAMP - 
        (COALESCE(
            (SELECT slot_minute FROM TIMESLOT_RULE 
             WHERE venue_id = b.venue_id 
               AND weekday = EXTRACT(DOW FROM b.date)
             LIMIT 1),
            30
        ) || ' minutes')::INTERVAL,
        COALESCE(
            (SELECT slot_minute FROM TIMESLOT_RULE 
             WHERE venue_id = b.venue_id 
               AND weekday = EXTRACT(DOW FROM b.date)
             LIMIT 1),
            30
        ) || ' minutes'
    )::TIMESTAMP
FROM BOOKING b
WHERE b.booking_id = 3;

COMMIT;

-- ============================================
-- 10. 查詢所有審核狀態的申請（管理員總覽） SEARCH_ALL_BOOKING_PROCESS
-- ============================================
SELECT 
    b.booking_id,
    b.purpose,
    b.date,
    b.status,
    u.name AS applicant_name,
    v.name AS venue_name,
    a.decision AS last_decision,
    a.decided_at AS last_decision_time
FROM BOOKING b
JOIN "USER" u ON b.user_id = u.user_id
JOIN VENUE v ON b.venue_id = v.venue_id
LEFT JOIN LATERAL (
    SELECT decision, decided_at
    FROM APPROVAL
    WHERE booking_id = b.booking_id
    ORDER BY decided_at DESC
    LIMIT 1
) a ON true
WHERE b.status IN ('Pending', 'Approved', 'Rejected')
ORDER BY b.created_at DESC;

-- ============================================
-- 審核前檢查項目
-- ============================================

-- ============================================
-- -- 11. 查詢某人黑名單 CHECK_BLACKLIST
-- -- ============================================
-- 注意：如果系統有黑名單表，請替換為實際的表名
-- 假設黑名單表結構：BLACKLIST (user_id, reason, blocked_until, status)
SELECT 
    b.booking_id,
    u.user_id,
    u.name AS applicant_name,
    u.email AS applicant_email,
    CASE 
        WHEN bl.user_id IS NOT NULL THEN '在黑名單中'
        ELSE '不在黑名單中'
    END AS blacklist_status,
    bl.reason AS blacklist_reason,
    bl.blocked_until
FROM BOOKING b
JOIN "USER" u ON b.user_id = u.user_id
LEFT JOIN BLACKLIST bl ON u.user_id = bl.user_id 
    AND (bl.blocked_until IS NULL OR bl.blocked_until > CURRENT_DATE)
    AND bl.status = 'Active'
WHERE b.booking_id = 2;  -- 替換為實際的 booking_id

-- -- ============================================
-- -- 7. 檢查申請人的違規紀錄
-- -- ============================================
-- -- 注意：如果系統有違規紀錄表，請替換為實際的表名
-- -- 假設違規紀錄表結構：VIOLATION (violation_id, user_id, booking_id, violation_type, description, created_at)
-- SELECT 
--     b.booking_id,
--     u.user_id,
--     u.name AS applicant_name,
--     COUNT(v.violation_id) AS violation_count,
--     MAX(v.created_at) AS last_violation_date
-- FROM BOOKING b
-- JOIN "USER" u ON b.user_id = u.user_id
-- LEFT JOIN VIOLATION v ON u.user_id = v.user_id
-- WHERE b.booking_id = 2  -- 替換為實際的 booking_id
-- GROUP BY b.booking_id, u.user_id, u.name;

-- ============================================
-- 11. 檢查場地規範（容量、開放狀態、設備需求） CHECK_VENUE_SPECIFICATION
-- ============================================
SELECT 
    b.booking_id,
    b.people AS requested_people,
    v.capacity AS venue_capacity,
    CASE 
        WHEN b.people > v.capacity THEN '超過場地容量'
        ELSE '符合場地容量'
    END AS capacity_check,
    v.open_status AS venue_status,
    CASE 
        WHEN v.open_status = 'Off' THEN '場地已關閉'
        ELSE '場地開放中'
    END AS venue_status_check,
    v.type AS venue_type,
    v.notes AS venue_notes
FROM BOOKING b
JOIN VENUE v ON b.venue_id = v.venue_id
WHERE b.booking_id = 2;  -- 替換為實際的 booking_id

-- ============================================
-- 12. 檢查時段衝突（與已核准的預約和保留時段） CHECK_TIME_CONFLICT
-- ============================================
SELECT 
    b.booking_id,
    b.venue_id,
    b.date,
    b.start_time,
    b.end_time,
    -- 檢查與已核准預約的衝突
    COUNT(DISTINCT approved.booking_id) AS conflict_with_approved,
    -- 檢查與保留時段的衝突
    COUNT(DISTINCT blocked.block_id) AS conflict_with_blocked
FROM BOOKING b
LEFT JOIN BOOKING approved ON 
    approved.venue_id = b.venue_id
    AND approved.date = b.date
    AND approved.status = 'Approved'
    AND approved.booking_id != b.booking_id
    AND (
        (approved.start_time <= b.start_time AND approved.end_time > b.start_time) OR
        (approved.start_time < b.end_time AND approved.end_time >= b.end_time) OR
        (approved.start_time >= b.start_time AND approved.end_time <= b.end_time)
    )
LEFT JOIN BLOCKED_SLOT blocked ON
    blocked.venue_id = b.venue_id
    AND blocked.date = b.date
    AND (
        (blocked.start_time <= b.start_time AND blocked.end_time > b.start_time) OR
        (blocked.start_time < b.end_time AND blocked.end_time >= b.end_time) OR
        (blocked.start_time >= b.start_time AND blocked.end_time <= b.end_time)
    )
WHERE b.booking_id = 2  -- 替換為實際的 booking_id
GROUP BY b.booking_id, b.venue_id, b.date, b.start_time, b.end_time;

-- ============================================
-- 13. 檢查場地開放時間規則 CHECK_TIME_RULE
-- ============================================
SELECT 
    b.booking_id,
    b.date,
    b.start_time,
    b.end_time,
    EXTRACT(DOW FROM b.date) AS weekday,  -- 0=Sunday, 1=Monday, ..., 6=Saturday
    tr.open_time AS venue_open_time,
    tr.close_time AS venue_close_time,
    CASE 
        WHEN b.start_time < tr.open_time THEN '開始時間早於場地開放時間'
        WHEN b.end_time > tr.close_time THEN '結束時間晚於場地關閉時間'
        ELSE '符合開放時間規則'
    END AS time_rule_check
FROM BOOKING b
JOIN VENUE v ON b.venue_id = v.venue_id
LEFT JOIN TIMESLOT_RULE tr ON 
    tr.venue_id = v.venue_id
    AND tr.weekday = EXTRACT(DOW FROM b.date)
WHERE b.booking_id = 2;  -- 替換為實際的 booking_id

-- ============================================
-- 14. 檢查設備需求是否滿足 CHECK_EQUIPMENT_REQUIREMENT
-- ============================================
SELECT 
    be.booking_id,
    be.equip_id,
    e.name AS equipment_name,
    be.qty AS requested_qty,
    ve.stock_qty AS available_qty,
    CASE 
        WHEN be.qty > ve.stock_qty THEN '設備數量不足'
        ELSE '設備數量充足'
    END AS equipment_check
FROM BOOKING_EQUIP be
JOIN EQUIPMENT e ON be.equip_id = e.equip_id
JOIN BOOKING b ON be.booking_id = b.booking_id
LEFT JOIN VENUE_EQUIP ve ON 
    ve.venue_id = b.venue_id 
    AND ve.equip_id = be.equip_id
WHERE be.booking_id = 2;  -- 替換為實際的 booking_id

-- ============================================
-- 15. 綜合審核檢查（所有檢查項目彙總） COMPREHENSIVE_APPROVAL_CHECK
-- ============================================
SELECT 
    b.booking_id,
    b.purpose,
    b.date,
    b.start_time,
    b.end_time,
    u.name AS applicant_name,
    v.name AS venue_name,
    -- 黑名單檢查
    CASE WHEN bl.user_id IS NOT NULL THEN '⚠️ 申請人在黑名單中' ELSE '✓' END AS blacklist_check,
    -- 容量檢查
    CASE WHEN b.people > v.capacity THEN '⚠️ 超過場地容量' ELSE '✓' END AS capacity_check,
    -- 場地狀態檢查
    CASE WHEN v.open_status = 'Off' THEN '⚠️ 場地已關閉' ELSE '✓' END AS venue_status_check,
    -- 時段衝突檢查
    CASE 
        WHEN EXISTS (
            SELECT 1 FROM BOOKING approved
            WHERE approved.venue_id = b.venue_id
            AND approved.date = b.date
            AND approved.status = 'Approved'
            AND approved.booking_id != b.booking_id
            AND (
                (approved.start_time <= b.start_time AND approved.end_time > b.start_time) OR
                (approved.start_time < b.end_time AND approved.end_time >= b.end_time) OR
                (approved.start_time >= b.start_time AND approved.end_time <= b.end_time)
            )
        ) THEN '⚠️ 時段衝突'
        ELSE '✓'
    END AS conflict_check
FROM BOOKING b
JOIN "USER" u ON b.user_id = u.user_id
JOIN VENUE v ON b.venue_id = v.venue_id
LEFT JOIN BLACKLIST bl ON u.user_id = bl.user_id 
    AND (bl.blocked_until IS NULL OR bl.blocked_until > CURRENT_DATE)
    AND bl.status = 'Active'
WHERE b.booking_id = 2  -- 替換為實際的 booking_id
  AND b.status = 'Pending';

-- ============================================
-- 13. 要求補件或調整（更新狀態為 Draft，並記錄審核意見）
-- ============================================
BEGIN;

-- 步驟 1: 將狀態改回 Draft，讓申請人可以修改
UPDATE BOOKING 
SET status = 'Draft'
WHERE booking_id = 2  -- 替換為實際的 booking_id
  AND status = 'Pending';

-- 步驟 2: 記錄審核意見（要求補件）
INSERT INTO APPROVAL (
    approval_id,
    booking_id,
    approver_id,
    step,
    decision,
    comment,
    decided_at
) VALUES (
    (SELECT COALESCE(MAX(approval_id), 0) + 1 FROM APPROVAL),
    2,  -- booking_id
    1,  -- approver_id
    1,  -- step
    'Pending',  -- 保持 Pending 狀態，表示需要補件
    '請補充活動詳細說明文件，並確認參與人數不超過場地容量',  -- 補件要求
    NOW()
);

COMMIT;

-- ============================================
-- 14. 審核通過後流轉至付款狀態（如果需要先付款）
-- ============================================
BEGIN;

-- 步驟 1: 更新 BOOKING 狀態為 Approved（或自訂的待付款狀態）
UPDATE BOOKING 
SET status = 'Approved'  -- 或使用 'PendingPayment' 如果系統有這個狀態
WHERE booking_id = 2
  AND status = 'Pending';

-- 步驟 2: 記錄審核
INSERT INTO APPROVAL (
    approval_id,
    booking_id,
    approver_id,
    step,
    decision,
    comment,
    decided_at
) VALUES (
    (SELECT COALESCE(MAX(approval_id), 0) + 1 FROM APPROVAL),
    2,
    1,
    1,
    'Approved',
    '審核通過，請於指定時間內完成付款',
    NOW()
);

-- 步驟 3: 鎖定時段
INSERT INTO BLOCKED_SLOT (
    block_id,
    venue_id,
    date,
    start_time,
    end_time,
    reason
) 
SELECT 
    (SELECT COALESCE(MAX(block_id), 0) + 1 FROM BLOCKED_SLOT),
    venue_id,
    date,
    start_time,
    end_time,
    '已核准預約：' || purpose
FROM BOOKING
WHERE booking_id = 2;

-- 步驟 4: 建立 BOOKING_SLOT 切片（時段切段）
INSERT INTO BOOKING_SLOT (booking_id, venue_id, slot_start)
SELECT 
    b.booking_id,
    b.venue_id,
    generate_series(
        (b.date || ' ' || b.start_time)::TIMESTAMP,
        (b.date || ' ' || b.end_time)::TIMESTAMP - 
        (COALESCE(
            (SELECT slot_minute FROM TIMESLOT_RULE 
             WHERE venue_id = b.venue_id 
               AND weekday = EXTRACT(DOW FROM b.date)
             LIMIT 1),
            30
        ) || ' minutes')::INTERVAL,
        COALESCE(
            (SELECT slot_minute FROM TIMESLOT_RULE 
             WHERE venue_id = b.venue_id 
               AND weekday = EXTRACT(DOW FROM b.date)
             LIMIT 1),
            30
        ) || ' minutes'
    )::TIMESTAMP
FROM BOOKING b
WHERE b.booking_id = 2;

-- 步驟 5: 建立付款記錄（如果需要）
-- INSERT INTO PAYMENT (
--     payment_id,
--     booking_id,
--     method,
--     amount,
--     type,
--     status,
--     created_at
-- ) VALUES (
--     (SELECT COALESCE(MAX(payment_id), 0) + 1 FROM PAYMENT),
--     2,
--     NULL,  -- 待選擇付款方式
--     (SELECT amount_est FROM BOOKING WHERE booking_id = 2),
--     'Rent',
--     'Pending',
--     NOW()
-- );

COMMIT;

-- ============================================
-- 15. 統計審核資料
-- ============================================
-- 待審核數量
SELECT COUNT(*) AS pending_count
FROM BOOKING
WHERE status = 'Pending';

-- 各狀態統計
SELECT 
    status,
    COUNT(*) AS count
FROM BOOKING
GROUP BY status;

-- 審核通過率
SELECT 
    COUNT(CASE WHEN decision = 'Approved' THEN 1 END) * 100.0 / 
    COUNT(CASE WHEN decision IN ('Approved', 'Rejected') THEN 1 END) AS approval_rate
FROM APPROVAL
WHERE decided_at IS NOT NULL;




