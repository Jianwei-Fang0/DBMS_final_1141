-- ==========================================
-- NTU Venue Booking System - create_tables.sql
-- PostgreSQL DDL
-- ==========================================

-- 建議：第一次開發時方便重建，可先 DROP（之後穩定了可移除）
DROP TABLE IF EXISTS refund        CASCADE;
DROP TABLE IF EXISTS payment       CASCADE;
DROP TABLE IF EXISTS approval      CASCADE;
DROP TABLE IF EXISTS booking_equip CASCADE;
DROP TABLE IF EXISTS booking_slot  CASCADE;
DROP TABLE IF EXISTS booking       CASCADE;
DROP TABLE IF EXISTS equip_price_rule CASCADE;
DROP TABLE IF EXISTS price_rule    CASCADE;
DROP TABLE IF EXISTS rate_version  CASCADE;
DROP TABLE IF EXISTS rate_plan     CASCADE;
DROP TABLE IF EXISTS blocked_slot  CASCADE;
DROP TABLE IF EXISTS timeslot_rule CASCADE;
DROP TABLE IF EXISTS venue_equip   CASCADE;
DROP TABLE IF EXISTS equipment     CASCADE;
DROP TABLE IF EXISTS venue         CASCADE;
DROP TABLE IF EXISTS building      CASCADE;
DROP TABLE IF EXISTS org_member    CASCADE;
DROP TABLE IF EXISTS user_role     CASCADE;
DROP TABLE IF EXISTS "user"        CASCADE;
DROP TABLE IF EXISTS org           CASCADE;
DROP TABLE IF EXISTS holiday       CASCADE;

-- ==========================================
-- ORG（組織 / 單位）
-- ==========================================
CREATE TABLE org (
    org_id        BIGSERIAL PRIMARY KEY,
    name          VARCHAR(120) NOT NULL,
    type          VARCHAR(16)  NOT NULL CHECK (type IN ('Dept','Admin','Club','External')),
    contact_email VARCHAR(120),
    status        VARCHAR(12)  NOT NULL DEFAULT 'Active'
                  CHECK (status IN ('Active','Inactive'))
);

-- ==========================================
-- USER（使用者主資料夾）
-- ==========================================
CREATE TABLE "user" (
    user_id        BIGSERIAL PRIMARY KEY,
    email          VARCHAR(120) NOT NULL UNIQUE,
    password_hash  VARCHAR(256) NOT NULL,
    name           VARCHAR(80)  NOT NULL,
    phone          VARCHAR(32),
    affiliation    VARCHAR(12)  NOT NULL DEFAULT 'Internal'
                   CHECK (affiliation IN ('Internal','External','Alumni')),
    org_id         BIGINT REFERENCES org(org_id)
                   ON DELETE SET NULL
                   ON UPDATE CASCADE,
    status         VARCHAR(12)  NOT NULL DEFAULT 'Active'
                   CHECK (status IN ('Active','Frozen')),
    created_at     TIMESTAMP    NOT NULL DEFAULT now()
);

-- ==========================================
-- USER_ROLE（使用者角色 RBAC）
-- ==========================================
CREATE TABLE user_role (
    user_id BIGINT NOT NULL REFERENCES "user"(user_id)
                    ON DELETE CASCADE
                    ON UPDATE CASCADE,
    role    VARCHAR(16) NOT NULL
            CHECK (role IN ('Applicant','VenueManager','Finance','SysAdmin')),
    PRIMARY KEY (user_id, role)
);

-- ==========================================
-- ORG_MEMBER（組織成員關聯）
-- ==========================================
CREATE TABLE org_member (
    org_id      BIGINT NOT NULL REFERENCES org(org_id)
                          ON DELETE CASCADE
                          ON UPDATE CASCADE,
    user_id     BIGINT NOT NULL REFERENCES "user"(user_id)
                          ON DELETE CASCADE
                          ON UPDATE CASCADE,
    title       VARCHAR(80),
    verified_bool BOOLEAN NOT NULL DEFAULT FALSE,
    created_at  TIMESTAMP NOT NULL DEFAULT now(),
    PRIMARY KEY (org_id, user_id)
);

-- ==========================================
-- BUILDING（建築 / 系館）
-- ==========================================
CREATE TABLE building (
    building_id BIGSERIAL PRIMARY KEY,
    name        VARCHAR(120) NOT NULL,
    code        VARCHAR(16)  NOT NULL UNIQUE,   -- 如 CSIE-1F
    address     VARCHAR(200)
);

-- ==========================================
-- VENUE（場地）
-- ==========================================
CREATE TABLE venue (
    venue_id    BIGSERIAL PRIMARY KEY,
    building_id BIGINT NOT NULL REFERENCES building(building_id)
                        ON DELETE RESTRICT
                        ON UPDATE CASCADE,
    name        VARCHAR(80)  NOT NULL,          -- 場地名稱
    type        VARCHAR(16)  NOT NULL
                CHECK (type IN ('Classroom','Auditorium','Meeting','Outdoor','Sport')),
    capacity    INT          NOT NULL DEFAULT 0 CHECK (capacity >= 0),
    open_status VARCHAR(4)   NOT NULL DEFAULT 'On'
                CHECK (open_status IN ('On','Off')),
    notes       TEXT
);

-- ==========================================
-- EQUIPMENT（設備 / 人力）
-- ==========================================
CREATE TABLE equipment (
    equip_id        BIGSERIAL PRIMARY KEY,
    name            VARCHAR(80)  NOT NULL,
    category        VARCHAR(40)  NOT NULL,      -- 器材/人力/耗材
    need_staff_bool BOOLEAN      NOT NULL DEFAULT FALSE,
    unit            VARCHAR(8)   NOT NULL DEFAULT 'PerHour'
                    CHECK (unit IN ('PerHour','PerUse')),
    status          VARCHAR(4)   NOT NULL DEFAULT 'On'
                    CHECK (status IN ('On','Off'))
);

-- ==========================================
-- VENUE_EQUIP（場地可用設備對應與庫存）
-- ==========================================
CREATE TABLE venue_equip (
    venue_id        BIGINT NOT NULL REFERENCES venue(venue_id)
                           ON DELETE CASCADE
                           ON UPDATE CASCADE,
    equip_id        BIGINT NOT NULL REFERENCES equipment(equip_id)
                           ON DELETE RESTRICT
                           ON UPDATE CASCADE,
    stock_qty       INT    NOT NULL DEFAULT 0 CHECK (stock_qty >= 0),
    default_on_bool BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (venue_id, equip_id)
);

-- ==========================================
-- TIMESLOT_RULE（可租時段規則）
-- ==========================================
CREATE TABLE timeslot_rule (
    rule_id     BIGSERIAL PRIMARY KEY,
    venue_id    BIGINT   NOT NULL REFERENCES venue(venue_id)
                          ON DELETE CASCADE
                          ON UPDATE CASCADE,
    weekday     SMALLINT NOT NULL CHECK (weekday BETWEEN 0 AND 6), -- 0=Sun
    open_time   TIME     NOT NULL,
    close_time  TIME     NOT NULL,
    slot_minute INT      NOT NULL DEFAULT 30 CHECK (slot_minute > 0)
);

-- ==========================================
-- BLOCKED_SLOT（阻擋租借 / 保留）
-- ==========================================
CREATE TABLE blocked_slot (
    block_id   BIGSERIAL PRIMARY KEY,
    venue_id   BIGINT NOT NULL REFERENCES venue(venue_id)
                        ON DELETE CASCADE
                        ON UPDATE CASCADE,
    date       DATE   NOT NULL,
    start_time TIME   NOT NULL,
    end_time   TIME   NOT NULL,
    reason     VARCHAR(120)
);

-- ==========================================
-- RATE_PLAN（場地費率方案）
-- ==========================================
CREATE TABLE rate_plan (
    plan_id    BIGSERIAL PRIMARY KEY,
    venue_id   BIGINT NOT NULL REFERENCES venue(venue_id)
                        ON DELETE RESTRICT
                        ON UPDATE CASCADE,
    name       VARCHAR(80) NOT NULL,
    status     VARCHAR(4)  NOT NULL DEFAULT 'On'
               CHECK (status IN ('On','Off'))
);

-- ==========================================
-- RATE_VERSION（費率版本）
-- ==========================================
CREATE TABLE rate_version (
    version_id   BIGSERIAL PRIMARY KEY,
    plan_id      BIGINT NOT NULL REFERENCES rate_plan(plan_id)
                          ON DELETE RESTRICT
                          ON UPDATE CASCADE,
    effective_from DATE   NOT NULL,
    effective_to   DATE,
    created_at     TIMESTAMP NOT NULL DEFAULT now()
);

-- ==========================================
-- PRICE_RULE（場地計價規則）
-- ==========================================
CREATE TABLE price_rule (
    price_id            BIGSERIAL PRIMARY KEY,
    version_id          BIGINT NOT NULL REFERENCES rate_version(version_id)
                                  ON DELETE CASCADE
                                  ON UPDATE CASCADE,
    affiliation         VARCHAR(12) NOT NULL
                        CHECK (affiliation IN ('Internal','External','Alumni')),
    day_type            VARCHAR(10) NOT NULL
                        CHECK (day_type IN ('Weekday','Weekend','Holiday')),
    start_time          TIME NOT NULL,
    end_time            TIME NOT NULL,
    base_fee_per_hour   NUMERIC(10,2) NOT NULL DEFAULT 0.00 CHECK (base_fee_per_hour >= 0),
    min_hours           INT          NOT NULL DEFAULT 1 CHECK (min_hours > 0),
    step_minute         INT          NOT NULL DEFAULT 30 CHECK (step_minute > 0),
    peak_surcharge_pct  NUMERIC(5,2),
    deposit_required_bool BOOLEAN    NOT NULL DEFAULT FALSE,
    deposit_amount      NUMERIC(10,2)
);

-- ==========================================
-- EQUIP_PRICE_RULE（設備加價規則）
-- ==========================================
CREATE TABLE equip_price_rule (
    eprice_id  BIGSERIAL PRIMARY KEY,
    version_id BIGINT NOT NULL REFERENCES rate_version(version_id)
                        ON DELETE CASCADE
                        ON UPDATE CASCADE,
    equip_id   BIGINT NOT NULL REFERENCES equipment(equip_id)
                        ON DELETE RESTRICT
                        ON UPDATE CASCADE,
    affiliation VARCHAR(12) NOT NULL
                CHECK (affiliation IN ('Internal','External','Alumni')),
    unit_price NUMERIC(10,2) NOT NULL DEFAULT 0.00 CHECK (unit_price >= 0),
    unit       VARCHAR(8)   NOT NULL DEFAULT 'PerHour'
                CHECK (unit IN ('PerHour','PerUse'))
);

-- ==========================================
-- HOLIDAY（行事曆 / 日型）
-- ==========================================
CREATE TABLE holiday (
    date     DATE PRIMARY KEY,
    name     VARCHAR(80),
    day_type VARCHAR(10) NOT NULL
             CHECK (day_type IN ('Weekday','Weekend','Holiday'))
);

-- ==========================================
-- BOOKING（訂單主資料表）
-- ==========================================
CREATE TABLE booking (
    booking_id        BIGSERIAL PRIMARY KEY,
    venue_id          BIGINT NOT NULL REFERENCES venue(venue_id)
                              ON DELETE RESTRICT
                              ON UPDATE CASCADE,
    user_id           BIGINT NOT NULL REFERENCES "user"(user_id)
                              ON DELETE CASCADE
                              ON UPDATE CASCADE,
    org_id            BIGINT     REFERENCES org(org_id)
                              ON DELETE SET NULL
                              ON UPDATE CASCADE,
    purpose           VARCHAR(200) NOT NULL,
    date              DATE         NOT NULL,
    start_time        TIME         NOT NULL,
    end_time          TIME         NOT NULL,
    people            INT          CHECK (people IS NULL OR people >= 0),
    version_id        BIGINT NOT NULL REFERENCES rate_version(version_id)
                              ON DELETE RESTRICT
                              ON UPDATE CASCADE,
    affiliation_cached VARCHAR(12) NOT NULL
                      CHECK (affiliation_cached IN ('Internal','External','Alumni')),
    amount_est        NUMERIC(10,2) NOT NULL DEFAULT 0.00 CHECK (amount_est >= 0),
    deposit           NUMERIC(10,2),
    status            VARCHAR(12) NOT NULL DEFAULT 'Draft'
                      CHECK (status IN ('Draft','Pending','Approved','Rejected','Cancelled','Completed')),
    hold_until        TIMESTAMP,
    created_at        TIMESTAMP NOT NULL DEFAULT now()
);

-- ==========================================
-- BOOKING_SLOT（訂單對應時段切段）
-- ==========================================
CREATE TABLE booking_slot (
    booking_id BIGINT    NOT NULL REFERENCES booking(booking_id)
                          ON DELETE CASCADE
                          ON UPDATE CASCADE,
    venue_id   BIGINT    NOT NULL REFERENCES venue(venue_id)
                          ON DELETE CASCADE
                          ON UPDATE CASCADE,
    slot_start TIMESTAMP NOT NULL,
    PRIMARY KEY (booking_id, venue_id, slot_start),
    CONSTRAINT uq_venue_slot UNIQUE (venue_id, slot_start)
);

-- ==========================================
-- BOOKING_EQUIP（訂單設備需求）
-- ==========================================
CREATE TABLE booking_equip (
    booking_id BIGINT NOT NULL REFERENCES booking(booking_id)
                        ON DELETE CASCADE
                        ON UPDATE CASCADE,
    equip_id   BIGINT NOT NULL REFERENCES equipment(equip_id)
                        ON DELETE RESTRICT
                        ON UPDATE CASCADE,
    qty        INT    NOT NULL DEFAULT 1 CHECK (qty > 0),
    PRIMARY KEY (booking_id, equip_id)
);

-- ==========================================
-- APPROVAL（審核紀錄）
-- ==========================================
CREATE TABLE approval (
    approval_id BIGSERIAL PRIMARY KEY,
    booking_id  BIGINT NOT NULL REFERENCES booking(booking_id)
                          ON DELETE CASCADE
                          ON UPDATE CASCADE,
    approver_id BIGINT NOT NULL REFERENCES "user"(user_id)
                          ON DELETE RESTRICT
                          ON UPDATE CASCADE,
    step        INT     NOT NULL DEFAULT 1,
    decision    VARCHAR(12) NOT NULL DEFAULT 'Pending'
                CHECK (decision IN ('Pending','Approved','Rejected')),
    comment     TEXT,
    decided_at  TIMESTAMP
);

-- ==========================================
-- PAYMENT（付款紀錄）
-- ==========================================
CREATE TABLE payment (
    payment_id BIGSERIAL PRIMARY KEY,
    booking_id BIGINT NOT NULL REFERENCES booking(booking_id)
                         ON DELETE CASCADE
                         ON UPDATE CASCADE,
    method     VARCHAR(12) NOT NULL
               CHECK (method IN ('Card','Transfer','Cash')),
    amount     NUMERIC(10,2) NOT NULL DEFAULT 0.00 CHECK (amount >= 0),
    type       VARCHAR(12) NOT NULL
               CHECK (type IN ('Deposit','Rent','Adjustment')),
    status     VARCHAR(12) NOT NULL DEFAULT 'Pending'
               CHECK (status IN ('Pending','Succeeded','Failed','Refunded')),
    created_at TIMESTAMP NOT NULL DEFAULT now()
);

-- ==========================================
-- REFUND（退款紀錄）
-- ==========================================
CREATE TABLE refund (
    refund_id  BIGSERIAL PRIMARY KEY,
    payment_id BIGINT NOT NULL REFERENCES payment(payment_id)
                         ON DELETE CASCADE
                         ON UPDATE CASCADE,
    amount     NUMERIC(10,2) NOT NULL DEFAULT 0.00 CHECK (amount >= 0),
    reason     VARCHAR(120),
    status     VARCHAR(12) NOT NULL DEFAULT 'Pending'
               CHECK (status IN ('Pending','Succeeded','Failed')),
    created_at TIMESTAMP NOT NULL DEFAULT now()
);
