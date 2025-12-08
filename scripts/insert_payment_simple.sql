-- 直接插入 payment 記錄（偷吃步）
-- 為博雅301, 2025-12-12 的已批准訂單創建待付款記錄

-- 1. 先查看訂單
SELECT 
    b.booking_id, 
    b.venue_id,
    v.name AS venue_name,
    b.date,
    b.start_time,
    b.end_time,
    b.amount_est,
    b.status
FROM booking b
JOIN venue v ON v.venue_id = b.venue_id
WHERE v.name = '博雅301'
  AND b.date = '2025-12-12'::date
  AND b.status = 'Approved'
ORDER BY b.created_at DESC
LIMIT 1;

-- 2. 插入 payment 記錄（請先執行上面的查詢，確認 booking_id）
-- 假設 booking_id 是 496（請根據實際查詢結果修改）
INSERT INTO payment (booking_id, method, amount, type, status, created_at)
SELECT 
    b.booking_id,
    'Transfer' AS method,
    b.amount_est AS amount,
    'Rent' AS type,
    'Pending' AS status,
    NOW() AS created_at
FROM booking b
JOIN venue v ON v.venue_id = b.venue_id
WHERE v.name = '博雅301'
  AND b.date = '2025-12-12'::date
  AND b.status = 'Approved'
  AND NOT EXISTS (
    SELECT 1 
    FROM payment p 
    WHERE p.booking_id = b.booking_id
  )
ORDER BY b.created_at DESC
LIMIT 1
RETURNING payment_id, booking_id, amount, status, created_at;
