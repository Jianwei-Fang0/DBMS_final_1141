-- 08_insert_rate_version.sql
-- 每個方案建立費率版本

INSERT INTO rate_version (plan_id, effective_from, effective_to)
SELECT plan_id, DATE '2025-01-01', NULL FROM rate_plan;
