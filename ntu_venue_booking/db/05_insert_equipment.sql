-- 05_insert_equipment.sql
-- 從 ntu_rooms_all_buildings.csv 自動產生設備 master

INSERT INTO equipment (name, category, need_staff_bool, unit, status) VALUES
    ('冷氣空調', '器材', FALSE, 'PerUse', 'On'),
    ('投影機', '器材', FALSE, 'PerUse', 'On'),
    ('推播系統', '器材', FALSE, 'PerUse', 'On'),
    ('電視牆', '器材', FALSE, 'PerUse', 'On');
