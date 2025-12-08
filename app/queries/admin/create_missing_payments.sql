-- =========================================================
-- 為已批准的訂單創建缺失的 payment 記錄
-- 用途：修復在 approve_booking 函數修改之前已批准的訂單
-- =========================================================

-- 為所有 Approved 狀態且金額 > 0 但沒有 payment 記錄的訂單創建 payment
INSERT INTO payment (booking_id, method, amount, type, status, created_at)
SELECT 
    b.booking_id,
    'Transfer' AS method,
    b.amount_est AS amount,
    'Rent' AS type,
    'Pending' AS status,
    NOW() AS created_at
FROM booking b
WHERE b.status = 'Approved'
  AND b.amount_est > 0
  AND NOT EXISTS (
    SELECT 1 
    FROM payment p 
    WHERE p.booking_id = b.booking_id
  )
ORDER BY b.booking_id;

-- 查詢結果：顯示創建了多少筆 payment 記錄
SELECT 
    COUNT(*) AS created_payments,
    SUM(amount) AS total_amount
FROM payment
WHERE created_at >= NOW() - INTERVAL '1 minute'
  AND status = 'Pending';
