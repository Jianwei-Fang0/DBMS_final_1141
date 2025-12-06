-- =====================================================
-- Index definitions for ntu-venue-booking
-- =====================================================

-- 1) for search_availability: 開放時段規則
CREATE INDEX IF NOT EXISTS idx_timeslot_rule_venue_weekday
ON timeslot_rule (venue_id, weekday);

-- 2) booking_slot：占用時段切片
CREATE UNIQUE INDEX IF NOT EXISTS uq_booking_slot_venue_slot
ON booking_slot (venue_id, slot_start);

-- 3) booking：依狀態＋有效期限過濾
CREATE INDEX IF NOT EXISTS idx_booking_status_hold_until
ON booking (status, hold_until);

-- 4) blocked_slot：封館時間
CREATE INDEX IF NOT EXISTS idx_blocked_slot_venue_date_time
ON blocked_slot (venue_id, date, start_time, end_time);

-- Supporting
-- 場地設備
CREATE INDEX IF NOT EXISTS idx_venue_equip_venue
ON venue_equip (venue_id);

-- 費率方案：場地＋狀態
CREATE INDEX IF NOT EXISTS idx_rate_plan_venue_status
ON rate_plan (venue_id, status);

-- 版本：方案＋生效日
CREATE INDEX IF NOT EXISTS idx_rate_version_plan_effective
ON rate_version (plan_id, effective_from DESC);

-- 價格規則：版本＋day_type＋起始時間
CREATE INDEX IF NOT EXISTS idx_price_rule_version_day_start
ON price_rule (version_id, day_type, start_time);

-- 假日表
CREATE INDEX IF NOT EXISTS idx_holiday_date
ON holiday (date);
