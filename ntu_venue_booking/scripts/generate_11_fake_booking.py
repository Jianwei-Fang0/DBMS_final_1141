import random
import pandas as pd
from datetime import date, timedelta
from pathlib import Path

CSV_PATH = Path("data/ntu_rooms_all_buildings.csv")
OUT_BOOK = Path("db/11_insert_booking.sql")

# Booking 筆數
N_BOOK = 500

df = pd.read_csv(CSV_PATH)

# 修正 building alias（必要）
BUILDING_ALIAS = {
    "博雅教學館藝文空間": "博雅教學館"
}

def normalize(b):
    return BUILDING_ALIAS.get(b, b)

# 生成日期區間：2025/03/01 ~ 2025/03/31
days = [date(2025, 3, d) for d in range(1, 32)]

# 時段池（用來建立 booking_slot）
SLOTS = [
    ("08:00", "12:00", "Morning"),
    ("13:00", "17:00", "Afternoon"),
    ("18:00", "22:00", "Night"),
]

# 防 double-book：紀錄 (venue_id, date, start)
used_slots = set()

with OUT_BOOK.open("w", encoding="utf-8") as f:
    f.write("-- 11_insert_booking.sql\n")
    f.write("-- 自動產生 booking + booking_slot（500 筆）\n\n")

    for i in range(N_BOOK):
        row = df.sample(1).iloc[0]

        user_id = random.randint(1, 200)

        building = normalize(row["building"])
        venue = row["room_name"].replace("'", "''")

        d = random.choice(days)
        start, end, slot_name = random.choice(SLOTS)
        slot_key = (venue, building, d, start)

        # 避免 double booking
        if slot_key in used_slots:
            continue
        used_slots.add(slot_key)

        # 生成 booking SQL
        sql = f"""
-- booking {i+1}
WITH vinfo AS (
    SELECT v.venue_id, rp.plan_id, rv.version_id
    FROM venue v
    JOIN building b ON v.building_id=b.building_id
    JOIN rate_plan rp ON rp.venue_id = v.venue_id
    JOIN rate_version rv ON rv.plan_id = rp.plan_id
    WHERE v.name='{venue}' AND b.name='{building}'
)
INSERT INTO booking (
    venue_id, user_id, purpose, date, start_time, end_time,
    people, version_id, affiliation_cached, amount_est, status
)
SELECT
    v.venue_id,
    {user_id},
    '活動預約',
    '{d}',
    '{start}',
    '{end}',
    30,
    v.version_id,
    'Internal',
    (SELECT base_fee_per_hour * 4 
     FROM price_rule pr 
     WHERE pr.version_id=v.version_id 
       AND pr.start_time='{start}'
     LIMIT 1),
    'Pending'
FROM vinfo v;

-- slot
INSERT INTO booking_slot (booking_id, venue_id, slot_start)
SELECT currval('booking_booking_id_seq'), v.venue_id, '{d} {start}'
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='{venue}' AND b.name='{building}';

"""
        f.write(sql)

print(f"✔ 已輸出 → {OUT_BOOK}")
