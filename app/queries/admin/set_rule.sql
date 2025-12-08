-- ============================================
-- 規則與資源設定
-- 功能：維護時段規則、臨時阻擋、費率方案、設備加價規則、場地設備庫存
-- ============================================

-- ============================================
-- 1. TIMESLOT_RULE（可租時段規則）
-- ============================================

-- ============================================
-- 1.1 查看所有時段規則  ACTION: SEARCH_TIMESLOT_RULE_ALL
-- ============================================
SELECT 
    tr.rule_id,
    tr.venue_id,
    v.name AS venue_name,
    CASE tr.weekday
        WHEN 0 THEN '週日'
        WHEN 1 THEN '週一'
        WHEN 2 THEN '週二'
        WHEN 3 THEN '週三'
        WHEN 4 THEN '週四'
        WHEN 5 THEN '週五'
        WHEN 6 THEN '週六'
    END AS weekday_name,
    tr.weekday,
    tr.open_time,
    tr.close_time,
    tr.slot_minute
FROM TIMESLOT_RULE tr
JOIN VENUE v ON tr.venue_id = v.venue_id
ORDER BY tr.venue_id, tr.weekday;

-- ============================================
-- 1.2 查看特定場地的時段規則  ACTION: SEARCH_TIMESLOT_RULE_BY_VENUE
-- ============================================
SELECT 
    tr.rule_id,
    v.name AS venue_name,
    CASE tr.weekday
        WHEN 0 THEN '週日'
        WHEN 1 THEN '週一'
        WHEN 2 THEN '週二'
        WHEN 3 THEN '週三'
        WHEN 4 THEN '週四'
        WHEN 5 THEN '週五'
        WHEN 6 THEN '週六'
    END AS weekday_name,
    tr.weekday,
    tr.open_time,
    tr.close_time,
    tr.slot_minute
FROM TIMESLOT_RULE tr
JOIN VENUE v ON tr.venue_id = v.venue_id
WHERE tr.venue_id = @venue_id  -- 替換為實際的場地ID，例如：WHERE tr.venue_id = 1
ORDER BY tr.weekday;

-- ============================================
-- 1.3 新增時段規則  ACTION: ADD_TIMESLOT_RULE
-- ============================================
-- 參數說明：
--   @venue_id: 場地ID
--   @weekday: 星期幾（0=週日, 1=週一, ..., 6=週六）
--   @open_time: 開放時間（格式：'HH:MM:SS'）
--   @close_time: 關閉時間（格式：'HH:MM:SS'）
--   @slot_minute: 時段單位（分鐘，預設30）
INSERT INTO TIMESLOT_RULE (
    rule_id,
    venue_id,
    weekday,
    open_time,
    close_time,
    slot_minute
) VALUES (
    (SELECT COALESCE(MAX(rule_id), 0) + 1 FROM TIMESLOT_RULE),
    @venue_id,  -- 替換為實際的場地ID，例如：1
    @weekday,  -- 替換為實際的星期幾，例如：1（週一）
    @open_time,  -- 替換為實際的開放時間，例如：'08:00:00'
    @close_time,  -- 替換為實際的關閉時間，例如：'22:00:00'
    COALESCE(@slot_minute, 30)  -- 替換為實際的時段單位，例如：30
);

-- 範例：新增週一到週五 08:00-22:00，30分鐘時段
-- INSERT INTO TIMESLOT_RULE (
--     rule_id,
--     venue_id,
--     weekday,
--     open_time,
--     close_time,
--     slot_minute
-- ) VALUES (
--     (SELECT COALESCE(MAX(rule_id), 0) + 1 FROM TIMESLOT_RULE),
--     1,  -- venue_id
--     1,  -- 週一
--     '08:00:00',
--     '22:00:00',
--     30
-- );

-- ============================================
-- 1.4 更新時段規則  ACTION: UPDATE_TIMESLOT_RULE
-- ============================================
-- 參數說明：
--   @rule_id: 規則ID
--   @open_time: 新的開放時間（可選）
--   @close_time: 新的關閉時間（可選）
--   @slot_minute: 新的時段單位（可選）
UPDATE TIMESLOT_RULE
SET 
    open_time = COALESCE(@open_time, open_time),
    close_time = COALESCE(@close_time, close_time),
    slot_minute = COALESCE(@slot_minute, slot_minute)
WHERE rule_id = @rule_id;  -- 替換為實際的規則ID，例如：WHERE rule_id = 1

-- 範例：更新規則ID為1的時段規則
-- UPDATE TIMESLOT_RULE
-- SET 
--     open_time = '09:00:00',
--     close_time = '21:00:00',
--     slot_minute = 60
-- WHERE rule_id = 1;

-- ============================================
-- 1.5 刪除時段規則  ACTION: DELETE_TIMESLOT_RULE
-- ============================================
-- DELETE FROM TIMESLOT_RULE
-- WHERE rule_id = @rule_id;  -- 替換為實際的規則ID

-- ============================================
-- 2. BLOCKED_SLOT（臨時阻擋/保留）
-- ============================================

-- ============================================
-- 2.1 查看所有臨時阻擋  ACTION: SEARCH_BLOCKED_SLOT_ALL
-- ============================================
SELECT 
    bs.block_id,
    bs.venue_id,
    v.name AS venue_name,
    bs.date,
    bs.start_time,
    bs.end_time,
    bs.reason,
    CASE 
        WHEN bs.date < CURRENT_DATE THEN '已過期'
        WHEN bs.date = CURRENT_DATE AND bs.end_time < CURRENT_TIME THEN '今日已過期'
        ELSE '有效'
    END AS status
FROM BLOCKED_SLOT bs
JOIN VENUE v ON bs.venue_id = v.venue_id
ORDER BY bs.date DESC, bs.start_time;

-- ============================================
-- 2.2 查看特定場地的臨時阻擋  ACTION: SEARCH_BLOCKED_SLOT_BY_VENUE
-- ============================================
SELECT 
    bs.block_id,
    v.name AS venue_name,
    bs.date,
    bs.start_time,
    bs.end_time,
    bs.reason
FROM BLOCKED_SLOT bs
JOIN VENUE v ON bs.venue_id = v.venue_id
WHERE bs.venue_id = @venue_id  -- 替換為實際的場地ID
  AND bs.date >= CURRENT_DATE  -- 只顯示未過期的
ORDER BY bs.date, bs.start_time;

-- ============================================
-- 2.3 建立臨時阻擋  ACTION: ADD_BLOCKED_SLOT
-- ============================================
-- 參數說明：
--   @venue_id: 場地ID
--   @date: 阻擋日期（格式：'YYYY-MM-DD'）
--   @start_time: 開始時間（格式：'HH:MM:SS'）
--   @end_time: 結束時間（格式：'HH:MM:SS'）
--   @reason: 阻擋原因
INSERT INTO BLOCKED_SLOT (
    block_id,
    venue_id,
    date,
    start_time,
    end_time,
    reason
) VALUES (
    (SELECT COALESCE(MAX(block_id), 0) + 1 FROM BLOCKED_SLOT),
    @venue_id,  -- 替換為實際的場地ID，例如：1
    @date,  -- 替換為實際的日期，例如：'2025-01-15'
    @start_time,  -- 替換為實際的開始時間，例如：'10:00:00'
    @end_time,  -- 替換為實際的結束時間，例如：'12:00:00'
    @reason  -- 替換為實際的原因，例如：'場地維修'
);

-- 範例：建立臨時阻擋
-- INSERT INTO BLOCKED_SLOT (
--     block_id,
--     venue_id,
--     date,
--     start_time,
--     end_time,
--     reason
-- ) VALUES (
--     (SELECT COALESCE(MAX(block_id), 0) + 1 FROM BLOCKED_SLOT),
--     1,  -- venue_id
--     '2025-01-15',  -- date
--     '10:00:00',  -- start_time
--     '12:00:00',  -- end_time
--     '場地維修'  -- reason
-- );

-- ============================================
-- 2.4 刪除臨時阻擋  ACTION: DELETE_BLOCKED_SLOT
-- ============================================
-- DELETE FROM BLOCKED_SLOT
-- WHERE block_id = @block_id;  -- 替換為實際的阻擋ID

-- ============================================
-- 3. 費率方案管理（RATE_PLAN / RATE_VERSION / PRICE_RULE）
-- ============================================

-- ============================================
-- 3.1 查看所有費率方案  ACTION: SEARCH_RATE_PLAN_ALL
-- ============================================
SELECT 
    rp.plan_id,
    rp.venue_id,
    v.name AS venue_name,
    rp.name AS plan_name,
    rp.status,
    COUNT(DISTINCT rv.version_id) AS version_count,
    MAX(rv.effective_from) AS latest_version_date
FROM RATE_PLAN rp
JOIN VENUE v ON rp.venue_id = v.venue_id
LEFT JOIN RATE_VERSION rv ON rp.plan_id = rv.plan_id
GROUP BY rp.plan_id, rp.venue_id, v.name, rp.name, rp.status
ORDER BY rp.venue_id, rp.plan_id;

-- ============================================
-- 3.2 查看特定場地的費率方案  ACTION: SEARCH_RATE_PLAN_BY_VENUE
-- ============================================
SELECT 
    rp.plan_id,
    rp.name AS plan_name,
    rp.status,
    rv.version_id,
    rv.effective_from,
    rv.effective_to,
    rv.created_at
FROM RATE_PLAN rp
LEFT JOIN RATE_VERSION rv ON rp.plan_id = rv.plan_id
WHERE rp.venue_id = @venue_id  -- 替換為實際的場地ID
ORDER BY rv.effective_from DESC;

-- ============================================
-- 3.3 查看費率方案的詳細價格規則  ACTION: SEARCH_PRICE_RULE_BY_PLAN
-- ============================================
SELECT 
    rp.plan_id,
    rp.name AS plan_name,
    rv.version_id,
    rv.effective_from,
    rv.effective_to,
    pr.price_id,
    pr.affiliation,
    pr.day_type,
    pr.start_time,
    pr.end_time,
    pr.base_fee_per_hour,
    pr.min_hours,
    pr.step_minute,
    pr.peak_surcharge_pct,
    pr.deposit_required_bool,
    pr.deposit_amount
FROM RATE_PLAN rp
JOIN RATE_VERSION rv ON rp.plan_id = rv.plan_id
LEFT JOIN PRICE_RULE pr ON rv.version_id = pr.version_id
WHERE rp.plan_id = @plan_id  -- 替換為實際的方案ID
ORDER BY rv.effective_from DESC, pr.affiliation, pr.day_type, pr.start_time;

-- ============================================
-- 3.4 建立新的費率方案  ACTION: ADD_RATE_PLAN
-- ============================================
-- 參數說明：
--   @venue_id: 場地ID
--   @plan_name: 方案名稱
--   @status: 狀態（'On' 或 'Off'，預設 'On'）
INSERT INTO RATE_PLAN (
    plan_id,
    venue_id,
    name,
    status
) VALUES (
    (SELECT COALESCE(MAX(plan_id), 0) + 1 FROM RATE_PLAN),
    @venue_id,  -- 替換為實際的場地ID
    @plan_name,  -- 替換為實際的方案名稱，例如：'標準方案'
    COALESCE(@status, 'On')  -- 狀態，預設 'On'
);

-- 範例：建立新的費率方案
-- INSERT INTO RATE_PLAN (
--     plan_id,
--     venue_id,
--     name,
--     status
-- ) VALUES (
--     (SELECT COALESCE(MAX(plan_id), 0) + 1 FROM RATE_PLAN),
--     1,  -- venue_id
--     '標準方案',  -- plan_name
--     'On'  -- status
-- );

-- ============================================
-- 3.5 建立費率版本  ACTION: ADD_RATE_VERSION
-- ============================================
-- 參數說明：
--   @plan_id: 方案ID
--   @effective_from: 生效日期（格式：'YYYY-MM-DD'）
--   @effective_to: 失效日期（格式：'YYYY-MM-DD'，可為 NULL 表示永久有效）
INSERT INTO RATE_VERSION (
    version_id,
    plan_id,
    effective_from,
    effective_to,
    created_at
) VALUES (
    (SELECT COALESCE(MAX(version_id), 0) + 1 FROM RATE_VERSION),
    @plan_id,  -- 替換為實際的方案ID
    @effective_from,  -- 替換為實際的生效日期，例如：'2025-01-01'
    @effective_to,  -- 替換為實際的失效日期，例如：NULL 或 '2025-12-31'
    NOW()
);

-- 範例：建立費率版本
-- INSERT INTO RATE_VERSION (
--     version_id,
--     plan_id,
--     effective_from,
--     effective_to,
--     created_at
-- ) VALUES (
--     (SELECT COALESCE(MAX(version_id), 0) + 1 FROM RATE_VERSION),
--     1,  -- plan_id
--     '2025-01-01',  -- effective_from
--     NULL,  -- effective_to（永久有效）
--     NOW()
-- );

-- ============================================
-- 3.6 建立價格規則  ACTION: ADD_PRICE_RULE
-- ============================================
-- 參數說明：
--   @version_id: 版本ID
--   @affiliation: 身份（'Internal', 'External', 'Alumni'）
--   @day_type: 日型（'Weekday', 'Weekend', 'Holiday'）
--   @start_time: 開始時間（格式：'HH:MM:SS'）
--   @end_time: 結束時間（格式：'HH:MM:SS'）
--   @base_fee_per_hour: 每小時基本費用
--   @min_hours: 最少租借時數
--   @step_minute: 計費單位（分鐘）
--   @peak_surcharge_pct: 尖峰加價百分比（可選）
--   @deposit_required_bool: 是否需要押金（true/false）
--   @deposit_amount: 押金金額（可選）
INSERT INTO PRICE_RULE (
    price_id,
    version_id,
    affiliation,
    day_type,
    start_time,
    end_time,
    base_fee_per_hour,
    min_hours,
    step_minute,
    peak_surcharge_pct,
    deposit_required_bool,
    deposit_amount
) VALUES (
    (SELECT COALESCE(MAX(price_id), 0) + 1 FROM PRICE_RULE),
    @version_id,  -- 替換為實際的版本ID
    @affiliation,  -- 替換為實際的身份，例如：'Internal'
    @day_type,  -- 替換為實際的日型，例如：'Weekday'
    @start_time,  -- 替換為實際的開始時間，例如：'08:00:00'
    @end_time,  -- 替換為實際的結束時間，例如：'18:00:00'
    @base_fee_per_hour,  -- 替換為實際的每小時費用，例如：500.00
    COALESCE(@min_hours, 1),  -- 最少租借時數，預設1
    COALESCE(@step_minute, 30),  -- 計費單位，預設30分鐘
    @peak_surcharge_pct,  -- 尖峰加價百分比，可為 NULL
    COALESCE(@deposit_required_bool, false),  -- 是否需要押金，預設 false
    @deposit_amount  -- 押金金額，可為 NULL
);

-- 範例：建立價格規則
-- INSERT INTO PRICE_RULE (
--     price_id,
--     version_id,
--     affiliation,
--     day_type,
--     start_time,
--     end_time,
--     base_fee_per_hour,
--     min_hours,
--     step_minute,
--     peak_surcharge_pct,
--     deposit_required_bool,
--     deposit_amount
-- ) VALUES (
--     (SELECT COALESCE(MAX(price_id), 0) + 1 FROM PRICE_RULE),
--     1,  -- version_id
--     'Internal',  -- affiliation
--     'Weekday',  -- day_type
--     '08:00:00',  -- start_time
--     '18:00:00',  -- end_time
--     500.00,  -- base_fee_per_hour
--     1,  -- min_hours
--     30,  -- step_minute
--     NULL,  -- peak_surcharge_pct
--     false,  -- deposit_required_bool
--     NULL  -- deposit_amount
-- );

-- ============================================
-- 3.7 更新費率方案狀態  ACTION: UPDATE_RATE_PLAN_STATUS
-- ============================================
-- UPDATE RATE_PLAN
-- SET status = @status  -- 'On' 或 'Off'
-- WHERE plan_id = @plan_id;  -- 替換為實際的方案ID

-- ============================================
-- 4. VENUE_EQUIP（場地設備庫存）
-- ============================================

-- ============================================
-- 4.1 查看所有場地的設備庫存  ACTION: SEARCH_VENUE_EQUIP_ALL
-- ============================================
SELECT 
    ve.venue_id,
    v.name AS venue_name,
    ve.equip_id,
    e.name AS equipment_name,
    e.category,
    e.unit,
    ve.stock_qty AS current_stock,
    ve.default_on_bool AS default_included
FROM VENUE_EQUIP ve
JOIN VENUE v ON ve.venue_id = v.venue_id
JOIN EQUIPMENT e ON ve.equip_id = e.equip_id
ORDER BY ve.venue_id, e.name;

-- ============================================
-- 4.2 查看特定場地的設備庫存  ACTION: SEARCH_VENUE_EQUIP_BY_VENUE
-- ============================================
SELECT 
    ve.equip_id,
    e.name AS equipment_name,
    e.category,
    e.unit,
    e.status AS equipment_status,
    ve.stock_qty AS current_stock,
    ve.default_on_bool AS default_included
FROM VENUE_EQUIP ve
JOIN EQUIPMENT e ON ve.equip_id = e.equip_id
WHERE ve.venue_id = @venue_id  -- 替換為實際的場地ID
ORDER BY e.name;

-- ============================================
-- 4.3 更新設備庫存數量  ACTION: UPDATE_VENUE_EQUIP_STOCK
-- ============================================
-- 參數說明：
--   @venue_id: 場地ID
--   @equip_id: 設備ID
--   @stock_qty: 新的庫存數量
UPDATE VENUE_EQUIP
SET stock_qty = @stock_qty  -- 替換為實際的庫存數量，例如：10
WHERE venue_id = @venue_id  -- 替換為實際的場地ID
  AND equip_id = @equip_id;  -- 替換為實際的設備ID

-- 範例：更新庫存數量
-- UPDATE VENUE_EQUIP
-- SET stock_qty = 10
-- WHERE venue_id = 1
--   AND equip_id = 1;

-- ============================================
-- 4.4 新增場地設備（如果不存在）  ACTION: ADD_VENUE_EQUIP
-- ============================================
-- 參數說明：
--   @venue_id: 場地ID
--   @equip_id: 設備ID
--   @stock_qty: 庫存數量（預設0）
--   @default_on_bool: 是否預設包含（預設false）
INSERT INTO VENUE_EQUIP (
    venue_id,
    equip_id,
    stock_qty,
    default_on_bool
) VALUES (
    @venue_id,  -- 替換為實際的場地ID
    @equip_id,  -- 替換為實際的設備ID
    COALESCE(@stock_qty, 0),  -- 庫存數量，預設0
    COALESCE(@default_on_bool, false)  -- 是否預設包含，預設false
)
ON CONFLICT (venue_id, equip_id) DO UPDATE
SET stock_qty = EXCLUDED.stock_qty;

-- 範例：新增場地設備
-- INSERT INTO VENUE_EQUIP (
--     venue_id,
--     equip_id,
--     stock_qty,
--     default_on_bool
-- ) VALUES (
--     1,  -- venue_id
--     1,  -- equip_id
--     5,  -- stock_qty
--     true  -- default_on_bool
-- )
-- ON CONFLICT (venue_id, equip_id) DO UPDATE
-- SET stock_qty = EXCLUDED.stock_qty;

-- ============================================
-- 4.5 更新設備預設包含狀態  ACTION: UPDATE_VENUE_EQUIP_DEFAULT
-- ============================================
-- UPDATE VENUE_EQUIP
-- SET default_on_bool = @default_on_bool  -- true 或 false
-- WHERE venue_id = @venue_id
--   AND equip_id = @equip_id;

-- ============================================
-- 5. EQUIP_PRICE_RULE（設備加價規則）
-- ============================================

-- ============================================
-- 5.1 查看所有設備加價規則  ACTION: SEARCH_EQUIP_PRICE_RULE_ALL
-- ============================================
SELECT 
    epr.eprice_id,
    rv.version_id,
    rp.plan_id,
    rp.name AS plan_name,
    epr.equip_id,
    e.name AS equipment_name,
    epr.affiliation,
    epr.unit_price,
    epr.unit
FROM EQUIP_PRICE_RULE epr
JOIN RATE_VERSION rv ON epr.version_id = rv.version_id
JOIN RATE_PLAN rp ON rv.plan_id = rp.plan_id
JOIN EQUIPMENT e ON epr.equip_id = e.equip_id
ORDER BY rp.plan_id, epr.equip_id, epr.affiliation;

-- ============================================
-- 5.2 查看特定費率版本的設備加價規則  ACTION: SEARCH_EQUIP_PRICE_RULE_BY_VERSION
-- ============================================
SELECT 
    epr.eprice_id,
    epr.equip_id,
    e.name AS equipment_name,
    e.category,
    epr.affiliation,
    epr.unit_price,
    epr.unit
FROM EQUIP_PRICE_RULE epr
JOIN EQUIPMENT e ON epr.equip_id = e.equip_id
WHERE epr.version_id = @version_id  -- 替換為實際的版本ID
ORDER BY epr.equip_id, epr.affiliation;

-- ============================================
-- 5.3 查看特定場地的設備加價規則（當前有效版本）  ACTION: SEARCH_EQUIP_PRICE_RULE_BY_VENUE
-- ============================================
SELECT 
    epr.eprice_id,
    epr.equip_id,
    e.name AS equipment_name,
    epr.affiliation,
    epr.unit_price,
    epr.unit,
    rv.effective_from,
    rv.effective_to
FROM EQUIP_PRICE_RULE epr
JOIN RATE_VERSION rv ON epr.version_id = rv.version_id
JOIN RATE_PLAN rp ON rv.plan_id = rp.plan_id
JOIN EQUIPMENT e ON epr.equip_id = e.equip_id
WHERE rp.venue_id = @venue_id  -- 替換為實際的場地ID
  AND rv.effective_from <= CURRENT_DATE
  AND (rv.effective_to IS NULL OR rv.effective_to >= CURRENT_DATE)
ORDER BY epr.equip_id, epr.affiliation;

-- ============================================
-- 5.4 建立設備加價規則  ACTION: ADD_EQUIP_PRICE_RULE
-- ============================================
-- 參數說明：
--   @version_id: 版本ID
--   @equip_id: 設備ID
--   @affiliation: 身份（'Internal', 'External', 'Alumni'）
--   @unit_price: 單價
--   @unit: 計費單位（'PerHour' 或 'PerUse'，預設 'PerHour'）
INSERT INTO EQUIP_PRICE_RULE (
    eprice_id,
    version_id,
    equip_id,
    affiliation,
    unit_price,
    unit
) VALUES (
    (SELECT COALESCE(MAX(eprice_id), 0) + 1 FROM EQUIP_PRICE_RULE),
    @version_id,  -- 替換為實際的版本ID
    @equip_id,  -- 替換為實際的設備ID
    @affiliation,  -- 替換為實際的身份，例如：'Internal'
    @unit_price,  -- 替換為實際的單價，例如：200.00
    COALESCE(@unit, 'PerHour')  -- 計費單位，預設 'PerHour'
);

-- 範例：建立設備加價規則
-- INSERT INTO EQUIP_PRICE_RULE (
--     eprice_id,
--     version_id,
--     equip_id,
--     affiliation,
--     unit_price,
--     unit
-- ) VALUES (
--     (SELECT COALESCE(MAX(eprice_id), 0) + 1 FROM EQUIP_PRICE_RULE),
--     1,  -- version_id
--     1,  -- equip_id（投影機）
--     'Internal',  -- affiliation
--     200.00,  -- unit_price
--     'PerHour'  -- unit
-- );

-- ============================================
-- 5.5 更新設備加價規則  ACTION: UPDATE_EQUIP_PRICE_RULE
-- ============================================
-- 參數說明：
--   @eprice_id: 規則ID
--   @unit_price: 新的單價（可選）
--   @unit: 新的計費單位（可選）
UPDATE EQUIP_PRICE_RULE
SET 
    unit_price = COALESCE(@unit_price, unit_price),
    unit = COALESCE(@unit, unit)
WHERE eprice_id = @eprice_id;  -- 替換為實際的規則ID

-- 範例：更新設備加價規則
-- UPDATE EQUIP_PRICE_RULE
-- SET 
--     unit_price = 250.00,
--     unit = 'PerHour'
-- WHERE eprice_id = 1;

-- ============================================
-- 5.6 刪除設備加價規則  ACTION: DELETE_EQUIP_PRICE_RULE
-- ============================================
-- DELETE FROM EQUIP_PRICE_RULE
-- WHERE eprice_id = @eprice_id;  -- 替換為實際的規則ID

-- ============================================
-- 實用查詢：查看場地完整設定（時段規則、費率方案、設備庫存）
-- ============================================
SELECT 
    v.venue_id,
    v.name AS venue_name,
    v.type AS venue_type,
    v.capacity,
    v.open_status,
    -- 時段規則統計
    COUNT(DISTINCT tr.rule_id) AS timeslot_rule_count,
    -- 費率方案統計
    COUNT(DISTINCT rp.plan_id) AS rate_plan_count,
    -- 設備庫存統計
    COUNT(DISTINCT ve.equip_id) AS equipment_count,
    SUM(ve.stock_qty) AS total_equipment_stock
FROM VENUE v
LEFT JOIN TIMESLOT_RULE tr ON v.venue_id = tr.venue_id
LEFT JOIN RATE_PLAN rp ON v.venue_id = rp.venue_id
LEFT JOIN VENUE_EQUIP ve ON v.venue_id = ve.venue_id
GROUP BY v.venue_id, v.name, v.type, v.capacity, v.open_status
ORDER BY v.venue_id;

