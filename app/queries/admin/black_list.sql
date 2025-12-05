-- ==增加某人為黑名單 == ADD_BLACKLIST
-- 將使用者狀態改為 Frozen
UPDATE "user"
SET status = 'Frozen'
WHERE user_id = @user_id;  -- 例如：WHERE user_id = 1;

-- 若要附帶原因/期限，建議寫進 Mongo audit log，而不是關聯式 DB。


-- ==刪除黑名單 == DELETE_BLACKLIST
-- 將使用者狀態恢復為 Active
UPDATE "user"
SET status = 'Active'
WHERE user_id = @user_id;  -- 例如：WHERE user_id = 1;


-- ==查詢黑名單 == SEARCH_ALL_BLACKLIST
-- 查看所有被凍結的使用者
SELECT
    u.user_id,
    u.name       AS user_name,
    u.email,
    o.name       AS org_name,
    u.status,
    u.created_at
FROM "user" u
LEFT JOIN org o ON u.org_id = o.org_id
WHERE u.status = 'Frozen'
ORDER BY u.created_at DESC;
