==增加某人為黑名單 ==

INSERT INTO BLACKLIST (user_id, user_name, reason, blocked_until, status) 
VALUES (1, '張三', '違反使用規定', '2025-12-31', 'Active');

==刪除黑名單 ==

DELETE FROM BLACKLIST WHERE user_id = 1;

==查詢黑名單 ==

SELECT bl.*, u.name AS user_name , u.email, o.name as org_name, FROM BLACKLIST bl
JOIN "USER" u ON bl.user_id = u.user_id
left JOIN org o using (org_id)

