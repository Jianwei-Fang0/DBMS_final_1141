-- 06_insert_venue_equip.sql
-- 從 ntu_rooms_all_buildings.csv 自動產生場地設備對應


INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共101';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共101';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共101';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共102';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共102';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共102';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共103';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共103';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共103';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共104';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共104';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共104';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共105';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共105';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共105';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共201';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共201';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共201';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共202';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共202';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共202';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共203';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共203';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共203';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共204';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共204';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共204';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共205';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共205';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共205';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共206';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共206';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共206';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共207';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共207';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共207';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共208';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共208';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共208';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共301';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共301';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共301';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共302';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共302';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共302';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共303';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共303';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共303';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共304';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共304';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共304';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共305';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共305';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共305';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共306';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共306';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共306';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共307';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共307';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共307';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共308';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共308';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共308';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共401';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共401';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共401';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共402';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共402';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共402';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共403';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共403';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共403';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共404';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共404';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共404';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共405';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共405';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共405';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共406';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共406';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共406';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '共同教學館' AND v.name = '共407';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '共同教學館' AND v.name = '共407';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '共同教學館' AND v.name = '共407';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 3, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅101/華南講堂';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅101/華南講堂';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅101/華南講堂';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅102';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅102';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅102';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅103';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅103';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅103';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅201';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅201';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅201';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅202';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅202';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅202';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅203';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅203';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅203';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅204';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅204';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅204';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅205';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅205';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅205';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅206';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅206';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅206';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅301';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅301';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅301';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅302';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅302';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅302';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅303';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅303';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅303';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅304';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅304';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅304';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅305';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅305';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅305';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅306';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅306';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅306';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅307';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅307';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅307';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅308';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅308';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅308';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅309';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅309';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅309';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅310';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅310';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅310';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅311';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅311';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅311';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '博雅教學館' AND v.name = '博雅312';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '博雅教學館' AND v.name = '博雅312';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '博雅教學館' AND v.name = '博雅312';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普101';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普101';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普101';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普102';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普102';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普102';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普103';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普103';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普103';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普201';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普201';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普201';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普202';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普202';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普202';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普203';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普203';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普203';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普204';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普204';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普204';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普205';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普205';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普205';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普301';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普301';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普301';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普302';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普302';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普302';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普303';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普303';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普303';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普304';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普304';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普304';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普305';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普305';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普305';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普306';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普306';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普306';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普401';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普401';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普401';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普402';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普402';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普402';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普403';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普403';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普403';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普404';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普404';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普404';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普405';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普405';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普405';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普406';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普406';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普406';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普501';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普501';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普501';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普502';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普502';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普502';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普503';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普503';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普503';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普504';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普504';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普504';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '普通教學館' AND v.name = '普505';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '普通教學館' AND v.name = '普505';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '普通教學館' AND v.name = '普505';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新102';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新102';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新102';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新103';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新103';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新103';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新201';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新201';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新201';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新202';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新202';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新202';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新203';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新203';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新203';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新204';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新204';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新204';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新301';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新301';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新301';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新302';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新302';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新302';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新303';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新303';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新303';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新304';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新304';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新304';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新401';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新401';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新401';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新402';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新402';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新402';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新403';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新403';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新403';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新404';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新404';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新404';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新405';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新405';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新405';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新501';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新501';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新501';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新502';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新502';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新502';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新503';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新503';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新503';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新504';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新504';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新504';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '新生教學館' AND v.name = '新505';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '推播系統'
WHERE b.name = '新生教學館' AND v.name = '新505';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '新生教學館' AND v.name = '新505';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜1F 樓學習開放空間';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜合大講堂';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜合大講堂';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜合大講堂';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜2F 樓學習開放空間';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜201';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜201';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜201';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜202';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜202';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜202';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜203';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜203';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜203';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜301';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜301';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜301';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜302';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜302';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜302';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜401';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜401';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 2, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜401';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜402';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜402';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜402';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜403';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜403';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜403';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜404';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜404';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜404';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜501';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜501';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜501';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜502';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜502';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜502';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜503';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜503';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜503';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜504';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜504';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜504';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜505';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜505';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜505';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜601';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜601';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜601';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜602';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜602';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜602';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜603';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜603';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜603';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜604';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜604';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜604';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜605';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜605';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜605';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜606';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜606';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜606';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '投影機'
WHERE b.name = '綜合教學館' AND v.name = '綜607';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '電視牆'
WHERE b.name = '綜合教學館' AND v.name = '綜607';

INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, 1, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '冷氣空調'
WHERE b.name = '綜合教學館' AND v.name = '綜607';
