-- 02_insert_buildings.sql
-- 台大主要場館 Building 真實資料（修正版）

INSERT INTO building (name, code, address) VALUES
    -- 1. 新生教學館（給 03 裡 building_id = 1 用）
    ('新生教學館', 'XSH', '台北市大安區羅斯福路四段1號'),

    -- 2. 綜合教學館（building_id = 2）
    ('綜合教學館', 'ZJG', '台北市大安區羅斯福路四段1號'),

    -- 3. 共同教學館（GTLB，building_id = 3）
    ('共同教學館', 'GTLB', '台北市大安區羅斯福路四段1號'),

    -- 4. 博雅教學館（BYH，building_id = 4）
    ('博雅教學館', 'BYH', '台北市大安區羅斯福路四段1號'),

    -- 5. 普通教學館（PTLB，building_id = 5）
    ('普通教學館', 'PTLB', '台北市大安區羅斯福路四段1號'),

    -- 6. 第一學生活動中心（SAC1，building_id = 6）
    ('第一學生活動中心', 'SAC1', '台北市大安區羅斯福路四段1號'),

    -- 7. 第二學生活動中心（SAC2，building_id = 7）
    ('第二學生活動中心', 'SAC2', '台北市大安區羅斯福路四段1號');
