-- app/queries/user/create_booking.sql
-- p1::bigint  venue_id
-- p2::bigint  user_id
-- p3::date    date
-- p4::time    start_time
-- p5::time    end_time
-- p6::int     people
-- p7::bigint  version_id
-- p8::numeric amount_est
-- returns: booking_id

WITH ins AS (
  INSERT INTO booking
    (venue_id, user_id, org_id, purpose, date, start_time, end_time,
     people, version_id, affiliation_cached, amount_est,
     status, hold_until, created_at)
  VALUES
    (%s, %s,              -- venue_id, user_id
     NULL,                -- org_id（之後要可以改成參數）
     'API Booking',       -- purpose（之後可改成前端傳入）
     %s, %s, %s,          -- date, start_time, end_time
     %s,                  -- people
     %s,                  -- version_id
     'Internal',          -- affiliation_cached（目前先寫死）
     %s,                  -- amount_est
     'Pending',
     NOW() + interval '30 min',
     NOW())
  RETURNING booking_id
)
SELECT booking_id FROM ins;
