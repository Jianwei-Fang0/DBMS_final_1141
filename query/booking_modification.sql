-- ============================================
-- 訂單異動與差額處理
-- 功能：修改訂單時段、重算金額、產生補收或退款
-- ============================================

-- ============================================
-- 1. 訂單異動完整流程（使用 Transaction）
-- ============================================
-- 參數說明：
--   @booking_id: 要修改的訂單 ID
--   @new_date: 新的日期
--   @new_start_time: 新的開始時間
--   @new_end_time: 新的結束時間
--   @new_venue_id: 新的場地 ID（可選，如果改場地）
    @ new_people: 新的參加人數
--   @require_reapproval: 是否需要重新審核（根據規則決定）

-- 範例：修改訂單 2 的時段
DO $$
DECLARE
    ===== 都要自己調整 =====
    v_booking_id BIGINT := 2;  -- 要修改的訂單 ID 要自己條
    v_new_date DATE := '2025-01-20';  -- 新日期
    v_new_start_time TIME := '14:00:00';  -- 新開始時間
    v_new_end_time TIME := '17:00:00';  -- 新結束時間
    v_new_venue_id BIGINT := NULL;  -- 新場地 ID（NULL 表示不改場地）
    v_new_amount NUMERIC(10,2); 
    v_new_people INT = NULL;
    ===== 分割線 =====
    v_old_people INT;
    v_old_date DATE;
    v_old_start_time TIME;
    v_old_end_time TIME;
    v_old_venue_id BIGINT;
    v_old_amount NUMERIC(10,2);
    v_amount_diff NUMERIC(10,2);
    v_status VARCHAR(12);
    v_is_slot_locked BOOLEAN := false;
    v_weekday SMALLINT;
BEGIN
    -- 步驟 1: 取得原訂單資訊
    SELECT date, start_time, end_time, venue_id, amount_est, status, people
    INTO v_old_date, v_old_start_time, v_old_end_time, v_old_venue_id, v_old_amount, v_status, v_old_people
    FROM BOOKING
    WHERE booking_id = v_booking_id;
    
    -- 如果沒找到訂單，拋出錯誤
    IF v_old_date IS NULL THEN
        RAISE EXCEPTION '訂單不存在: %', v_booking_id;
    END IF;
    
    -- -- 如果訂單狀態不允許修改  ##都能修改
    -- IF v_status NOT IN ('Approved', 'Draft', 'Pending') THEN
    --     RAISE EXCEPTION '訂單狀態不允許修改: %', v_status;
    -- END IF;
    
    -- 如果沒指定新場地，使用原場地
    IF v_new_venue_id IS NULL THEN
        v_new_venue_id := v_old_venue_id;
    END IF;
    
    -- 步驟 2: 檢查新時段是否被占用（鎖定）
    -- 檢查 BLOCKED_SLOT 表，看時段是否已被鎖定
    SELECT EXISTS (
        SELECT 1
        FROM BLOCKED_SLOT blocked
        WHERE blocked.venue_id = v_new_venue_id
          AND blocked.date = v_new_date
          AND (
              (blocked.start_time <= v_new_start_time AND blocked.end_time > v_new_start_time) OR
              (blocked.start_time < v_new_end_time AND blocked.end_time >= v_new_end_time) OR
              (blocked.start_time >= v_new_start_time AND blocked.end_time <= v_new_end_time)
          )
    ) INTO v_is_slot_locked;
    
    -- 檢查是否符合場地開放時間規則（跨閉館時間）
    v_weekday := EXTRACT(DOW FROM v_new_date);
    IF NOT v_is_slot_locked THEN
        SELECT NOT EXISTS (
            SELECT 1
            FROM TIMESLOT_RULE tr
            WHERE tr.venue_id = v_new_venue_id
              AND tr.weekday = v_weekday
              AND tr.open_time <= v_new_start_time
              AND tr.close_time >= v_new_end_time
        ) INTO v_is_slot_locked;
    END IF;
    
    -- 如果新時段被鎖定（衝突或跨閉館時間），拒絕異動
    IF v_is_slot_locked THEN
        RAISE EXCEPTION '新時段已被占用或不符合場地開放時間，異動被拒絕';
    END IF;
    
    -- 步驟 3: 鎖定新時段（在 BLOCKED_SLOT 中建立記錄）
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
        v_new_venue_id,
        v_new_date,
        v_new_start_time,
        v_new_end_time,
        '已核准預約（異動後）：' || (SELECT purpose FROM BOOKING WHERE booking_id = v_booking_id)
    WHERE NOT EXISTS (
        SELECT 1 FROM BLOCKED_SLOT
        WHERE venue_id = v_new_venue_id
          AND date = v_new_date
          AND start_time = v_new_start_time
          AND end_time = v_new_end_time
    );
    
    -- 步驟 4: 釋放舊時段（刪除舊的 BLOCKED_SLOT）
    -- 刪除與原訂單相關的 BLOCKED_SLOT
    DELETE FROM BLOCKED_SLOT
    WHERE venue_id = v_old_venue_id
      AND date = v_old_date
      AND start_time = v_old_start_time
      AND end_time = v_old_end_time
      AND reason LIKE '%' || (SELECT purpose FROM BOOKING WHERE booking_id = v_booking_id) || '%';
    
    -- 步驟 5: 重算金額（根據費率規則計算）
    -- 簡化版：實際應根據 PRICE_RULE 完整計算（包含設備費用等）
    v_new_amount := (
        SELECT 
            EXTRACT(EPOCH FROM (v_new_end_time::TIME - v_new_start_time::TIME)) / 3600.0 * 
            COALESCE(
                (SELECT base_fee_per_hour FROM PRICE_RULE 
                 WHERE version_id = (SELECT version_id FROM BOOKING WHERE booking_id = v_booking_id)
                   AND venue_id = v_new_venue_id
                   AND affiliation = (SELECT affiliation_cached FROM BOOKING WHERE booking_id = v_booking_id)
                   AND day_type = (
                       SELECT COALESCE(
                           (SELECT day_type FROM HOLIDAY WHERE date = v_new_date),
                           CASE 
                               WHEN EXTRACT(DOW FROM v_new_date) IN (0, 6) THEN 'Weekend'
                               ELSE 'Weekday'
                           END
                       )
                   )
                 LIMIT 1),
                500.0  -- 預設每小時 500 元
            )
    );
    
    -- 如果無法計算，使用原金額
    IF v_new_amount IS NULL OR v_new_amount = 0 THEN
        v_new_amount := v_old_amount;
    END IF;
    
    -- 計算差額
    v_amount_diff := v_new_amount - v_old_amount;
    
    -- 步驟 6: 更新訂單資訊
    UPDATE BOOKING
    SET 
        date = v_new_date,
        start_time = v_new_start_time,
        end_time = v_new_end_time,
        venue_id = v_new_venue_id,
        amount_est = v_new_amount,
        v_status = 'Approved' 
    WHERE booking_id = v_booking_id;
    
    -- 步驟 7: 更新 BOOKING_SLOT（時段切段）
    -- 刪除舊的時段切段
    DELETE FROM BOOKING_SLOT
    WHERE booking_id = v_booking_id;
    
    -- 插入新的時段切段（根據 slot_minute 切分，預設 30 分鐘）
    -- 取得該場地的 slot_minute（預設 30 分鐘）
    INSERT INTO BOOKING_SLOT (booking_id, venue_id, slot_start)
    SELECT 
        v_booking_id,
        v_new_venue_id,
        generate_series(
            (v_new_date || ' ' || v_new_start_time)::TIMESTAMP,
            (v_new_date || ' ' || v_new_end_time)::TIMESTAMP - 
            (COALESCE(
                (SELECT slot_minute FROM TIMESLOT_RULE 
                 WHERE venue_id = v_new_venue_id 
                   AND weekday = v_weekday 
                 LIMIT 1),
                30
            ) || ' minutes')::INTERVAL,
            COALESCE(
                (SELECT slot_minute FROM TIMESLOT_RULE 
                 WHERE venue_id = v_new_venue_id 
                   AND weekday = v_weekday 
                 LIMIT 1),
                30
            ) || ' minutes'
        )::TIMESTAMP;
    
    -- 步驟 8: 產生補收或退款記錄（補差額）
    IF ABS(v_amount_diff) > 0.01 THEN  -- 差額超過 0.01 元才建立記錄
        INSERT INTO PAYMENT (
            payment_id,
            booking_id,
            method,
            amount,
            type,
            status,
            created_at
        ) VALUES (
            (SELECT COALESCE(MAX(payment_id), 0) + 1 FROM PAYMENT),
            v_booking_id,
            NULL,  -- 待選擇付款方式
            ABS(v_amount_diff),  -- 使用絕對值
            CASE 
                WHEN v_amount_diff > 0 THEN 'Rent'  -- 補收
                ELSE 'Adjustment'  -- 退款
            END,
            'Pending',
            NOW()
        );
    END IF;
    
    RAISE NOTICE '訂單異動成功: 訂單 ID %, 原金額 %, 新金額 %, 差額 %', 
        v_booking_id, v_old_amount, v_new_amount, v_amount_diff;
    
EXCEPTION
    WHEN OTHERS THEN
        -- 如果發生錯誤，自動回滾（DO 區塊會自動處理）
        RAISE EXCEPTION '訂單異動失敗: %', SQLERRM;
END $$;

-- ============================================
-- 2. 使用函數處理訂單異動（推薦）
-- ============================================
CREATE OR REPLACE FUNCTION modify_booking(
    p_booking_id BIGINT,
    p_new_date DATE,
    p_new_start_time TIME,
    p_new_end_time TIME,
    p_new_venue_id BIGINT DEFAULT NULL
) RETURNS JSON AS $$
DECLARE
    v_old_date DATE;
    v_old_start_time TIME;
    v_old_end_time TIME;
    v_old_venue_id BIGINT;
    v_old_amount NUMERIC(10,2);
    v_new_amount NUMERIC(10,2);
    v_amount_diff NUMERIC(10,2);
    v_status VARCHAR(12);
    v_is_slot_locked BOOLEAN := false;
    v_weekday SMALLINT;
    v_slot_minute INT;
BEGIN
    -- 取得原訂單資訊
    SELECT date, start_time, end_time, venue_id, amount_est, status
    INTO v_old_date, v_old_start_time, v_old_end_time, v_old_venue_id, v_old_amount, v_status
    FROM BOOKING
    WHERE booking_id = p_booking_id;
    
    IF v_old_date IS NULL THEN
        RETURN json_build_object('success', false, 'error', '訂單不存在');
    END IF;
    
    IF v_status NOT IN ('Approved', 'Draft', 'Pending') THEN
        RETURN json_build_object('success', false, 'error', '訂單狀態不允許修改: ' || v_status);
    END IF;
    
    IF p_new_venue_id IS NULL THEN
        p_new_venue_id := v_old_venue_id;
    END IF;
    
    -- 檢查新時段是否被占用（鎖定）
    -- 只檢查 BLOCKED_SLOT 表
    SELECT EXISTS (
        SELECT 1 FROM BLOCKED_SLOT blocked
        WHERE blocked.venue_id = p_new_venue_id
          AND blocked.date = p_new_date
          AND (
              (blocked.start_time <= p_new_start_time AND blocked.end_time > p_new_start_time) OR
              (blocked.start_time < p_new_end_time AND blocked.end_time >= p_new_end_time) OR
              (blocked.start_time >= p_new_start_time AND blocked.end_time <= p_new_end_time)
          )
    ) INTO v_is_slot_locked;
    
    -- 檢查是否符合場地開放時間規則（跨閉館時間）
    v_weekday := EXTRACT(DOW FROM p_new_date);
    IF NOT v_is_slot_locked THEN
        SELECT NOT EXISTS (
            SELECT 1 FROM TIMESLOT_RULE tr
            WHERE tr.venue_id = p_new_venue_id
              AND tr.weekday = v_weekday
              AND tr.open_time <= p_new_start_time
              AND tr.close_time >= p_new_end_time
        ) INTO v_is_slot_locked;
    END IF;
    
    -- 如果新時段被鎖定，拒絕異動
    IF v_is_slot_locked THEN
        RETURN json_build_object('success', false, 'error', '新時段已被占用或不符合場地開放時間，異動被拒絕');
    END IF;
    
    -- 鎖定新時段
    INSERT INTO BLOCKED_SLOT (block_id, venue_id, date, start_time, end_time, reason)
    SELECT 
        (SELECT COALESCE(MAX(block_id), 0) + 1 FROM BLOCKED_SLOT),
        p_new_venue_id,
        p_new_date,
        p_new_start_time,
        p_new_end_time,
        '已核准預約（異動後）：' || (SELECT purpose FROM BOOKING WHERE booking_id = p_booking_id)
    WHERE NOT EXISTS (
        SELECT 1 FROM BLOCKED_SLOT
        WHERE venue_id = p_new_venue_id
          AND date = p_new_date
          AND start_time = p_new_start_time
          AND end_time = p_new_end_time
    );
    
    -- 釋放舊時段
    DELETE FROM BLOCKED_SLOT
    WHERE venue_id = v_old_venue_id
      AND date = v_old_date
      AND start_time = v_old_start_time
      AND end_time = v_old_end_time
      AND reason LIKE '%' || (SELECT purpose FROM BOOKING WHERE booking_id = p_booking_id) || '%';
    
    -- 重算金額
    v_new_amount := (
        SELECT 
            EXTRACT(EPOCH FROM (p_new_end_time::TIME - p_new_start_time::TIME)) / 3600.0 * 
            COALESCE(
                (SELECT base_fee_per_hour FROM PRICE_RULE 
                 WHERE version_id = (SELECT version_id FROM BOOKING WHERE booking_id = p_booking_id)
                   AND venue_id = p_new_venue_id
                   AND affiliation = (SELECT affiliation_cached FROM BOOKING WHERE booking_id = p_booking_id)
                   AND day_type = (
                       SELECT COALESCE(
                           (SELECT day_type FROM HOLIDAY WHERE date = p_new_date),
                           CASE 
                               WHEN EXTRACT(DOW FROM p_new_date) IN (0, 6) THEN 'Weekend'
                               ELSE 'Weekday'
                           END
                       )
                   )
                 LIMIT 1),
                500.0
            )
    );
    
    IF v_new_amount IS NULL OR v_new_amount = 0 THEN
        v_new_amount := v_old_amount;
    END IF;
    
    v_amount_diff := v_new_amount - v_old_amount;
    
    -- 更新訂單
    UPDATE BOOKING
    SET 
        date = p_new_date,
        start_time = p_new_start_time,
        end_time = p_new_end_time,
        venue_id = p_new_venue_id,
        amount_est = v_new_amount,
        status = CASE 
            WHEN v_status = 'Approved' AND ABS(v_amount_diff) > 100 THEN 'Pending'
            ELSE v_status
        END
    WHERE booking_id = p_booking_id;
    
    -- 更新 BOOKING_SLOT
    DELETE FROM BOOKING_SLOT WHERE booking_id = p_booking_id;
    
    -- 取得 slot_minute
    SELECT COALESCE(
        (SELECT slot_minute FROM TIMESLOT_RULE 
         WHERE venue_id = p_new_venue_id 
           AND weekday = v_weekday 
         LIMIT 1),
        30
    ) INTO v_slot_minute;
    
    INSERT INTO BOOKING_SLOT (booking_id, venue_id, slot_start)
    SELECT 
        p_booking_id,
        p_new_venue_id,
        generate_series(
            (p_new_date || ' ' || p_new_start_time)::TIMESTAMP,
            (p_new_date || ' ' || p_new_end_time)::TIMESTAMP - (v_slot_minute || ' minutes')::INTERVAL,
            (v_slot_minute || ' minutes')::INTERVAL
        )::TIMESTAMP;
    
    -- 產生補收或退款（補差額）
    IF ABS(v_amount_diff) > 0.01 THEN
        INSERT INTO PAYMENT (payment_id, booking_id, method, amount, type, status, created_at)
        VALUES (
            (SELECT COALESCE(MAX(payment_id), 0) + 1 FROM PAYMENT),
            p_booking_id,
            NULL,
            ABS(v_amount_diff),
            CASE WHEN v_amount_diff > 0 THEN 'Rent' ELSE 'Adjustment' END,
            'Pending',
            NOW()
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
    
EXCEPTION
    WHEN OTHERS THEN
        RETURN json_build_object('success', false, 'error', SQLERRM);
END;
$$ LANGUAGE plpgsql;

-- 使用範例：
-- SELECT modify_booking(2, '2025-01-20', '14:00:00', '17:00:00', NULL);

