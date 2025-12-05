-- 09_insert_price_rule.sql


INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共101' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共101' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 6250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共101' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 6250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共101' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共102' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共102' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共102' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共102' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共103' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共103' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共103' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共103' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共104' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共104' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共104' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共104' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共105' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共105' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共105' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共105' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共201' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共201' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 6250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共201' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 6250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共201' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共202' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共202' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共202' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共202' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共203' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共203' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共203' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共203' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共204' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共204' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共204' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共204' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共205' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共205' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共205' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共205' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共206' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共206' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共206' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共206' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共207' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共207' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共207' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共207' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共208' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共208' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共208' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共208' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共301' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共301' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共301' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共301' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共302' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共302' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共302' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共302' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共303' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共303' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共303' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共303' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共304' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共304' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共304' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共304' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共305' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共305' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共305' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共305' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共306' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共306' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共306' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共306' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共307' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共307' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共307' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共307' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共308' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共308' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共308' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共308' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共401' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共401' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共401' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共401' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共402' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共402' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共402' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共402' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共403' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共403' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共403' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共403' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共404' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共404' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共404' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共404' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共405' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共405' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共405' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共405' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共406' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共406' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共406' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共406' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共407' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共407' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共407' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='共407' AND b.name='共同教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 5000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅101/華南講堂' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 5000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅101/華南講堂' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 10000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅101/華南講堂' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 10000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅101/華南講堂' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅102' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅102' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 7500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅102' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 7500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅102' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅103' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅103' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 7500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅103' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 7500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅103' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅201' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅201' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅201' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅201' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅202' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅202' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 6250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅202' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 6250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅202' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅203' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅203' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅203' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅203' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅204' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅204' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅204' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅204' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅205' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅205' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅205' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅205' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅206' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅206' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅206' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅206' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅301' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅301' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅301' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅301' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅302' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅302' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅302' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅302' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅303' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅303' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅303' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅303' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅304' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅304' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅304' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅304' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅305' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅305' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅305' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅305' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅306' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅306' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅306' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅306' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅307' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅307' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅307' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅307' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅308' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅308' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅308' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅308' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅309' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅309' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅309' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅309' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅310' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅310' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅310' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅310' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅311' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅311' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅311' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅311' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅312' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅312' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅312' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='博雅312' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 7500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='一樓中央大廳 展覽牆柱區' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 7500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='一樓中央大廳 展覽牆柱區' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 7500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='一樓中央大廳 展覽牆柱區' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 7500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='一樓中央大廳 展覽牆柱區' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='一樓西側大廳 桌椅區 (101 教室旁)' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='一樓西側大廳 桌椅區 (101 教室旁)' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 3750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='一樓西側大廳 桌椅區 (101 教室旁)' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 3750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='一樓西側大廳 桌椅區 (101 教室旁)' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='一樓西側大廳 圖書攤位區 (入口處)' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='一樓西側大廳 圖書攤位區 (入口處)' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 3750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='一樓西側大廳 圖書攤位區 (入口處)' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 3750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='一樓西側大廳 圖書攤位區 (入口處)' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 7500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='中央大廳圓桌區' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 7500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='中央大廳圓桌區' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 7500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='中央大廳圓桌區' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 7500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='中央大廳圓桌區' AND b.name='博雅教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普101' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普101' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 6250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普101' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 6250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普101' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普102' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普102' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普102' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普102' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普103' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普103' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 6250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普103' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 6250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普103' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普201' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普201' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普201' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普201' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普202' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普202' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普202' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普202' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普203' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普203' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普203' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普203' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普204' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普204' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普204' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普204' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普205' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普205' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普205' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普205' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普301' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普301' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普301' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普301' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普302' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普302' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普302' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普302' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普303' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普303' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普303' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普303' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普304' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普304' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普304' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普304' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普305' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普305' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普305' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普305' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普306' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普306' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普306' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普306' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普401' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普401' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普401' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普401' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普402' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普402' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普402' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普402' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普403' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普403' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普403' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普403' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普404' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普404' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普404' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普404' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普405' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普405' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普405' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普405' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普406' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普406' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普406' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普406' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普501' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普501' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普501' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普501' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普502' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普502' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普502' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普502' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普503' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普503' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普503' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普503' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普504' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普504' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普504' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普504' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普505' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普505' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普505' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='普505' AND b.name='普通教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新102' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新102' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 6250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新102' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 6250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新102' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新103' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新103' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新103' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新103' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新201' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新201' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新201' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新201' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新202' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新202' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新202' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新202' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新203' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新203' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新203' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新203' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新204' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新204' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新204' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新204' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新301' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新301' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新301' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新301' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新302' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新302' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新302' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新302' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新303' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新303' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新303' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新303' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新304' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新304' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新304' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新304' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新401' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新401' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新401' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新401' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新402' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新402' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新402' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新402' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新403' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新403' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新403' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新403' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新404' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新404' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新404' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新404' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新405' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新405' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新405' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新405' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新501' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新501' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新501' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新501' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新502' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新502' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新502' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新502' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新503' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新503' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新503' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新503' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新504' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新504' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新504' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新504' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新505' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 3000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新505' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新505' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='新505' AND b.name='新生教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜1F 樓學習開放空間' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜1F 樓學習開放空間' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜1F 樓學習開放空間' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜1F 樓學習開放空間' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 50000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜合大講堂' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 50000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜合大講堂' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 100000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜合大講堂' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 100000
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜合大講堂' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜2F 樓學習開放空間' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜2F 樓學習開放空間' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜2F 樓學習開放空間' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜2F 樓學習開放空間' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜201' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜201' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜201' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜201' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜202' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜202' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜202' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜202' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜203' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜203' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜203' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜203' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜301' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜301' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜301' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜301' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜302' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜302' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜302' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜302' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜401' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜401' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜401' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜401' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜402' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜402' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜402' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜402' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜403' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜403' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜403' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜403' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜404' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜404' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜404' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜404' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜501' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜501' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜501' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜501' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜502' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜502' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜502' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜502' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜503' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜503' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜503' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜503' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜504' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜504' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜504' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜504' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜505' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜505' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜505' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜505' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜601' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜601' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜601' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜601' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜602' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜602' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜602' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜602' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜603' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜603' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜603' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜603' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜604' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜604' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜604' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 5250
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜604' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜605' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜605' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜605' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜605' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜606' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜606' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜606' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜606' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '12:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜607' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '13:00', '17:00', 2500
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜607' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '08:00', '17:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜607' AND b.name='綜合教學館';

INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '18:00', '22:00', 4750
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='綜607' AND b.name='綜合教學館';
