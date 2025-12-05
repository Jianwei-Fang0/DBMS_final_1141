-- 11_insert_booking.sql
-- 自動產生 booking + booking_slot（500 筆）


-- booking 1
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共405' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    85,
    '活動預約',
    '2025-03-13',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-13 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共405' AND b.name='共同教學館';


-- booking 2
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共302' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    151,
    '活動預約',
    '2025-03-20',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共302' AND b.name='共同教學館';


-- booking 3
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅204' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    82,
    '活動預約',
    '2025-03-08',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-08 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅204' AND b.name='博雅教學館';


-- booking 4
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜505' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    55,
    '活動預約',
    '2025-03-13',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-13 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜505' AND b.name='綜合教學館';


-- booking 5
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共307' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    189,
    '活動預約',
    '2025-03-27',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-27 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共307' AND b.name='共同教學館';


-- booking 6
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普302' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    78,
    '活動預約',
    '2025-03-13',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-13 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普302' AND b.name='普通教學館';


-- booking 7
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅309' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    94,
    '活動預約',
    '2025-03-18',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-18 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅309' AND b.name='博雅教學館';


-- booking 8
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅102' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    161,
    '活動預約',
    '2025-03-05',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-05 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅102' AND b.name='博雅教學館';


-- booking 9
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜607' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    18,
    '活動預約',
    '2025-03-17',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-17 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜607' AND b.name='綜合教學館';


-- booking 10
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新301' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    115,
    '活動預約',
    '2025-03-15',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新301' AND b.name='新生教學館';


-- booking 11
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普406' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    110,
    '活動預約',
    '2025-03-01',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-01 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普406' AND b.name='普通教學館';


-- booking 12
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新404' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    16,
    '活動預約',
    '2025-03-22',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-22 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新404' AND b.name='新生教學館';


-- booking 13
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共401' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    22,
    '活動預約',
    '2025-03-15',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共401' AND b.name='共同教學館';


-- booking 14
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新303' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    80,
    '活動預約',
    '2025-03-24',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-24 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新303' AND b.name='新生教學館';


-- booking 15
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新501' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    93,
    '活動預約',
    '2025-03-09',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新501' AND b.name='新生教學館';


-- booking 16
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普303' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    193,
    '活動預約',
    '2025-03-04',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-04 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普303' AND b.name='普通教學館';


-- booking 17
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜合大講堂' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    46,
    '活動預約',
    '2025-03-20',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜合大講堂' AND b.name='綜合教學館';


-- booking 18
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜606' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    4,
    '活動預約',
    '2025-03-01',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-01 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜606' AND b.name='綜合教學館';


-- booking 19
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新201' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    133,
    '活動預約',
    '2025-03-30',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新201' AND b.name='新生教學館';


-- booking 20
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜603' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    111,
    '活動預約',
    '2025-03-01',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-01 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜603' AND b.name='綜合教學館';


-- booking 21
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新402' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    100,
    '活動預約',
    '2025-03-20',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新402' AND b.name='新生教學館';


-- booking 22
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅310' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    38,
    '活動預約',
    '2025-03-15',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅310' AND b.name='博雅教學館';


-- booking 23
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共205' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    72,
    '活動預約',
    '2025-03-29',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-29 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共205' AND b.name='共同教學館';


-- booking 24
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普504' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    97,
    '活動預約',
    '2025-03-10',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-10 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普504' AND b.name='普通教學館';


-- booking 25
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜404' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    71,
    '活動預約',
    '2025-03-31',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-31 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜404' AND b.name='綜合教學館';


-- booking 26
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新505' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    29,
    '活動預約',
    '2025-03-16',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新505' AND b.name='新生教學館';


-- booking 27
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新402' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    130,
    '活動預約',
    '2025-03-24',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-24 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新402' AND b.name='新生教學館';


-- booking 28
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜合大講堂' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    185,
    '活動預約',
    '2025-03-29',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-29 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜合大講堂' AND b.name='綜合教學館';


-- booking 29
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='中央大廳圓桌區' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    43,
    '活動預約',
    '2025-03-16',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='中央大廳圓桌區' AND b.name='博雅教學館';


-- booking 30
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新303' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    14,
    '活動預約',
    '2025-03-22',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-22 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新303' AND b.name='新生教學館';


-- booking 31
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新102' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    165,
    '活動預約',
    '2025-03-15',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新102' AND b.name='新生教學館';


-- booking 32
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='一樓中央大廳 展覽牆柱區' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    78,
    '活動預約',
    '2025-03-24',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-24 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='一樓中央大廳 展覽牆柱區' AND b.name='博雅教學館';


-- booking 33
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅304' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    181,
    '活動預約',
    '2025-03-09',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅304' AND b.name='博雅教學館';


-- booking 34
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜606' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    22,
    '活動預約',
    '2025-03-27',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-27 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜606' AND b.name='綜合教學館';


-- booking 35
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普204' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    29,
    '活動預約',
    '2025-03-09',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普204' AND b.name='普通教學館';


-- booking 36
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='一樓西側大廳 桌椅區 (101 教室旁)' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    195,
    '活動預約',
    '2025-03-15',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='一樓西側大廳 桌椅區 (101 教室旁)' AND b.name='博雅教學館';


-- booking 37
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜404' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    20,
    '活動預約',
    '2025-03-04',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-04 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜404' AND b.name='綜合教學館';


-- booking 38
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共402' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    192,
    '活動預約',
    '2025-03-25',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-25 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共402' AND b.name='共同教學館';


-- booking 39
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜501' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    145,
    '活動預約',
    '2025-03-19',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-19 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜501' AND b.name='綜合教學館';


-- booking 40
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共302' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    75,
    '活動預約',
    '2025-03-17',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-17 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共302' AND b.name='共同教學館';


-- booking 41
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新201' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    89,
    '活動預約',
    '2025-03-02',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-02 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新201' AND b.name='新生教學館';


-- booking 42
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共303' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    112,
    '活動預約',
    '2025-03-15',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共303' AND b.name='共同教學館';


-- booking 43
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普203' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    74,
    '活動預約',
    '2025-03-18',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-18 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普203' AND b.name='普通教學館';


-- booking 44
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共202' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    154,
    '活動預約',
    '2025-03-14',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-14 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共202' AND b.name='共同教學館';


-- booking 45
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜501' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    113,
    '活動預約',
    '2025-03-13',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-13 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜501' AND b.name='綜合教學館';


-- booking 46
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普201' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    3,
    '活動預約',
    '2025-03-02',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-02 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普201' AND b.name='普通教學館';


-- booking 47
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='一樓中央大廳 展覽牆柱區' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    192,
    '活動預約',
    '2025-03-01',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-01 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='一樓中央大廳 展覽牆柱區' AND b.name='博雅教學館';


-- booking 48
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜203' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    16,
    '活動預約',
    '2025-03-31',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-31 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜203' AND b.name='綜合教學館';


-- booking 49
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共406' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    176,
    '活動預約',
    '2025-03-11',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-11 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共406' AND b.name='共同教學館';


-- booking 50
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共306' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    67,
    '活動預約',
    '2025-03-06',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-06 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共306' AND b.name='共同教學館';


-- booking 51
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜501' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    146,
    '活動預約',
    '2025-03-23',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-23 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜501' AND b.name='綜合教學館';


-- booking 52
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜605' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    103,
    '活動預約',
    '2025-03-21',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-21 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜605' AND b.name='綜合教學館';


-- booking 53
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜203' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    148,
    '活動預約',
    '2025-03-04',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-04 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜203' AND b.name='綜合教學館';


-- booking 54
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普303' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    79,
    '活動預約',
    '2025-03-28',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-28 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普303' AND b.name='普通教學館';


-- booking 55
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共205' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    143,
    '活動預約',
    '2025-03-09',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共205' AND b.name='共同教學館';


-- booking 56
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共102' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    82,
    '活動預約',
    '2025-03-07',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-07 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共102' AND b.name='共同教學館';


-- booking 57
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅101/華南講堂' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    112,
    '活動預約',
    '2025-03-26',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-26 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅101/華南講堂' AND b.name='博雅教學館';


-- booking 58
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新404' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    93,
    '活動預約',
    '2025-03-16',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新404' AND b.name='新生教學館';


-- booking 59
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共205' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    175,
    '活動預約',
    '2025-03-15',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共205' AND b.name='共同教學館';


-- booking 60
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜201' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    141,
    '活動預約',
    '2025-03-13',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-13 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜201' AND b.name='綜合教學館';


-- booking 61
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜502' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    118,
    '活動預約',
    '2025-03-28',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-28 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜502' AND b.name='綜合教學館';


-- booking 62
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜202' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    89,
    '活動預約',
    '2025-03-28',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-28 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜202' AND b.name='綜合教學館';


-- booking 64
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普201' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    155,
    '活動預約',
    '2025-03-23',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-23 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普201' AND b.name='普通教學館';


-- booking 65
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共204' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    47,
    '活動預約',
    '2025-03-06',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-06 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共204' AND b.name='共同教學館';


-- booking 66
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新402' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    26,
    '活動預約',
    '2025-03-15',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新402' AND b.name='新生教學館';


-- booking 67
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普306' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    169,
    '活動預約',
    '2025-03-02',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-02 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普306' AND b.name='普通教學館';


-- booking 68
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新502' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    133,
    '活動預約',
    '2025-03-29',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-29 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新502' AND b.name='新生教學館';


-- booking 69
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新504' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    12,
    '活動預約',
    '2025-03-22',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-22 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新504' AND b.name='新生教學館';


-- booking 70
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜402' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    167,
    '活動預約',
    '2025-03-11',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-11 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜402' AND b.name='綜合教學館';


-- booking 71
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共401' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    10,
    '活動預約',
    '2025-03-17',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-17 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共401' AND b.name='共同教學館';


-- booking 72
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅307' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    185,
    '活動預約',
    '2025-03-15',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅307' AND b.name='博雅教學館';


-- booking 73
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共205' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    131,
    '活動預約',
    '2025-03-05',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-05 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共205' AND b.name='共同教學館';


-- booking 74
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新201' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    24,
    '活動預約',
    '2025-03-04',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-04 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新201' AND b.name='新生教學館';


-- booking 75
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新403' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    79,
    '活動預約',
    '2025-03-01',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-01 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新403' AND b.name='新生教學館';


-- booking 76
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜2F 樓學習開放空間' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    40,
    '活動預約',
    '2025-03-01',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-01 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜2F 樓學習開放空間' AND b.name='綜合教學館';


-- booking 77
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普302' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    8,
    '活動預約',
    '2025-03-22',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-22 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普302' AND b.name='普通教學館';


-- booking 78
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅303' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    32,
    '活動預約',
    '2025-03-05',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-05 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅303' AND b.name='博雅教學館';


-- booking 79
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普301' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    160,
    '活動預約',
    '2025-03-04',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-04 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普301' AND b.name='普通教學館';


-- booking 80
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新505' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    170,
    '活動預約',
    '2025-03-23',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-23 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新505' AND b.name='新生教學館';


-- booking 81
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共102' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    163,
    '活動預約',
    '2025-03-07',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-07 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共102' AND b.name='共同教學館';


-- booking 82
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普205' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    7,
    '活動預約',
    '2025-03-24',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-24 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普205' AND b.name='普通教學館';


-- booking 83
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普205' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    149,
    '活動預約',
    '2025-03-21',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-21 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普205' AND b.name='普通教學館';


-- booking 84
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新502' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    2,
    '活動預約',
    '2025-03-01',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-01 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新502' AND b.name='新生教學館';


-- booking 85
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜202' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    97,
    '活動預約',
    '2025-03-25',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-25 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜202' AND b.name='綜合教學館';


-- booking 86
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共208' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    185,
    '活動預約',
    '2025-03-19',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-19 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共208' AND b.name='共同教學館';


-- booking 87
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共301' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    5,
    '活動預約',
    '2025-03-21',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-21 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共301' AND b.name='共同教學館';


-- booking 88
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜601' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    124,
    '活動預約',
    '2025-03-06',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-06 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜601' AND b.name='綜合教學館';


-- booking 89
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅307' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    30,
    '活動預約',
    '2025-03-20',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅307' AND b.name='博雅教學館';


-- booking 90
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共405' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    39,
    '活動預約',
    '2025-03-17',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-17 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共405' AND b.name='共同教學館';


-- booking 91
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普205' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    190,
    '活動預約',
    '2025-03-02',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-02 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普205' AND b.name='普通教學館';


-- booking 92
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新503' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    34,
    '活動預約',
    '2025-03-03',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-03 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新503' AND b.name='新生教學館';


-- booking 93
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共104' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    30,
    '活動預約',
    '2025-03-28',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-28 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共104' AND b.name='共同教學館';


-- booking 94
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新301' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    122,
    '活動預約',
    '2025-03-20',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新301' AND b.name='新生教學館';


-- booking 95
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普406' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    129,
    '活動預約',
    '2025-03-16',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普406' AND b.name='普通教學館';


-- booking 96
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普102' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    110,
    '活動預約',
    '2025-03-14',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-14 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普102' AND b.name='普通教學館';


-- booking 97
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新304' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    129,
    '活動預約',
    '2025-03-20',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新304' AND b.name='新生教學館';


-- booking 98
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共304' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    64,
    '活動預約',
    '2025-03-27',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-27 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共304' AND b.name='共同教學館';


-- booking 99
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新502' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    5,
    '活動預約',
    '2025-03-14',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-14 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新502' AND b.name='新生教學館';


-- booking 100
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜505' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    148,
    '活動預約',
    '2025-03-05',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-05 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜505' AND b.name='綜合教學館';


-- booking 101
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅311' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    43,
    '活動預約',
    '2025-03-14',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-14 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅311' AND b.name='博雅教學館';


-- booking 102
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新103' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    125,
    '活動預約',
    '2025-03-12',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-12 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新103' AND b.name='新生教學館';


-- booking 103
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅303' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    21,
    '活動預約',
    '2025-03-16',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅303' AND b.name='博雅教學館';


-- booking 104
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜403' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    93,
    '活動預約',
    '2025-03-30',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜403' AND b.name='綜合教學館';


-- booking 105
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共302' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    156,
    '活動預約',
    '2025-03-14',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-14 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共302' AND b.name='共同教學館';


-- booking 106
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普502' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    142,
    '活動預約',
    '2025-03-23',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-23 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普502' AND b.name='普通教學館';


-- booking 107
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='一樓西側大廳 圖書攤位區 (入口處)' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    24,
    '活動預約',
    '2025-03-28',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-28 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='一樓西側大廳 圖書攤位區 (入口處)' AND b.name='博雅教學館';


-- booking 108
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅204' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    111,
    '活動預約',
    '2025-03-04',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-04 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅204' AND b.name='博雅教學館';


-- booking 109
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共305' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    39,
    '活動預約',
    '2025-03-13',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-13 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共305' AND b.name='共同教學館';


-- booking 110
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共105' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    71,
    '活動預約',
    '2025-03-14',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-14 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共105' AND b.name='共同教學館';


-- booking 111
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共104' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    54,
    '活動預約',
    '2025-03-02',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-02 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共104' AND b.name='共同教學館';


-- booking 112
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅309' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    79,
    '活動預約',
    '2025-03-27',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-27 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅309' AND b.name='博雅教學館';


-- booking 113
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普501' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    87,
    '活動預約',
    '2025-03-16',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普501' AND b.name='普通教學館';


-- booking 114
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普401' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    128,
    '活動預約',
    '2025-03-29',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-29 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普401' AND b.name='普通教學館';


-- booking 115
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普503' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    166,
    '活動預約',
    '2025-03-23',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-23 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普503' AND b.name='普通教學館';


-- booking 116
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜401' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    199,
    '活動預約',
    '2025-03-09',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜401' AND b.name='綜合教學館';


-- booking 117
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅308' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    66,
    '活動預約',
    '2025-03-15',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅308' AND b.name='博雅教學館';


-- booking 118
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅204' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    48,
    '活動預約',
    '2025-03-15',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅204' AND b.name='博雅教學館';


-- booking 119
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='一樓中央大廳 展覽牆柱區' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    98,
    '活動預約',
    '2025-03-13',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-13 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='一樓中央大廳 展覽牆柱區' AND b.name='博雅教學館';


-- booking 120
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普204' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    42,
    '活動預約',
    '2025-03-17',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-17 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普204' AND b.name='普通教學館';


-- booking 121
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜605' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    81,
    '活動預約',
    '2025-03-13',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-13 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜605' AND b.name='綜合教學館';


-- booking 122
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新504' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    159,
    '活動預約',
    '2025-03-23',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-23 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新504' AND b.name='新生教學館';


-- booking 123
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新201' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    85,
    '活動預約',
    '2025-03-14',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-14 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新201' AND b.name='新生教學館';


-- booking 124
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅305' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    175,
    '活動預約',
    '2025-03-18',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-18 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅305' AND b.name='博雅教學館';


-- booking 125
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普204' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    7,
    '活動預約',
    '2025-03-31',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-31 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普204' AND b.name='普通教學館';


-- booking 126
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新404' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    30,
    '活動預約',
    '2025-03-30',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新404' AND b.name='新生教學館';


-- booking 127
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜403' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    69,
    '活動預約',
    '2025-03-04',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-04 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜403' AND b.name='綜合教學館';


-- booking 128
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共105' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    105,
    '活動預約',
    '2025-03-21',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-21 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共105' AND b.name='共同教學館';


-- booking 129
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅308' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    100,
    '活動預約',
    '2025-03-01',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-01 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅308' AND b.name='博雅教學館';


-- booking 130
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共203' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    171,
    '活動預約',
    '2025-03-05',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-05 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共203' AND b.name='共同教學館';


-- booking 131
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新403' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    20,
    '活動預約',
    '2025-03-05',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-05 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新403' AND b.name='新生教學館';


-- booking 132
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共406' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    194,
    '活動預約',
    '2025-03-08',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-08 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共406' AND b.name='共同教學館';


-- booking 133
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普301' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    142,
    '活動預約',
    '2025-03-15',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普301' AND b.name='普通教學館';


-- booking 134
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共302' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    194,
    '活動預約',
    '2025-03-27',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-27 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共302' AND b.name='共同教學館';


-- booking 135
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新505' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    62,
    '活動預約',
    '2025-03-14',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-14 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新505' AND b.name='新生教學館';


-- booking 136
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共306' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    119,
    '活動預約',
    '2025-03-17',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-17 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共306' AND b.name='共同教學館';


-- booking 137
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共308' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    114,
    '活動預約',
    '2025-03-28',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-28 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共308' AND b.name='共同教學館';


-- booking 138
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普405' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    38,
    '活動預約',
    '2025-03-22',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-22 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普405' AND b.name='普通教學館';


-- booking 139
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅303' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    160,
    '活動預約',
    '2025-03-07',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-07 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅303' AND b.name='博雅教學館';


-- booking 140
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新402' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    197,
    '活動預約',
    '2025-03-02',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-02 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新402' AND b.name='新生教學館';


-- booking 141
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜503' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    18,
    '活動預約',
    '2025-03-19',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-19 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜503' AND b.name='綜合教學館';


-- booking 142
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共306' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    133,
    '活動預約',
    '2025-03-17',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-17 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共306' AND b.name='共同教學館';


-- booking 143
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普306' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    101,
    '活動預約',
    '2025-03-25',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-25 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普306' AND b.name='普通教學館';


-- booking 144
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜201' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    78,
    '活動預約',
    '2025-03-17',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-17 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜201' AND b.name='綜合教學館';


-- booking 146
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜301' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    186,
    '活動預約',
    '2025-03-02',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-02 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜301' AND b.name='綜合教學館';


-- booking 147
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜602' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    118,
    '活動預約',
    '2025-03-07',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-07 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜602' AND b.name='綜合教學館';


-- booking 148
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普502' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    24,
    '活動預約',
    '2025-03-17',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-17 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普502' AND b.name='普通教學館';


-- booking 149
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新202' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    188,
    '活動預約',
    '2025-03-28',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-28 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新202' AND b.name='新生教學館';


-- booking 150
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅310' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    25,
    '活動預約',
    '2025-03-01',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-01 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅310' AND b.name='博雅教學館';


-- booking 151
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共407' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    96,
    '活動預約',
    '2025-03-13',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-13 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共407' AND b.name='共同教學館';


-- booking 152
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普101' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    60,
    '活動預約',
    '2025-03-03',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-03 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普101' AND b.name='普通教學館';


-- booking 153
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜302' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    13,
    '活動預約',
    '2025-03-15',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜302' AND b.name='綜合教學館';


-- booking 154
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普205' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    178,
    '活動預約',
    '2025-03-25',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-25 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普205' AND b.name='普通教學館';


-- booking 155
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普401' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    49,
    '活動預約',
    '2025-03-23',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-23 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普401' AND b.name='普通教學館';


-- booking 156
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='一樓中央大廳 展覽牆柱區' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    108,
    '活動預約',
    '2025-03-09',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='一樓中央大廳 展覽牆柱區' AND b.name='博雅教學館';


-- booking 157
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共205' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    184,
    '活動預約',
    '2025-03-06',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-06 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共205' AND b.name='共同教學館';


-- booking 158
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜301' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    188,
    '活動預約',
    '2025-03-08',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-08 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜301' AND b.name='綜合教學館';


-- booking 159
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普303' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    55,
    '活動預約',
    '2025-03-17',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-17 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普303' AND b.name='普通教學館';


-- booking 160
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普502' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    153,
    '活動預約',
    '2025-03-16',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普502' AND b.name='普通教學館';


-- booking 161
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅205' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    32,
    '活動預約',
    '2025-03-12',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-12 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅205' AND b.name='博雅教學館';


-- booking 162
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅102' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    48,
    '活動預約',
    '2025-03-27',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-27 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅102' AND b.name='博雅教學館';


-- booking 163
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共103' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    84,
    '活動預約',
    '2025-03-22',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-22 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共103' AND b.name='共同教學館';


-- booking 164
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普101' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    140,
    '活動預約',
    '2025-03-24',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-24 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普101' AND b.name='普通教學館';


-- booking 165
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普304' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    145,
    '活動預約',
    '2025-03-01',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-01 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普304' AND b.name='普通教學館';


-- booking 166
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普101' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    186,
    '活動預約',
    '2025-03-25',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-25 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普101' AND b.name='普通教學館';


-- booking 167
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共405' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    95,
    '活動預約',
    '2025-03-13',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-13 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共405' AND b.name='共同教學館';


-- booking 168
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜606' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    121,
    '活動預約',
    '2025-03-25',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-25 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜606' AND b.name='綜合教學館';


-- booking 169
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普404' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    157,
    '活動預約',
    '2025-03-21',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-21 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普404' AND b.name='普通教學館';


-- booking 170
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普203' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    57,
    '活動預約',
    '2025-03-03',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-03 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普203' AND b.name='普通教學館';


-- booking 171
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅103' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    71,
    '活動預約',
    '2025-03-02',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-02 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅103' AND b.name='博雅教學館';


-- booking 172
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普505' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    93,
    '活動預約',
    '2025-03-07',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-07 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普505' AND b.name='普通教學館';


-- booking 173
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新301' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    67,
    '活動預約',
    '2025-03-10',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-10 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新301' AND b.name='新生教學館';


-- booking 174
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普303' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    1,
    '活動預約',
    '2025-03-05',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-05 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普303' AND b.name='普通教學館';


-- booking 175
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜601' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    3,
    '活動預約',
    '2025-03-04',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-04 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜601' AND b.name='綜合教學館';


-- booking 176
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜201' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    77,
    '活動預約',
    '2025-03-26',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-26 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜201' AND b.name='綜合教學館';


-- booking 177
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新401' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    98,
    '活動預約',
    '2025-03-04',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-04 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新401' AND b.name='新生教學館';


-- booking 178
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共406' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    200,
    '活動預約',
    '2025-03-12',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-12 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共406' AND b.name='共同教學館';


-- booking 179
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普306' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    43,
    '活動預約',
    '2025-03-14',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-14 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普306' AND b.name='普通教學館';


-- booking 180
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜合大講堂' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    157,
    '活動預約',
    '2025-03-22',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-22 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜合大講堂' AND b.name='綜合教學館';


-- booking 181
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共407' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    58,
    '活動預約',
    '2025-03-16',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共407' AND b.name='共同教學館';


-- booking 182
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜501' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    149,
    '活動預約',
    '2025-03-05',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-05 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜501' AND b.name='綜合教學館';


-- booking 183
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新304' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    61,
    '活動預約',
    '2025-03-23',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-23 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新304' AND b.name='新生教學館';


-- booking 184
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新403' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    180,
    '活動預約',
    '2025-03-20',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新403' AND b.name='新生教學館';


-- booking 185
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅307' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    50,
    '活動預約',
    '2025-03-18',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-18 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅307' AND b.name='博雅教學館';


-- booking 186
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普405' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    134,
    '活動預約',
    '2025-03-30',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普405' AND b.name='普通教學館';


-- booking 187
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共404' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    83,
    '活動預約',
    '2025-03-15',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共404' AND b.name='共同教學館';


-- booking 188
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅102' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    110,
    '活動預約',
    '2025-03-08',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-08 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅102' AND b.name='博雅教學館';


-- booking 189
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新301' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    61,
    '活動預約',
    '2025-03-28',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-28 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新301' AND b.name='新生教學館';


-- booking 190
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅301' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    72,
    '活動預約',
    '2025-03-14',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-14 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅301' AND b.name='博雅教學館';


-- booking 191
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅310' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    67,
    '活動預約',
    '2025-03-09',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅310' AND b.name='博雅教學館';


-- booking 192
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共204' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    179,
    '活動預約',
    '2025-03-30',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共204' AND b.name='共同教學館';


-- booking 193
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜502' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    46,
    '活動預約',
    '2025-03-11',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-11 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜502' AND b.name='綜合教學館';


-- booking 194
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共208' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    72,
    '活動預約',
    '2025-03-03',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-03 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共208' AND b.name='共同教學館';


-- booking 195
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅103' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    115,
    '活動預約',
    '2025-03-26',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-26 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅103' AND b.name='博雅教學館';


-- booking 196
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共205' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    165,
    '活動預約',
    '2025-03-02',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-02 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共205' AND b.name='共同教學館';


-- booking 197
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普401' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    1,
    '活動預約',
    '2025-03-28',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-28 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普401' AND b.name='普通教學館';


-- booking 198
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜201' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    60,
    '活動預約',
    '2025-03-20',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜201' AND b.name='綜合教學館';


-- booking 199
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普402' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    174,
    '活動預約',
    '2025-03-23',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-23 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普402' AND b.name='普通教學館';


-- booking 200
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共101' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    55,
    '活動預約',
    '2025-03-07',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-07 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共101' AND b.name='共同教學館';


-- booking 201
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅302' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    99,
    '活動預約',
    '2025-03-21',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-21 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅302' AND b.name='博雅教學館';


-- booking 202
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅311' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    69,
    '活動預約',
    '2025-03-20',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅311' AND b.name='博雅教學館';


-- booking 203
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共203' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    171,
    '活動預約',
    '2025-03-20',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共203' AND b.name='共同教學館';


-- booking 204
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新404' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    177,
    '活動預約',
    '2025-03-28',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-28 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新404' AND b.name='新生教學館';


-- booking 205
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普102' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    68,
    '活動預約',
    '2025-03-17',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-17 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普102' AND b.name='普通教學館';


-- booking 206
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共101' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    167,
    '活動預約',
    '2025-03-11',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-11 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共101' AND b.name='共同教學館';


-- booking 207
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普102' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    19,
    '活動預約',
    '2025-03-30',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普102' AND b.name='普通教學館';


-- booking 208
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新102' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    132,
    '活動預約',
    '2025-03-17',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-17 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新102' AND b.name='新生教學館';


-- booking 209
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新304' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    61,
    '活動預約',
    '2025-03-13',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-13 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新304' AND b.name='新生教學館';


-- booking 210
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅311' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    172,
    '活動預約',
    '2025-03-31',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-31 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅311' AND b.name='博雅教學館';


-- booking 211
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共201' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    151,
    '活動預約',
    '2025-03-10',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-10 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共201' AND b.name='共同教學館';


-- booking 212
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共208' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    111,
    '活動預約',
    '2025-03-03',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-03 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共208' AND b.name='共同教學館';


-- booking 213
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新201' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    69,
    '活動預約',
    '2025-03-09',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新201' AND b.name='新生教學館';


-- booking 214
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅101/華南講堂' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    8,
    '活動預約',
    '2025-03-10',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-10 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅101/華南講堂' AND b.name='博雅教學館';


-- booking 215
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜403' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    143,
    '活動預約',
    '2025-03-03',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-03 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜403' AND b.name='綜合教學館';


-- booking 216
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新505' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    13,
    '活動預約',
    '2025-03-31',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-31 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新505' AND b.name='新生教學館';


-- booking 217
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普202' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    190,
    '活動預約',
    '2025-03-09',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普202' AND b.name='普通教學館';


-- booking 218
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共407' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    140,
    '活動預約',
    '2025-03-19',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-19 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共407' AND b.name='共同教學館';


-- booking 219
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜2F 樓學習開放空間' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    101,
    '活動預約',
    '2025-03-04',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-04 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜2F 樓學習開放空間' AND b.name='綜合教學館';


-- booking 220
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共305' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    100,
    '活動預約',
    '2025-03-15',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共305' AND b.name='共同教學館';


-- booking 221
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅312' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    170,
    '活動預約',
    '2025-03-12',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-12 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅312' AND b.name='博雅教學館';


-- booking 222
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共105' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    67,
    '活動預約',
    '2025-03-31',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-31 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共105' AND b.name='共同教學館';


-- booking 223
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜1F 樓學習開放空間' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    72,
    '活動預約',
    '2025-03-07',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-07 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜1F 樓學習開放空間' AND b.name='綜合教學館';


-- booking 224
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅312' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    69,
    '活動預約',
    '2025-03-30',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅312' AND b.name='博雅教學館';


-- booking 225
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共101' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    49,
    '活動預約',
    '2025-03-13',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-13 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共101' AND b.name='共同教學館';


-- booking 226
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜602' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    118,
    '活動預約',
    '2025-03-20',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜602' AND b.name='綜合教學館';


-- booking 227
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜201' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    195,
    '活動預約',
    '2025-03-18',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-18 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜201' AND b.name='綜合教學館';


-- booking 228
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普402' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    47,
    '活動預約',
    '2025-03-03',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-03 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普402' AND b.name='普通教學館';


-- booking 229
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普302' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    90,
    '活動預約',
    '2025-03-14',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-14 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普302' AND b.name='普通教學館';


-- booking 230
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅310' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    158,
    '活動預約',
    '2025-03-23',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-23 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅310' AND b.name='博雅教學館';


-- booking 231
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共204' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    130,
    '活動預約',
    '2025-03-16',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共204' AND b.name='共同教學館';


-- booking 232
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新503' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    30,
    '活動預約',
    '2025-03-02',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-02 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新503' AND b.name='新生教學館';


-- booking 233
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜302' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    134,
    '活動預約',
    '2025-03-18',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-18 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜302' AND b.name='綜合教學館';


-- booking 234
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普204' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    162,
    '活動預約',
    '2025-03-01',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-01 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普204' AND b.name='普通教學館';


-- booking 235
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜606' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    174,
    '活動預約',
    '2025-03-31',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-31 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜606' AND b.name='綜合教學館';


-- booking 236
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普201' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    198,
    '活動預約',
    '2025-03-03',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-03 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普201' AND b.name='普通教學館';


-- booking 237
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅308' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    127,
    '活動預約',
    '2025-03-04',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-04 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅308' AND b.name='博雅教學館';


-- booking 238
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共302' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    51,
    '活動預約',
    '2025-03-19',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-19 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共302' AND b.name='共同教學館';


-- booking 239
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普305' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    174,
    '活動預約',
    '2025-03-22',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-22 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普305' AND b.name='普通教學館';


-- booking 240
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新102' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    25,
    '活動預約',
    '2025-03-15',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新102' AND b.name='新生教學館';


-- booking 241
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共205' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    110,
    '活動預約',
    '2025-03-24',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-24 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共205' AND b.name='共同教學館';


-- booking 242
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共402' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    64,
    '活動預約',
    '2025-03-28',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-28 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共402' AND b.name='共同教學館';


-- booking 243
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普503' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    24,
    '活動預約',
    '2025-03-08',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-08 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普503' AND b.name='普通教學館';


-- booking 244
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅307' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    79,
    '活動預約',
    '2025-03-20',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅307' AND b.name='博雅教學館';


-- booking 245
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共403' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    184,
    '活動預約',
    '2025-03-05',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-05 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共403' AND b.name='共同教學館';


-- booking 246
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普204' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    8,
    '活動預約',
    '2025-03-19',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-19 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普204' AND b.name='普通教學館';


-- booking 247
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅301' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    108,
    '活動預約',
    '2025-03-12',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-12 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅301' AND b.name='博雅教學館';


-- booking 248
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜602' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    124,
    '活動預約',
    '2025-03-26',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-26 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜602' AND b.name='綜合教學館';


-- booking 249
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新204' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    193,
    '活動預約',
    '2025-03-15',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新204' AND b.name='新生教學館';


-- booking 250
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普301' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    74,
    '活動預約',
    '2025-03-13',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-13 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普301' AND b.name='普通教學館';


-- booking 251
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅308' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    22,
    '活動預約',
    '2025-03-10',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-10 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅308' AND b.name='博雅教學館';


-- booking 252
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅303' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    105,
    '活動預約',
    '2025-03-03',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-03 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅303' AND b.name='博雅教學館';


-- booking 253
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅101/華南講堂' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    91,
    '活動預約',
    '2025-03-09',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅101/華南講堂' AND b.name='博雅教學館';


-- booking 254
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普303' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    163,
    '活動預約',
    '2025-03-03',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-03 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普303' AND b.name='普通教學館';


-- booking 255
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共202' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    134,
    '活動預約',
    '2025-03-30',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共202' AND b.name='共同教學館';


-- booking 256
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅304' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    60,
    '活動預約',
    '2025-03-12',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-12 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅304' AND b.name='博雅教學館';


-- booking 257
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普502' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    88,
    '活動預約',
    '2025-03-08',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-08 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普502' AND b.name='普通教學館';


-- booking 258
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普103' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    45,
    '活動預約',
    '2025-03-05',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-05 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普103' AND b.name='普通教學館';


-- booking 259
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共306' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    131,
    '活動預約',
    '2025-03-11',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-11 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共306' AND b.name='共同教學館';


-- booking 260
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共201' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    140,
    '活動預約',
    '2025-03-09',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共201' AND b.name='共同教學館';


-- booking 261
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅310' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    79,
    '活動預約',
    '2025-03-25',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-25 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅310' AND b.name='博雅教學館';


-- booking 262
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜502' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    193,
    '活動預約',
    '2025-03-27',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-27 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜502' AND b.name='綜合教學館';


-- booking 263
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共204' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    141,
    '活動預約',
    '2025-03-24',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-24 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共204' AND b.name='共同教學館';


-- booking 264
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共402' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    84,
    '活動預約',
    '2025-03-24',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-24 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共402' AND b.name='共同教學館';


-- booking 265
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜合大講堂' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    27,
    '活動預約',
    '2025-03-13',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-13 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜合大講堂' AND b.name='綜合教學館';


-- booking 266
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共202' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    117,
    '活動預約',
    '2025-03-05',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-05 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共202' AND b.name='共同教學館';


-- booking 267
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜404' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    190,
    '活動預約',
    '2025-03-01',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-01 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜404' AND b.name='綜合教學館';


-- booking 268
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普305' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    189,
    '活動預約',
    '2025-03-08',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-08 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普305' AND b.name='普通教學館';


-- booking 269
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜603' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    174,
    '活動預約',
    '2025-03-23',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-23 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜603' AND b.name='綜合教學館';


-- booking 270
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅309' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    80,
    '活動預約',
    '2025-03-21',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-21 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅309' AND b.name='博雅教學館';


-- booking 271
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新204' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    24,
    '活動預約',
    '2025-03-12',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-12 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新204' AND b.name='新生教學館';


-- booking 272
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普401' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    8,
    '活動預約',
    '2025-03-04',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-04 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普401' AND b.name='普通教學館';


-- booking 273
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜合大講堂' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    23,
    '活動預約',
    '2025-03-23',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-23 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜合大講堂' AND b.name='綜合教學館';


-- booking 274
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共308' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    139,
    '活動預約',
    '2025-03-20',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共308' AND b.name='共同教學館';


-- booking 275
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共204' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    20,
    '活動預約',
    '2025-03-04',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-04 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共204' AND b.name='共同教學館';


-- booking 276
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共306' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    173,
    '活動預約',
    '2025-03-05',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-05 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共306' AND b.name='共同教學館';


-- booking 277
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅310' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    135,
    '活動預約',
    '2025-03-30',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅310' AND b.name='博雅教學館';


-- booking 278
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共304' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    67,
    '活動預約',
    '2025-03-01',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-01 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共304' AND b.name='共同教學館';


-- booking 279
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜401' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    86,
    '活動預約',
    '2025-03-21',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-21 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜401' AND b.name='綜合教學館';


-- booking 280
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新505' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    48,
    '活動預約',
    '2025-03-21',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-21 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新505' AND b.name='新生教學館';


-- booking 281
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普505' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    127,
    '活動預約',
    '2025-03-24',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-24 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普505' AND b.name='普通教學館';


-- booking 283
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普201' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    112,
    '活動預約',
    '2025-03-20',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普201' AND b.name='普通教學館';


-- booking 284
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新502' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    148,
    '活動預約',
    '2025-03-09',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新502' AND b.name='新生教學館';


-- booking 285
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普306' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    43,
    '活動預約',
    '2025-03-06',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-06 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普306' AND b.name='普通教學館';


-- booking 286
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普403' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    74,
    '活動預約',
    '2025-03-30',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普403' AND b.name='普通教學館';


-- booking 287
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新503' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    179,
    '活動預約',
    '2025-03-19',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-19 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新503' AND b.name='新生教學館';


-- booking 288
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共406' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    115,
    '活動預約',
    '2025-03-31',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-31 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共406' AND b.name='共同教學館';


-- booking 289
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜1F 樓學習開放空間' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    155,
    '活動預約',
    '2025-03-09',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜1F 樓學習開放空間' AND b.name='綜合教學館';


-- booking 290
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜603' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    122,
    '活動預約',
    '2025-03-14',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-14 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜603' AND b.name='綜合教學館';


-- booking 291
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅102' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    160,
    '活動預約',
    '2025-03-30',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅102' AND b.name='博雅教學館';


-- booking 292
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普102' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    165,
    '活動預約',
    '2025-03-02',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-02 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普102' AND b.name='普通教學館';


-- booking 293
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅103' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    45,
    '活動預約',
    '2025-03-17',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-17 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅103' AND b.name='博雅教學館';


-- booking 294
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅306' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    38,
    '活動預約',
    '2025-03-07',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-07 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅306' AND b.name='博雅教學館';


-- booking 295
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅308' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    188,
    '活動預約',
    '2025-03-07',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-07 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅308' AND b.name='博雅教學館';


-- booking 296
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共205' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    74,
    '活動預約',
    '2025-03-01',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-01 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共205' AND b.name='共同教學館';


-- booking 298
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='一樓西側大廳 圖書攤位區 (入口處)' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    193,
    '活動預約',
    '2025-03-22',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-22 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='一樓西側大廳 圖書攤位區 (入口處)' AND b.name='博雅教學館';


-- booking 299
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅301' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    14,
    '活動預約',
    '2025-03-31',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-31 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅301' AND b.name='博雅教學館';


-- booking 300
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='中央大廳圓桌區' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    108,
    '活動預約',
    '2025-03-13',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-13 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='中央大廳圓桌區' AND b.name='博雅教學館';


-- booking 301
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普203' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    65,
    '活動預約',
    '2025-03-20',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普203' AND b.name='普通教學館';


-- booking 302
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅311' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    105,
    '活動預約',
    '2025-03-10',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-10 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅311' AND b.name='博雅教學館';


-- booking 303
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新501' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    100,
    '活動預約',
    '2025-03-28',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-28 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新501' AND b.name='新生教學館';


-- booking 304
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅202' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    107,
    '活動預約',
    '2025-03-16',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅202' AND b.name='博雅教學館';


-- booking 305
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新303' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    180,
    '活動預約',
    '2025-03-10',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-10 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新303' AND b.name='新生教學館';


-- booking 306
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普406' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    187,
    '活動預約',
    '2025-03-29',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-29 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普406' AND b.name='普通教學館';


-- booking 307
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普205' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    115,
    '活動預約',
    '2025-03-09',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普205' AND b.name='普通教學館';


-- booking 308
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅302' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    38,
    '活動預約',
    '2025-03-08',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-08 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅302' AND b.name='博雅教學館';


-- booking 309
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共102' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    40,
    '活動預約',
    '2025-03-31',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-31 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共102' AND b.name='共同教學館';


-- booking 310
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅301' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    140,
    '活動預約',
    '2025-03-31',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-31 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅301' AND b.name='博雅教學館';


-- booking 311
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共201' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    12,
    '活動預約',
    '2025-03-22',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-22 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共201' AND b.name='共同教學館';


-- booking 312
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅312' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    76,
    '活動預約',
    '2025-03-10',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-10 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅312' AND b.name='博雅教學館';


-- booking 313
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共101' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    109,
    '活動預約',
    '2025-03-18',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-18 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共101' AND b.name='共同教學館';


-- booking 314
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共205' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    143,
    '活動預約',
    '2025-03-30',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共205' AND b.name='共同教學館';


-- booking 315
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅305' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    147,
    '活動預約',
    '2025-03-30',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅305' AND b.name='博雅教學館';


-- booking 316
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新401' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    179,
    '活動預約',
    '2025-03-24',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-24 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新401' AND b.name='新生教學館';


-- booking 317
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普301' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    49,
    '活動預約',
    '2025-03-18',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-18 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普301' AND b.name='普通教學館';


-- booking 318
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜505' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    62,
    '活動預約',
    '2025-03-24',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-24 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜505' AND b.name='綜合教學館';


-- booking 319
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新405' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    170,
    '活動預約',
    '2025-03-19',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-19 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新405' AND b.name='新生教學館';


-- booking 320
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普403' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    118,
    '活動預約',
    '2025-03-12',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-12 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普403' AND b.name='普通教學館';


-- booking 321
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共208' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    150,
    '活動預約',
    '2025-03-26',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-26 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共208' AND b.name='共同教學館';


-- booking 322
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新405' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    169,
    '活動預約',
    '2025-03-22',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-22 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新405' AND b.name='新生教學館';


-- booking 323
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普403' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    24,
    '活動預約',
    '2025-03-21',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-21 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普403' AND b.name='普通教學館';


-- booking 324
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅206' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    126,
    '活動預約',
    '2025-03-23',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-23 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅206' AND b.name='博雅教學館';


-- booking 325
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普406' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    24,
    '活動預約',
    '2025-03-29',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-29 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普406' AND b.name='普通教學館';


-- booking 326
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共206' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    72,
    '活動預約',
    '2025-03-16',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共206' AND b.name='共同教學館';


-- booking 327
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅302' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    11,
    '活動預約',
    '2025-03-06',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-06 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅302' AND b.name='博雅教學館';


-- booking 328
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='一樓西側大廳 桌椅區 (101 教室旁)' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    164,
    '活動預約',
    '2025-03-01',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-01 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='一樓西側大廳 桌椅區 (101 教室旁)' AND b.name='博雅教學館';


-- booking 329
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普103' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    69,
    '活動預約',
    '2025-03-08',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-08 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普103' AND b.name='普通教學館';


-- booking 330
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普102' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    98,
    '活動預約',
    '2025-03-04',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-04 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普102' AND b.name='普通教學館';


-- booking 331
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅308' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    128,
    '活動預約',
    '2025-03-07',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-07 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅308' AND b.name='博雅教學館';


-- booking 332
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅202' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    131,
    '活動預約',
    '2025-03-29',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-29 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅202' AND b.name='博雅教學館';


-- booking 333
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共208' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    92,
    '活動預約',
    '2025-03-21',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-21 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共208' AND b.name='共同教學館';


-- booking 334
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜2F 樓學習開放空間' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    29,
    '活動預約',
    '2025-03-24',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-24 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜2F 樓學習開放空間' AND b.name='綜合教學館';


-- booking 335
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜605' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    75,
    '活動預約',
    '2025-03-22',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-22 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜605' AND b.name='綜合教學館';


-- booking 336
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜403' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    112,
    '活動預約',
    '2025-03-13',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-13 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜403' AND b.name='綜合教學館';


-- booking 337
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅304' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    148,
    '活動預約',
    '2025-03-10',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-10 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅304' AND b.name='博雅教學館';


-- booking 338
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共307' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    57,
    '活動預約',
    '2025-03-19',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-19 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共307' AND b.name='共同教學館';


-- booking 339
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共207' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    199,
    '活動預約',
    '2025-03-22',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-22 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共207' AND b.name='共同教學館';


-- booking 340
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共302' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    76,
    '活動預約',
    '2025-03-11',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-11 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共302' AND b.name='共同教學館';


-- booking 341
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共102' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    111,
    '活動預約',
    '2025-03-15',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共102' AND b.name='共同教學館';


-- booking 342
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共302' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    59,
    '活動預約',
    '2025-03-18',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-18 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共302' AND b.name='共同教學館';


-- booking 343
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅201' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    110,
    '活動預約',
    '2025-03-08',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-08 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅201' AND b.name='博雅教學館';


-- booking 344
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共204' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    163,
    '活動預約',
    '2025-03-04',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-04 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共204' AND b.name='共同教學館';


-- booking 345
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新405' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    128,
    '活動預約',
    '2025-03-08',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-08 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新405' AND b.name='新生教學館';


-- booking 346
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新401' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    23,
    '活動預約',
    '2025-03-17',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-17 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新401' AND b.name='新生教學館';


-- booking 347
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜602' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    55,
    '活動預約',
    '2025-03-06',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-06 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜602' AND b.name='綜合教學館';


-- booking 348
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共207' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    117,
    '活動預約',
    '2025-03-24',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-24 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共207' AND b.name='共同教學館';


-- booking 349
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共404' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    22,
    '活動預約',
    '2025-03-25',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-25 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共404' AND b.name='共同教學館';


-- booking 350
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新203' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    186,
    '活動預約',
    '2025-03-20',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新203' AND b.name='新生教學館';


-- booking 351
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新402' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    8,
    '活動預約',
    '2025-03-12',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-12 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新402' AND b.name='新生教學館';


-- booking 352
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅306' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    21,
    '活動預約',
    '2025-03-29',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-29 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅306' AND b.name='博雅教學館';


-- booking 353
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普201' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    31,
    '活動預約',
    '2025-03-26',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-26 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普201' AND b.name='普通教學館';


-- booking 354
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普302' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    110,
    '活動預約',
    '2025-03-26',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-26 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普302' AND b.name='普通教學館';


-- booking 355
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共101' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    62,
    '活動預約',
    '2025-03-16',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共101' AND b.name='共同教學館';


-- booking 356
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新301' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    198,
    '活動預約',
    '2025-03-07',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-07 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新301' AND b.name='新生教學館';


-- booking 357
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普503' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    155,
    '活動預約',
    '2025-03-29',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-29 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普503' AND b.name='普通教學館';


-- booking 358
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新204' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    180,
    '活動預約',
    '2025-03-18',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-18 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新204' AND b.name='新生教學館';


-- booking 359
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共403' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    138,
    '活動預約',
    '2025-03-22',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-22 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共403' AND b.name='共同教學館';


-- booking 360
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共208' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    135,
    '活動預約',
    '2025-03-06',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-06 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共208' AND b.name='共同教學館';


-- booking 361
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新102' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    37,
    '活動預約',
    '2025-03-25',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-25 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新102' AND b.name='新生教學館';


-- booking 362
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅205' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    88,
    '活動預約',
    '2025-03-09',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅205' AND b.name='博雅教學館';


-- booking 363
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜504' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    44,
    '活動預約',
    '2025-03-11',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-11 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜504' AND b.name='綜合教學館';


-- booking 364
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共407' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    77,
    '活動預約',
    '2025-03-30',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共407' AND b.name='共同教學館';


-- booking 365
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共103' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    147,
    '活動預約',
    '2025-03-07',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-07 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共103' AND b.name='共同教學館';


-- booking 366
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜301' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    131,
    '活動預約',
    '2025-03-03',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-03 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜301' AND b.name='綜合教學館';


-- booking 367
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新404' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    193,
    '活動預約',
    '2025-03-29',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-29 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新404' AND b.name='新生教學館';


-- booking 368
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜602' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    199,
    '活動預約',
    '2025-03-08',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-08 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜602' AND b.name='綜合教學館';


-- booking 369
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅202' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    118,
    '活動預約',
    '2025-03-18',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-18 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅202' AND b.name='博雅教學館';


-- booking 370
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新503' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    189,
    '活動預約',
    '2025-03-31',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-31 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新503' AND b.name='新生教學館';


-- booking 371
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜602' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    155,
    '活動預約',
    '2025-03-04',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-04 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜602' AND b.name='綜合教學館';


-- booking 372
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共105' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    167,
    '活動預約',
    '2025-03-20',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共105' AND b.name='共同教學館';


-- booking 373
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普501' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    2,
    '活動預約',
    '2025-03-20',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普501' AND b.name='普通教學館';


-- booking 374
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新102' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    73,
    '活動預約',
    '2025-03-20',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新102' AND b.name='新生教學館';


-- booking 375
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共103' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    126,
    '活動預約',
    '2025-03-25',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-25 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共103' AND b.name='共同教學館';


-- booking 376
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共203' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    60,
    '活動預約',
    '2025-03-08',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-08 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共203' AND b.name='共同教學館';


-- booking 377
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共402' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    63,
    '活動預約',
    '2025-03-18',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-18 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共402' AND b.name='共同教學館';


-- booking 378
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜1F 樓學習開放空間' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    89,
    '活動預約',
    '2025-03-08',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-08 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜1F 樓學習開放空間' AND b.name='綜合教學館';


-- booking 379
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜401' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    70,
    '活動預約',
    '2025-03-18',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-18 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜401' AND b.name='綜合教學館';


-- booking 381
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅103' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    153,
    '活動預約',
    '2025-03-29',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-29 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅103' AND b.name='博雅教學館';


-- booking 382
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新303' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    25,
    '活動預約',
    '2025-03-31',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-31 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新303' AND b.name='新生教學館';


-- booking 383
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共103' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    167,
    '活動預約',
    '2025-03-18',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-18 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共103' AND b.name='共同教學館';


-- booking 384
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅304' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    174,
    '活動預約',
    '2025-03-09',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅304' AND b.name='博雅教學館';


-- booking 386
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜401' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    105,
    '活動預約',
    '2025-03-30',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜401' AND b.name='綜合教學館';


-- booking 387
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共208' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    77,
    '活動預約',
    '2025-03-12',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-12 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共208' AND b.name='共同教學館';


-- booking 388
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新402' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    144,
    '活動預約',
    '2025-03-07',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-07 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新402' AND b.name='新生教學館';


-- booking 389
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜607' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    124,
    '活動預約',
    '2025-03-01',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-01 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜607' AND b.name='綜合教學館';


-- booking 390
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共306' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    168,
    '活動預約',
    '2025-03-12',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-12 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共306' AND b.name='共同教學館';


-- booking 391
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普404' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    110,
    '活動預約',
    '2025-03-16',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普404' AND b.name='普通教學館';


-- booking 392
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜201' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    136,
    '活動預約',
    '2025-03-29',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-29 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜201' AND b.name='綜合教學館';


-- booking 393
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜302' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    168,
    '活動預約',
    '2025-03-12',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-12 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜302' AND b.name='綜合教學館';


-- booking 394
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜602' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    18,
    '活動預約',
    '2025-03-16',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜602' AND b.name='綜合教學館';


-- booking 395
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜301' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    45,
    '活動預約',
    '2025-03-16',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜301' AND b.name='綜合教學館';


-- booking 396
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普401' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    91,
    '活動預約',
    '2025-03-23',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-23 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普401' AND b.name='普通教學館';


-- booking 397
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅308' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    112,
    '活動預約',
    '2025-03-05',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-05 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅308' AND b.name='博雅教學館';


-- booking 398
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普306' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    190,
    '活動預約',
    '2025-03-06',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-06 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普306' AND b.name='普通教學館';


-- booking 399
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅311' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    57,
    '活動預約',
    '2025-03-27',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-27 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅311' AND b.name='博雅教學館';


-- booking 400
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜302' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    200,
    '活動預約',
    '2025-03-30',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜302' AND b.name='綜合教學館';


-- booking 401
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜502' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    101,
    '活動預約',
    '2025-03-16',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜502' AND b.name='綜合教學館';


-- booking 402
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅205' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    138,
    '活動預約',
    '2025-03-15',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅205' AND b.name='博雅教學館';


-- booking 403
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅312' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    181,
    '活動預約',
    '2025-03-30',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅312' AND b.name='博雅教學館';


-- booking 404
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普502' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    177,
    '活動預約',
    '2025-03-19',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-19 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普502' AND b.name='普通教學館';


-- booking 405
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普201' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    31,
    '活動預約',
    '2025-03-18',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-18 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普201' AND b.name='普通教學館';


-- booking 406
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共304' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    77,
    '活動預約',
    '2025-03-09',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共304' AND b.name='共同教學館';


-- booking 407
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新502' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    188,
    '活動預約',
    '2025-03-10',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-10 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新502' AND b.name='新生教學館';


-- booking 408
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共301' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    19,
    '活動預約',
    '2025-03-15',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共301' AND b.name='共同教學館';


-- booking 409
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普103' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    163,
    '活動預約',
    '2025-03-28',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-28 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普103' AND b.name='普通教學館';


-- booking 410
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普504' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    51,
    '活動預約',
    '2025-03-12',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-12 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普504' AND b.name='普通教學館';


-- booking 411
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新402' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    196,
    '活動預約',
    '2025-03-03',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-03 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新402' AND b.name='新生教學館';


-- booking 412
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅202' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    190,
    '活動預約',
    '2025-03-19',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-19 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅202' AND b.name='博雅教學館';


-- booking 413
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普102' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    136,
    '活動預約',
    '2025-03-19',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-19 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普102' AND b.name='普通教學館';


-- booking 414
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新403' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    134,
    '活動預約',
    '2025-03-11',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-11 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新403' AND b.name='新生教學館';


-- booking 415
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新501' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    44,
    '活動預約',
    '2025-03-15',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新501' AND b.name='新生教學館';


-- booking 416
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜606' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    91,
    '活動預約',
    '2025-03-09',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜606' AND b.name='綜合教學館';


-- booking 417
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜503' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    37,
    '活動預約',
    '2025-03-13',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-13 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜503' AND b.name='綜合教學館';


-- booking 418
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共206' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    30,
    '活動預約',
    '2025-03-11',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-11 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共206' AND b.name='共同教學館';


-- booking 419
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜202' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    32,
    '活動預約',
    '2025-03-20',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜202' AND b.name='綜合教學館';


-- booking 420
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普401' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    112,
    '活動預約',
    '2025-03-14',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-14 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普401' AND b.name='普通教學館';


-- booking 421
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普305' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    112,
    '活動預約',
    '2025-03-23',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-23 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普305' AND b.name='普通教學館';


-- booking 422
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共206' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    105,
    '活動預約',
    '2025-03-25',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-25 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共206' AND b.name='共同教學館';


-- booking 423
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共301' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    158,
    '活動預約',
    '2025-03-17',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-17 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共301' AND b.name='共同教學館';


-- booking 424
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅309' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    17,
    '活動預約',
    '2025-03-31',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-31 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅309' AND b.name='博雅教學館';


-- booking 425
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共406' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    90,
    '活動預約',
    '2025-03-15',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共406' AND b.name='共同教學館';


-- booking 426
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅309' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    106,
    '活動預約',
    '2025-03-11',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-11 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅309' AND b.name='博雅教學館';


-- booking 428
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜402' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    36,
    '活動預約',
    '2025-03-21',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-21 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜402' AND b.name='綜合教學館';


-- booking 429
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新403' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    86,
    '活動預約',
    '2025-03-17',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-17 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新403' AND b.name='新生教學館';


-- booking 430
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新501' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    41,
    '活動預約',
    '2025-03-16',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新501' AND b.name='新生教學館';


-- booking 431
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共205' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    156,
    '活動預約',
    '2025-03-07',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-07 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共205' AND b.name='共同教學館';


-- booking 432
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共104' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    86,
    '活動預約',
    '2025-03-07',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-07 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共104' AND b.name='共同教學館';


-- booking 433
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜302' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    54,
    '活動預約',
    '2025-03-21',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-21 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜302' AND b.name='綜合教學館';


-- booking 434
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共206' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    101,
    '活動預約',
    '2025-03-29',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-29 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共206' AND b.name='共同教學館';


-- booking 435
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜605' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    45,
    '活動預約',
    '2025-03-25',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-25 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜605' AND b.name='綜合教學館';


-- booking 436
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新103' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    177,
    '活動預約',
    '2025-03-27',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-27 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新103' AND b.name='新生教學館';


-- booking 437
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅101/華南講堂' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    121,
    '活動預約',
    '2025-03-16',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅101/華南講堂' AND b.name='博雅教學館';


-- booking 438
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅304' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    52,
    '活動預約',
    '2025-03-21',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-21 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅304' AND b.name='博雅教學館';


-- booking 439
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜302' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    121,
    '活動預約',
    '2025-03-30',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜302' AND b.name='綜合教學館';


-- booking 440
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共403' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    123,
    '活動預約',
    '2025-03-31',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-31 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共403' AND b.name='共同教學館';


-- booking 441
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新502' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    125,
    '活動預約',
    '2025-03-20',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-20 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新502' AND b.name='新生教學館';


-- booking 442
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜606' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    23,
    '活動預約',
    '2025-03-08',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-08 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜606' AND b.name='綜合教學館';


-- booking 443
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新402' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    28,
    '活動預約',
    '2025-03-12',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-12 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新402' AND b.name='新生教學館';


-- booking 444
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共405' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    163,
    '活動預約',
    '2025-03-08',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-08 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共405' AND b.name='共同教學館';


-- booking 445
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共101' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    151,
    '活動預約',
    '2025-03-01',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-01 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共101' AND b.name='共同教學館';


-- booking 446
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜402' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    111,
    '活動預約',
    '2025-03-31',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-31 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜402' AND b.name='綜合教學館';


-- booking 447
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅103' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    2,
    '活動預約',
    '2025-03-01',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-01 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅103' AND b.name='博雅教學館';


-- booking 448
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜203' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    180,
    '活動預約',
    '2025-03-12',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-12 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜203' AND b.name='綜合教學館';


-- booking 449
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新201' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    29,
    '活動預約',
    '2025-03-21',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-21 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新201' AND b.name='新生教學館';


-- booking 450
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共202' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    83,
    '活動預約',
    '2025-03-23',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-23 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共202' AND b.name='共同教學館';


-- booking 451
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新301' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    13,
    '活動預約',
    '2025-03-03',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-03 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新301' AND b.name='新生教學館';


-- booking 452
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜504' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    53,
    '活動預約',
    '2025-03-31',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-31 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜504' AND b.name='綜合教學館';


-- booking 453
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普103' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    36,
    '活動預約',
    '2025-03-03',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-03 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普103' AND b.name='普通教學館';


-- booking 454
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新402' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    172,
    '活動預約',
    '2025-03-30',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新402' AND b.name='新生教學館';


-- booking 456
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅201' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    39,
    '活動預約',
    '2025-03-13',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-13 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅201' AND b.name='博雅教學館';


-- booking 457
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普404' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    100,
    '活動預約',
    '2025-03-19',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-19 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普404' AND b.name='普通教學館';


-- booking 458
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅303' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    156,
    '活動預約',
    '2025-03-25',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-25 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅303' AND b.name='博雅教學館';


-- booking 459
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅102' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    165,
    '活動預約',
    '2025-03-29',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-29 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅102' AND b.name='博雅教學館';


-- booking 460
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅303' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    176,
    '活動預約',
    '2025-03-15',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅303' AND b.name='博雅教學館';


-- booking 461
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜402' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    78,
    '活動預約',
    '2025-03-02',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-02 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜402' AND b.name='綜合教學館';


-- booking 462
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜404' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    6,
    '活動預約',
    '2025-03-24',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-24 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜404' AND b.name='綜合教學館';


-- booking 463
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共304' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    50,
    '活動預約',
    '2025-03-01',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-01 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共304' AND b.name='共同教學館';


-- booking 464
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新505' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    121,
    '活動預約',
    '2025-03-10',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-10 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新505' AND b.name='新生教學館';


-- booking 465
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普202' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    34,
    '活動預約',
    '2025-03-07',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-07 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普202' AND b.name='普通教學館';


-- booking 466
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅308' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    168,
    '活動預約',
    '2025-03-02',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-02 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅308' AND b.name='博雅教學館';


-- booking 467
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新103' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    25,
    '活動預約',
    '2025-03-06',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-06 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新103' AND b.name='新生教學館';


-- booking 468
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜403' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    121,
    '活動預約',
    '2025-03-22',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-22 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜403' AND b.name='綜合教學館';


-- booking 469
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普306' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    193,
    '活動預約',
    '2025-03-09',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普306' AND b.name='普通教學館';


-- booking 470
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅302' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    41,
    '活動預約',
    '2025-03-29',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-29 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅302' AND b.name='博雅教學館';


-- booking 471
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新302' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    84,
    '活動預約',
    '2025-03-08',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-08 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新302' AND b.name='新生教學館';


-- booking 472
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普503' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    33,
    '活動預約',
    '2025-03-11',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-11 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普503' AND b.name='普通教學館';


-- booking 473
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅301' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    47,
    '活動預約',
    '2025-03-26',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-26 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅301' AND b.name='博雅教學館';


-- booking 474
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共104' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    35,
    '活動預約',
    '2025-03-06',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-06 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共104' AND b.name='共同教學館';


-- booking 475
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新304' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    72,
    '活動預約',
    '2025-03-21',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-21 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新304' AND b.name='新生教學館';


-- booking 476
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新204' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    52,
    '活動預約',
    '2025-03-07',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-07 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新204' AND b.name='新生教學館';


-- booking 477
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共308' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    153,
    '活動預約',
    '2025-03-08',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-08 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共308' AND b.name='共同教學館';


-- booking 478
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普504' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    24,
    '活動預約',
    '2025-03-30',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普504' AND b.name='普通教學館';


-- booking 479
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共101' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    60,
    '活動預約',
    '2025-03-08',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-08 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共101' AND b.name='共同教學館';


-- booking 480
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅202' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    25,
    '活動預約',
    '2025-03-31',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-31 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅202' AND b.name='博雅教學館';


-- booking 481
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜202' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    104,
    '活動預約',
    '2025-03-25',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-25 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜202' AND b.name='綜合教學館';


-- booking 483
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅311' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    63,
    '活動預約',
    '2025-03-26',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-26 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅311' AND b.name='博雅教學館';


-- booking 484
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普502' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    185,
    '活動預約',
    '2025-03-30',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普502' AND b.name='普通教學館';


-- booking 485
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='一樓中央大廳 展覽牆柱區' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    197,
    '活動預約',
    '2025-03-21',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-21 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='一樓中央大廳 展覽牆柱區' AND b.name='博雅教學館';


-- booking 486
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新203' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    27,
    '活動預約',
    '2025-03-02',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-02 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新203' AND b.name='新生教學館';


-- booking 487
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普405' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    86,
    '活動預約',
    '2025-03-16',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普405' AND b.name='普通教學館';


-- booking 488
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共407' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    131,
    '活動預約',
    '2025-03-28',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-28 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共407' AND b.name='共同教學館';


-- booking 489
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普202' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    26,
    '活動預約',
    '2025-03-23',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-23 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普202' AND b.name='普通教學館';


-- booking 490
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜403' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    123,
    '活動預約',
    '2025-03-29',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-29 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜403' AND b.name='綜合教學館';


-- booking 491
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅312' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    55,
    '活動預約',
    '2025-03-04',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-04 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅312' AND b.name='博雅教學館';


-- booking 492
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜604' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    107,
    '活動預約',
    '2025-03-12',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-12 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜604' AND b.name='綜合教學館';


-- booking 493
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共307' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    167,
    '活動預約',
    '2025-03-11',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-11 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共307' AND b.name='共同教學館';


-- booking 494
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普402' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    16,
    '活動預約',
    '2025-03-15',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-15 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普402' AND b.name='普通教學館';


-- booking 495
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新202' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    43,
    '活動預約',
    '2025-03-16',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-16 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新202' AND b.name='新生教學館';


-- booking 496
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='新501' AND b.name='新生教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    139,
    '活動預約',
    '2025-03-04',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-04 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='新501' AND b.name='新生教學館';


-- booking 497
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='博雅301' AND b.name='博雅教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    198,
    '活動預約',
    '2025-03-19',
    '13:00',
    '17:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='13:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-19 13:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='博雅301' AND b.name='博雅教學館';


-- booking 498
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='共101' AND b.name='共同教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    119,
    '活動預約',
    '2025-03-09',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-09 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='共101' AND b.name='共同教學館';


-- booking 499
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='綜602' AND b.name='綜合教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    177,
    '活動預約',
    '2025-03-30',
    '18:00',
    '22:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='18:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-30 18:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='綜602' AND b.name='綜合教學館';


-- booking 500
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='普403' AND b.name='普通教學館'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    145,
    '活動預約',
    '2025-03-04',
    '08:00',
    '12:00',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='08:00'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '2025-03-04 08:00'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='普403' AND b.name='普通教學館';

