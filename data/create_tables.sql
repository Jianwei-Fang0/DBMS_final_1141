-- ============================================
-- 資料表建立腳本
-- 根據資料字典 2.4 生成
-- ============================================

-- ============================================
-- 2.4.1 USER（使用者主資料表）
-- ============================================
CREATE TABLE "USER" (
    user_id BIGINT NOT NULL,
    email VARCHAR(120) NOT NULL,
    password_hash VARCHAR(256) NOT NULL,
    name VARCHAR(80) NOT NULL,
    phone VARCHAR(32),
    CONSTRAINT pk_user PRIMARY KEY (user_id),
    CONSTRAINT uk_user_email UNIQUE (email)
);

-- ============================================
-- 2.4.3 ORG（組織/單位）
-- ============================================
CREATE TABLE ORG (
    org_id BIGINT NOT NULL,
    name VARCHAR(120) NOT NULL,
    type VARCHAR(16) NOT NULL,
    contact_email VARCHAR(120),
    status VARCHAR(12) NOT NULL DEFAULT 'Active',
    CONSTRAINT pk_org PRIMARY KEY (org_id),
    CONSTRAINT ck_org_type CHECK (type IN ('Dept', 'Admin', 'Club', 'External')),
    CONSTRAINT ck_org_status CHECK (status IN ('Active', 'Inactive'))
);

-- ============================================
-- 2.4.4 ORG_MEMBER（組織成員關聯）
-- ============================================
CREATE TABLE ORG_MEMBER (
    org_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    title VARCHAR(80),
    verified_bool BOOLEAN NOT NULL DEFAULT false,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    CONSTRAINT pk_org_member PRIMARY KEY (org_id, user_id),
    CONSTRAINT fk_org_member_org FOREIGN KEY (org_id) 
        REFERENCES ORG(org_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_org_member_user FOREIGN KEY (user_id) 
        REFERENCES "USER"(user_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================
-- 2.4.2 BUILDING（建築）
-- ============================================
CREATE TABLE BUILDING (
    building_id BIGINT NOT NULL,
    name VARCHAR(120) NOT NULL,
    code VARCHAR(16) NOT NULL,
    address VARCHAR(200),
    CONSTRAINT pk_building PRIMARY KEY (building_id),
    CONSTRAINT uk_building_code UNIQUE (code)
);

-- ============================================
-- 2.4.6 VENUE（場地）
-- ============================================
CREATE TABLE VENUE (
    venue_id BIGINT NOT NULL,
    building_id BIGINT NOT NULL,
    name VARCHAR(80) NOT NULL,
    type VARCHAR(16) NOT NULL,
    capacity INT NOT NULL DEFAULT 0,
    open_status VARCHAR(4) NOT NULL DEFAULT 'On',
    notes TEXT,
    CONSTRAINT pk_venue PRIMARY KEY (venue_id),
    CONSTRAINT fk_venue_building FOREIGN KEY (building_id) 
        REFERENCES BUILDING(building_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT ck_venue_type CHECK (type IN ('Classroom', 'Auditorium', 'Meeting', 'Outdoor', 'Sport')),
    CONSTRAINT ck_venue_capacity CHECK (capacity >= 0),
    CONSTRAINT ck_venue_open_status CHECK (open_status IN ('On', 'Off'))
);

-- ============================================
-- 2.4.7 EQUIPMENT（設備/人力項目）
-- ============================================
CREATE TABLE EQUIPMENT (
    equip_id BIGINT NOT NULL,
    name VARCHAR(80) NOT NULL,
    category VARCHAR(40) NOT NULL,
    need_staff_bool BOOLEAN NOT NULL DEFAULT false,
    unit VARCHAR(8) NOT NULL DEFAULT 'PerHour',
    status VARCHAR(4) NOT NULL DEFAULT 'On',
    CONSTRAINT pk_equipment PRIMARY KEY (equip_id),
    CONSTRAINT ck_equipment_unit CHECK (unit IN ('PerHour', 'PerUse')),
    CONSTRAINT ck_equipment_status CHECK (status IN ('On', 'Off'))
);

-- ============================================
-- 2.4.8 VENUE_EQUIP（場地可用設備對應與庫存）
-- ============================================
CREATE TABLE VENUE_EQUIP (
    venue_id BIGINT NOT NULL,
    equip_id BIGINT NOT NULL,
    stock_qty INT NOT NULL DEFAULT 0,
    default_on_bool BOOLEAN NOT NULL DEFAULT false,
    CONSTRAINT pk_venue_equip PRIMARY KEY (venue_id, equip_id),
    CONSTRAINT fk_venue_equip_venue FOREIGN KEY (venue_id) 
        REFERENCES VENUE(venue_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_venue_equip_equipment FOREIGN KEY (equip_id) 
        REFERENCES EQUIPMENT(equip_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT ck_venue_equip_stock_qty CHECK (stock_qty >= 0)
);

-- ============================================
-- 2.4.9 TIMESLOT_RULE（可租時段規則）
-- ============================================
CREATE TABLE TIMESLOT_RULE (
    rule_id BIGINT NOT NULL,
    venue_id BIGINT NOT NULL,
    weekday SMALLINT NOT NULL,
    open_time TIME NOT NULL,
    close_time TIME NOT NULL,
    slot_minute INT NOT NULL DEFAULT 30,
    CONSTRAINT pk_timeslot_rule PRIMARY KEY (rule_id),
    CONSTRAINT fk_timeslot_rule_venue FOREIGN KEY (venue_id) 
        REFERENCES VENUE(venue_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ck_timeslot_rule_weekday CHECK (weekday >= 0 AND weekday <= 6),
    CONSTRAINT ck_timeslot_rule_slot_minute CHECK (slot_minute > 0)
);

-- ============================================
-- 2.4.10 BLOCKED_SLOT（阻擋租借/保留）
-- ============================================
CREATE TABLE BLOCKED_SLOT (
    block_id BIGINT NOT NULL,
    venue_id BIGINT NOT NULL,
    date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    reason VARCHAR(120),
    CONSTRAINT pk_blocked_slot PRIMARY KEY (block_id),
    CONSTRAINT fk_blocked_slot_venue FOREIGN KEY (venue_id) 
        REFERENCES VENUE(venue_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================
-- 2.4.11 RATE_PLAN（場地費率方案）
-- ============================================
CREATE TABLE RATE_PLAN (
    plan_id BIGINT NOT NULL,
    venue_id BIGINT NOT NULL,
    name VARCHAR(80) NOT NULL,
    status VARCHAR(4) NOT NULL DEFAULT 'On',
    CONSTRAINT pk_rate_plan PRIMARY KEY (plan_id),
    CONSTRAINT fk_rate_plan_venue FOREIGN KEY (venue_id) 
        REFERENCES VENUE(venue_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT ck_rate_plan_status CHECK (status IN ('On', 'Off'))
);

-- ============================================
-- 2.4.12 RATE_VERSION（費率版本）
-- ============================================
CREATE TABLE RATE_VERSION (
    version_id BIGINT NOT NULL,
    plan_id BIGINT NOT NULL,
    effective_from DATE NOT NULL,
    effective_to DATE,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    CONSTRAINT pk_rate_version PRIMARY KEY (version_id),
    CONSTRAINT fk_rate_version_plan FOREIGN KEY (plan_id) 
        REFERENCES RATE_PLAN(plan_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- ============================================
-- 2.4.13 PRICE_RULE（場地計價規則）
-- ============================================
CREATE TABLE PRICE_RULE (
    price_id BIGINT NOT NULL,
    version_id BIGINT NOT NULL,
    affiliation VARCHAR(12) NOT NULL,
    day_type VARCHAR(10) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    base_fee_per_hour NUMERIC(10,2) NOT NULL DEFAULT 0.00,
    min_hours INT NOT NULL DEFAULT 1,
    step_minute INT NOT NULL DEFAULT 30,
    peak_surcharge_pct NUMERIC(5,2),
    deposit_required_bool BOOLEAN NOT NULL DEFAULT false,
    deposit_amount NUMERIC(10,2),
    CONSTRAINT pk_price_rule PRIMARY KEY (price_id),
    CONSTRAINT fk_price_rule_version FOREIGN KEY (version_id) 
        REFERENCES RATE_VERSION(version_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ck_price_rule_affiliation CHECK (affiliation IN ('Internal', 'External', 'Alumni')),
    CONSTRAINT ck_price_rule_day_type CHECK (day_type IN ('Weekday', 'Weekend', 'Holiday')),
    CONSTRAINT ck_price_rule_base_fee CHECK (base_fee_per_hour >= 0.00),
    CONSTRAINT ck_price_rule_min_hours CHECK (min_hours >= 1),
    CONSTRAINT ck_price_rule_step_minute CHECK (step_minute > 0)
);

-- ============================================
-- 2.4.14 EQUIP_PRICE_RULE（設備加價規則）
-- ============================================
CREATE TABLE EQUIP_PRICE_RULE (
    eprice_id BIGINT NOT NULL,
    version_id BIGINT NOT NULL,
    equip_id BIGINT NOT NULL,
    affiliation VARCHAR(12) NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL DEFAULT 0.00,
    unit VARCHAR(8) NOT NULL DEFAULT 'PerHour',
    CONSTRAINT pk_equip_price_rule PRIMARY KEY (eprice_id),
    CONSTRAINT fk_equip_price_rule_version FOREIGN KEY (version_id) 
        REFERENCES RATE_VERSION(version_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_equip_price_rule_equipment FOREIGN KEY (equip_id) 
        REFERENCES EQUIPMENT(equip_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT ck_equip_price_rule_affiliation CHECK (affiliation IN ('Internal', 'External', 'Alumni')),
    CONSTRAINT ck_equip_price_rule_unit CHECK (unit IN ('PerHour', 'PerUse')),
    CONSTRAINT ck_equip_price_rule_unit_price CHECK (unit_price >= 0.00)
);

-- ============================================
-- 2.4.15 BOOKING（訂單主資料表）
-- ============================================
CREATE TABLE BOOKING (
    booking_id BIGINT NOT NULL,
    venue_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    org_id BIGINT,
    purpose VARCHAR(200) NOT NULL,
    date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    people INT,
    version_id BIGINT NOT NULL,
    affiliation_cached VARCHAR(12) NOT NULL,
    amount_est NUMERIC(10,2) NOT NULL DEFAULT 0.00,
    deposit NUMERIC(10,2),
    status VARCHAR(12) NOT NULL DEFAULT 'Draft',
    hold_until TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    CONSTRAINT pk_booking PRIMARY KEY (booking_id),
    CONSTRAINT fk_booking_venue FOREIGN KEY (venue_id) 
        REFERENCES VENUE(venue_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id) 
        REFERENCES "USER"(user_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_booking_org FOREIGN KEY (org_id) 
        REFERENCES ORG(org_id) 
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_booking_version FOREIGN KEY (version_id) 
        REFERENCES RATE_VERSION(version_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT ck_booking_people CHECK (people IS NULL OR people > 0),
    CONSTRAINT ck_booking_affiliation_cached CHECK (affiliation_cached IN ('Internal', 'External', 'Alumni')),
    CONSTRAINT ck_booking_status CHECK (status IN ('Draft', 'Pending', 'Approved', 'Rejected', 'Cancelled', 'Completed')),
    CONSTRAINT ck_booking_amount_est CHECK (amount_est >= 0.00)
);

-- ============================================
-- 2.4.16 BOOKING_SLOT（訂單對應時段切段）
-- ============================================
CREATE TABLE BOOKING_SLOT (
    booking_id BIGINT NOT NULL,
    venue_id BIGINT NOT NULL,
    slot_start TIMESTAMP NOT NULL,
    CONSTRAINT pk_booking_slot PRIMARY KEY (booking_id, venue_id, slot_start),
    CONSTRAINT fk_booking_slot_booking FOREIGN KEY (booking_id) 
        REFERENCES BOOKING(booking_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_booking_slot_venue FOREIGN KEY (venue_id) 
        REFERENCES VENUE(venue_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT uk_booking_slot_venue_slot UNIQUE (venue_id, slot_start)
);

-- ============================================
-- 2.4.17 BOOKING_EQUIP（訂單設備需求）
-- ============================================
CREATE TABLE BOOKING_EQUIP (
    booking_id BIGINT NOT NULL,
    equip_id BIGINT NOT NULL,
    qty INT NOT NULL DEFAULT 1,
    CONSTRAINT pk_booking_equip PRIMARY KEY (booking_id, equip_id),
    CONSTRAINT fk_booking_equip_booking FOREIGN KEY (booking_id) 
        REFERENCES BOOKING(booking_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_booking_equip_equipment FOREIGN KEY (equip_id) 
        REFERENCES EQUIPMENT(equip_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT ck_booking_equip_qty CHECK (qty >= 1)
);

-- ============================================
-- 2.4.18 APPROVAL（審核紀錄）
-- ============================================
CREATE TABLE APPROVAL (
    approval_id BIGINT NOT NULL,
    booking_id BIGINT NOT NULL,
    approver_id BIGINT NOT NULL,
    step INT NOT NULL DEFAULT 1,
    decision VARCHAR(12) NOT NULL DEFAULT 'Pending',
    comment TEXT,
    decided_at TIMESTAMP,
    CONSTRAINT pk_approval PRIMARY KEY (approval_id),
    CONSTRAINT fk_approval_booking FOREIGN KEY (booking_id) 
        REFERENCES BOOKING(booking_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_approval_approver FOREIGN KEY (approver_id) 
        REFERENCES "USER"(user_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT ck_approval_step CHECK (step >= 1),
    CONSTRAINT ck_approval_decision CHECK (decision IN ('Pending', 'Approved', 'Rejected'))
);

-- ============================================
-- 2.4.19 PAYMENT（付款紀錄）
-- ============================================
CREATE TABLE PAYMENT (
    payment_id BIGINT NOT NULL,
    booking_id BIGINT NOT NULL,
    method VARCHAR(12) NOT NULL,
    amount NUMERIC(10,2) NOT NULL DEFAULT 0.00,
    type VARCHAR(12) NOT NULL,
    status VARCHAR(12) NOT NULL DEFAULT 'Pending',
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    CONSTRAINT pk_payment PRIMARY KEY (payment_id),
    CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id) 
        REFERENCES BOOKING(booking_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ck_payment_method CHECK (method IN ('Card', 'Transfer', 'Cash')),
    CONSTRAINT ck_payment_type CHECK (type IN ('Deposit', 'Rent', 'Adjustment')),
    CONSTRAINT ck_payment_status CHECK (status IN ('Pending', 'Succeeded', 'Failed', 'Refunded')),
    CONSTRAINT ck_payment_amount CHECK (amount != 0.00)
);

-- ============================================
-- 2.4.20 REFUND（退款紀錄）
-- ============================================
CREATE TABLE REFUND (
    refund_id BIGINT NOT NULL,
    payment_id BIGINT NOT NULL,
    amount NUMERIC(10,2) NOT NULL DEFAULT 0.00,
    reason VARCHAR(120),
    status VARCHAR(12) NOT NULL DEFAULT 'Pending',
    created_at TIMESTAMP NOT NULL DEFAULT now(),
    CONSTRAINT pk_refund PRIMARY KEY (refund_id),
    CONSTRAINT fk_refund_payment FOREIGN KEY (payment_id) 
        REFERENCES PAYMENT(payment_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ck_refund_status CHECK (status IN ('Pending', 'Succeeded', 'Failed')),
    CONSTRAINT ck_refund_amount CHECK (amount > 0.00)
);

-- ============================================
-- 2.4.21 HOLIDAY（行事曆/日型）
-- ============================================
CREATE TABLE HOLIDAY (
    date DATE NOT NULL,
    name VARCHAR(80),
    day_type VARCHAR(10) NOT NULL,
    CONSTRAINT pk_holiday PRIMARY KEY (date),
    CONSTRAINT ck_holiday_day_type CHECK (day_type IN ('Weekday', 'Weekend', 'Holiday'))
);

-- ============================================
-- 建立索引（提升查詢效能）
-- ============================================

-- USER 表索引
CREATE INDEX idx_user_email ON "USER"(email);

-- VENUE 表索引
CREATE INDEX idx_venue_building ON VENUE(building_id);
CREATE INDEX idx_venue_type ON VENUE(type);
CREATE INDEX idx_venue_status ON VENUE(open_status);

-- ORG 表索引
CREATE INDEX idx_org_type ON ORG(type);
CREATE INDEX idx_org_status ON ORG(status);

-- ORG_MEMBER 表索引
CREATE INDEX idx_org_member_user ON ORG_MEMBER(user_id);
CREATE INDEX idx_org_member_org ON ORG_MEMBER(org_id);

-- BOOKING 表索引
CREATE INDEX idx_booking_user ON BOOKING(user_id);
CREATE INDEX idx_booking_venue ON BOOKING(venue_id);
CREATE INDEX idx_booking_date ON BOOKING(date);
CREATE INDEX idx_booking_status ON BOOKING(status);
CREATE INDEX idx_booking_created_at ON BOOKING(created_at);

-- BOOKING_SLOT 表索引
CREATE INDEX idx_booking_slot_venue_date ON BOOKING_SLOT(venue_id, slot_start);

-- APPROVAL 表索引
CREATE INDEX idx_approval_booking ON APPROVAL(booking_id);
CREATE INDEX idx_approval_approver ON APPROVAL(approver_id);
CREATE INDEX idx_approval_status ON APPROVAL(decision);

-- PAYMENT 表索引
CREATE INDEX idx_payment_booking ON PAYMENT(booking_id);
CREATE INDEX idx_payment_status ON PAYMENT(status);

-- TIMESLOT_RULE 表索引
CREATE INDEX idx_timeslot_rule_venue ON TIMESLOT_RULE(venue_id);

-- BLOCKED_SLOT 表索引
CREATE INDEX idx_blocked_slot_venue_date ON BLOCKED_SLOT(venue_id, date);

-- RATE_VERSION 表索引
CREATE INDEX idx_rate_version_plan ON RATE_VERSION(plan_id);
CREATE INDEX idx_rate_version_dates ON RATE_VERSION(effective_from, effective_to);

-- PRICE_RULE 表索引
CREATE INDEX idx_price_rule_version ON PRICE_RULE(version_id);

-- EQUIP_PRICE_RULE 表索引
CREATE INDEX idx_equip_price_rule_version ON EQUIP_PRICE_RULE(version_id);
CREATE INDEX idx_equip_price_rule_equip ON EQUIP_PRICE_RULE(equip_id);

-- ============================================
-- 備註：ORG 表
-- ============================================
-- 注意：資料字典中 BOOKING 表有 org_id 欄位，但未提供 ORG 表的詳細結構
-- 如果需要 ORG 表，請根據實際需求建立
-- 範例：
-- CREATE TABLE ORG (
--     org_id BIGINT NOT NULL,
--     name VARCHAR(120) NOT NULL,
--     type VARCHAR(20),
--     CONSTRAINT pk_org PRIMARY KEY (org_id)
-- );
-- 
-- 然後在 BOOKING 表中加入：
-- CONSTRAINT fk_booking_org FOREIGN KEY (org_id) 
--     REFERENCES ORG(org_id) 
--     ON DELETE SET NULL ON UPDATE CASCADE

