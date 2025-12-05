-- app/queries/user/search_availability.sql
-- p1:date  p_date
-- p2:time  p_start
-- p3:time  p_end
-- p4:int   p_people
-- p5:int   p_building_id (可為 NULL)
-- p6:text  p_type        (可為 NULL)

WITH ctx AS (
  -- 用一個子 SELECT 把全部參數先變成欄位，後面只要 SELECT d/t1/t2... 就好
  SELECT
    d,
    t1,
    t2,
    ppl,
    building_id,
    vtype,
    EXTRACT(DOW FROM d)::int AS dow
  FROM (
    SELECT
      %s::date AS d,
      %s::time AS t1,
      %s::time AS t2,
      %s::int  AS ppl,
      %s::int  AS building_id,
      %s::text AS vtype
  ) s
),

-- 1) 當日該場地是否有規則且時間帶落在 open/close 內
open_venue AS (
  SELECT v.*
  FROM venue v
  JOIN timeslot_rule r
    ON r.venue_id = v.venue_id
   AND r.weekday = (SELECT dow FROM ctx)
  JOIN ctx ON TRUE
  WHERE v.open_status = 'On'
    AND (
         CASE
           WHEN r.open_time <= r.close_time THEN
             (SELECT t1 FROM ctx) >= r.open_time
             AND (SELECT t2 FROM ctx) <= r.close_time
           ELSE -- 跨午夜
             ((SELECT t1 FROM ctx) >= r.open_time OR (SELECT t2 FROM ctx) <= r.close_time)
         END
    )
    AND v.capacity >= (SELECT ppl FROM ctx)
    AND ((SELECT building_id FROM ctx) IS NULL OR v.building_id = (SELECT building_id FROM ctx))
    AND ((SELECT vtype FROM ctx)       IS NULL OR v.type        = (SELECT vtype       FROM ctx))
),

-- 2) 要排除的時間切片（以 30 分鐘為例；實作上建議取 r.slot_minute，但此處先固定 30）
wanted_slots AS (
  SELECT (
      DATE_TRUNC('minute', (SELECT d FROM ctx)::timestamp + (SELECT t1 FROM ctx)::interval)
      + make_interval(mins := 30) * g
  )::timestamp AS slot_start
  FROM generate_series(
         0,
         GREATEST(
           0,
           ((EXTRACT(EPOCH FROM ((SELECT t2 FROM ctx) - (SELECT t1 FROM ctx))) / 60)::int / 30) - 1
         ),
         1
       ) g
),

-- 3) 尚有效的 Pending 或 Approved 訂單所佔用之切片
occupied AS (
  SELECT bs.venue_id, bs.slot_start
  FROM booking_slot bs
  JOIN booking b ON b.booking_id = bs.booking_id
  WHERE b.status IN ('Pending','Approved')
    AND COALESCE(b.hold_until, NOW() + interval '100 years') >= NOW()  -- Pending 未逾時才算占用
),

-- 4) 封場
blocked AS (
  SELECT venue_id,
         ((SELECT d FROM ctx)::timestamp::date + start_time)::timestamp AS slot_start
  FROM blocked_slot
  WHERE date = (SELECT d FROM ctx)
    AND (SELECT t1 FROM ctx) < end_time
    AND (SELECT t2 FROM ctx) > start_time
)

SELECT
  v.venue_id, v.name, v.type, v.capacity, v.building_id,
  -- 簡要費率區間（抓當日有效版本 + 該日 Day_type 的 min/max 時段價）
  MIN(pr.base_fee_per_hour) FILTER (WHERE pr.base_fee_per_hour IS NOT NULL) AS min_fee_per_hour,
  MAX(pr.base_fee_per_hour) FILTER (WHERE pr.base_fee_per_hour IS NOT NULL) AS max_fee_per_hour,
  ARRAY_REMOVE(ARRAY_AGG(DISTINCT e.name), NULL) AS equipments
FROM open_venue v
LEFT JOIN venue_equip ve ON ve.venue_id = v.venue_id
LEFT JOIN equipment e     ON e.equip_id = ve.equip_id
LEFT JOIN rate_plan rp    ON rp.venue_id = v.venue_id AND rp.status = 'On'
LEFT JOIN rate_version rv ON rv.plan_id = rp.plan_id
LEFT JOIN holiday h       ON h.date = (SELECT d FROM ctx)
LEFT JOIN price_rule pr   ON pr.version_id = rv.version_id
                          AND pr.day_type = COALESCE(h.day_type,'Weekday')
                          AND (SELECT t1 FROM ctx) < pr.end_time
                          AND (SELECT t2 FROM ctx) > pr.start_time
WHERE NOT EXISTS (
  SELECT 1
  FROM wanted_slots ws
  JOIN occupied oc ON oc.venue_id = v.venue_id
                  AND oc.slot_start = ws.slot_start
)
AND NOT EXISTS (
  SELECT 1
  FROM wanted_slots ws
  JOIN blocked bl ON bl.venue_id = v.venue_id
                 AND bl.slot_start = ws.slot_start
)
GROUP BY v.venue_id, v.name, v.type, v.capacity, v.building_id
ORDER BY v.capacity, v.name;
