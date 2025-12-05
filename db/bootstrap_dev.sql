\set ON_ERROR_STOP on
SET client_min_messages TO warning;
SET TIME ZONE 'Asia/Taipei';
SET search_path TO public;
SET client_encoding TO 'UTF8';

\echo '== 1/3 建表...'
\i db/create_tables.sql

\echo '== 2/3 匯入初始資料...'
\i db/seed/01_insert_org_clubs.sql
\i db/seed/02_insert_buildings.sql
\i db/seed/03_insert_venues.sql
\i db/seed/04_insert_users.sql
\i db/seed/05_insert_equipment.sql
\i db/seed/06_insert_venue_equip.sql
\i db/seed/07_insert_rate_plan.sql
\i db/seed/08_insert_rate_version.sql
\i db/seed/09_insert_price_rule.sql
\i db/seed/10_insert_timeslot_rule.sql
\i db/seed/11_insert_booking.sql

\echo '== 3/3 載入功能腳本（不含 @param 樣板）...'
-- ✅ 放“已改成只用 BOOKING_SLOT、不寫 BLOCKED_SLOT”的核准/拒絕/補件版本
\i app/queries/admin/approval_queries.sql
\i app/queries/admin/booking_modification.sql
\i app/queries/admin/black_list.sql
\i app/queries/admin/set_rule.sql
\i app/queries/admin/update_fund.sql
-- ⚠️ set_rule.sql 有 @param 的樣板別在這裡 \i；改由你的後端 API 注入參數執行。

\echo '== 檢查關鍵物件存在性...'
-- 必要唯一鍵
SELECT conname FROM pg_constraint 
 WHERE conname LIKE '%booking_slot%' AND contype='u';

-- 必要函數
SELECT proname FROM pg_proc 
 WHERE proname IN ('approve_booking','reject_booking','request_changes','modify_booking');

\echo '== 完成 bootstrap。'
