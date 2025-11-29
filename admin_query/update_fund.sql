-- if  pending  means it has not been paid yet


-- ============================================
-- 標記付款成功 手動標記
-- ============================================

-- ============================================
-- 方法1：根據付款ID標記付款成功（推薦） UPDATE_PAYMENT_STATUS_TO_SUCCEEDED
-- ============================================
-- 使用方式：將 @payment_id 替換為實際的付款ID
UPDATE PAYMENT
SET status = 'Succeeded'
WHERE payment_id = @payment_id  -- 替換為實際的付款ID，例如：WHERE payment_id = 3
  AND status = 'Pending';  -- 只更新待付款的記錄，避免重複更新



-- ============================================
-- 查詢：查看待付款記錄（用於確認）  ACTION: SEARCH_PENDING_PAYMENT
-- ============================================
-- 查看所有待付款記錄
SELECT 
    p.payment_id,
    p.booking_id,
    b.purpose AS booking_purpose,
    u.name AS user_name,
    p.method,
    p.amount,
    p.type,
    p.status,
    p.created_at
FROM PAYMENT p
JOIN BOOKING b ON p.booking_id = b.booking_id
JOIN "USER" u ON b.user_id = u.user_id
WHERE p.status = 'Pending'
ORDER BY p.created_at ASC;

-- ============================================
-- 建立退款記錄  ACTION: ADD_REFUND
-- ============================================
-- 使用方式：將 @payment_id, @amount, @reason 替換為實際值
INSERT INTO REFUND (
    refund_id,
    payment_id,
    amount,
    reason,
    status,
    created_at
) VALUES (
    (SELECT COALESCE(MAX(refund_id), 0) + 1 FROM REFUND),  -- 自動生成退款ID
    @payment_id,  -- 替換為實際的付款ID，例如：3
    @amount,  -- 替換為退款金額，例如：1000.00
    @reason,  -- 替換為退款原因，例如：'訂單取消，全額退款'，可為 NULL
    'Pending',  -- 預設為待處理
    NOW()  -- 建立時間
);


-- 依退款結果更新付款狀態（預留）  ACTION: UPDATE_PAYMENT_STATUS_BY_REFUND
UPDATE PAYMENT
SET status = 'Succeeded'
WHERE refund_id = @refund_id  -- 替換為實際的退款ID
  AND status = 'Pending';  -- 只更新待付款的記錄，避免重複更新


