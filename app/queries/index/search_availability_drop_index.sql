-- 測試前先 drop 掉，做「無 index」版本
DROP INDEX IF EXISTS idx_timeslot_rule_venue_weekday;
DROP INDEX IF EXISTS uq_booking_slot_venue_slot;
DROP INDEX IF EXISTS idx_booking_status_hold_until;
DROP INDEX IF EXISTS idx_blocked_slot_venue_date_time;
-- 其他輔助索引視情況 drop
