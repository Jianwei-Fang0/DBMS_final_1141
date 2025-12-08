-- app/queries/user/search_availability_by_building.sql
-- 根據 building_id 和日期查詢後7天的可用場地
-- p1:date   p_start_date (起始日期)
-- p2:int    p_building_id (大樓 ID，必需)
-- p3:int    p_people     (人數，可選)
-- p4:text   p_type       (場地類型，可選)

WITH ctx AS (
  -- 參數上下文
  SELECT
    start_date,
    ppl,
    building_id,
    vtype,
    start_date + interval '6 days' AS end_date
  FROM (
    SELECT
      %s::date AS start_date,
      %s::int  AS building_id,
      %s::int  AS ppl,
      %s::text AS vtype
  ) s
),

-- 生成7天的日期範圍
date_range AS (
  SELECT 
    (SELECT start_date FROM ctx) + (generate_series(0, 6)::int || ' days')::interval AS check_date
),

-- 每一天的星期幾
date_with_dow AS (
  SELECT 
    check_date::date AS date_only,
    EXTRACT(DOW FROM check_date)::int AS dow
  FROM date_range
),

-- 1) 該大樓內所有開啟的場地，且符合人數和類型條件
target_venues AS (
  SELECT v.*
  FROM venue v
  JOIN ctx ON TRUE
  WHERE v.open_status = 'On'
    AND v.building_id = (SELECT building_id FROM ctx)
    AND ((SELECT ppl FROM ctx) IS NULL OR v.capacity >= (SELECT ppl FROM ctx))
    AND ((SELECT vtype FROM ctx) IS NULL OR v.type = (SELECT vtype FROM ctx))
),

-- 2) 每個場地在7天內每天的時段規則
venue_daily_rules AS (
  SELECT 
    v.venue_id,
    d.date_only,
    d.dow,
    r.open_time,
    r.close_time,
    r.slot_minute
  FROM target_venues v
  CROSS JOIN date_with_dow d
  JOIN timeslot_rule r 
    ON r.venue_id = v.venue_id 
    AND r.weekday = d.dow
),

-- 3) 生成要檢查的時間切片（使用每天的開放時間範圍）
wanted_slots AS (
  SELECT 
    vdr.venue_id,
    vdr.date_only,
    (
      DATE_TRUNC('minute', vdr.date_only::timestamp + vdr.open_time::interval)
      + make_interval(mins := vdr.slot_minute) * g
    )::timestamp AS slot_start
  FROM venue_daily_rules vdr
  CROSS JOIN generate_series(
    0,
    GREATEST(
      0,
      CASE 
        WHEN vdr.open_time <= vdr.close_time THEN
          ((EXTRACT(EPOCH FROM (vdr.close_time - vdr.open_time)) / 60)::int / vdr.slot_minute) - 1
        ELSE
          ((EXTRACT(EPOCH FROM ((vdr.close_time + interval '24 hours') - vdr.open_time)) / 60)::int / vdr.slot_minute) - 1
      END
    ),
    1
  ) g
  WHERE 
    -- 確保生成的切片在開放時間範圍內
    (
      (vdr.date_only::timestamp + vdr.open_time::interval 
       + make_interval(mins := vdr.slot_minute) * g)::time >= vdr.open_time
      AND (vdr.date_only::timestamp + vdr.open_time::interval 
       + make_interval(mins := vdr.slot_minute) * g)::time < vdr.close_time
    )
    OR (
      vdr.open_time > vdr.close_time AND
      (
        (vdr.date_only::timestamp + vdr.open_time::interval 
         + make_interval(mins := vdr.slot_minute) * g)::time >= vdr.open_time
        OR (vdr.date_only::timestamp + vdr.open_time::interval 
         + make_interval(mins := vdr.slot_minute) * g)::time < vdr.close_time
      )
    )
),

-- 4) 尚有效的 Pending 或 Approved 訂單所佔用之切片
occupied AS (
  SELECT bs.venue_id, bs.slot_start
  FROM booking_slot bs
  JOIN booking b ON b.booking_id = bs.booking_id
  WHERE b.status IN ('Pending','Approved')
    AND COALESCE(b.hold_until, NOW() + interval '100 years') >= NOW()
    AND bs.slot_start::date >= (SELECT start_date FROM ctx)
    AND bs.slot_start::date <= (SELECT end_date FROM ctx)
),

-- 5) 封場
blocked AS (
  SELECT 
    venue_id,
    (date::timestamp + start_time)::timestamp AS slot_start
  FROM blocked_slot
  WHERE date >= (SELECT start_date FROM ctx)
    AND date <= (SELECT end_date FROM ctx)
)

SELECT DISTINCT
  v.venue_id, 
  v.name, 
  v.type, 
  v.capacity, 
  v.building_id,
  d.date_only AS available_date,
  -- 顯示該日的開放時間範圍
  MIN(vdr.open_time) AS available_start_time,
  MAX(vdr.close_time) AS available_end_time,
  -- 簡要費率區間
  MIN(pr.base_fee_per_hour) FILTER (WHERE pr.base_fee_per_hour IS NOT NULL) AS min_fee_per_hour,
  MAX(pr.base_fee_per_hour) FILTER (WHERE pr.base_fee_per_hour IS NOT NULL) AS max_fee_per_hour,
  ARRAY_REMOVE(ARRAY_AGG(DISTINCT e.name), NULL) AS equipments
FROM target_venues v
CROSS JOIN date_with_dow d
JOIN venue_daily_rules vdr 
  ON vdr.venue_id = v.venue_id 
  AND vdr.date_only = d.date_only
LEFT JOIN venue_equip ve ON ve.venue_id = v.venue_id
LEFT JOIN equipment e ON e.equip_id = ve.equip_id
LEFT JOIN rate_plan rp ON rp.venue_id = v.venue_id AND rp.status = 'On'
LEFT JOIN rate_version rv ON rv.plan_id = rp.plan_id
  AND rv.effective_from <= d.date_only
  AND (rv.effective_to IS NULL OR rv.effective_to >= d.date_only)
LEFT JOIN holiday h ON h.date = d.date_only
LEFT JOIN price_rule pr ON pr.version_id = rv.version_id
  AND pr.day_type = COALESCE(h.day_type, 
    CASE WHEN d.dow IN (0, 6) THEN 'Weekend' ELSE 'Weekday' END)
  AND vdr.open_time < pr.end_time
  AND vdr.close_time > pr.start_time
WHERE NOT EXISTS (
  -- 檢查該場地該日期是否有被占用
  SELECT 1
  FROM wanted_slots ws
  JOIN occupied oc ON oc.venue_id = v.venue_id
    AND oc.slot_start = ws.slot_start
  WHERE ws.venue_id = v.venue_id
    AND ws.date_only = d.date_only
)
AND NOT EXISTS (
  -- 檢查該場地該日期是否有被封場
  SELECT 1
  FROM wanted_slots ws
  JOIN blocked bl ON bl.venue_id = v.venue_id
    AND bl.slot_start = ws.slot_start
  WHERE ws.venue_id = v.venue_id
    AND ws.date_only = d.date_only
)
GROUP BY v.venue_id, v.name, v.type, v.capacity, v.building_id, d.date_only
ORDER BY d.date_only, v.capacity, v.name;
