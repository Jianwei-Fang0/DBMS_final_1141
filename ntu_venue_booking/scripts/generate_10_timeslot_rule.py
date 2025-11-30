from pathlib import Path
import pandas as pd

CSV_PATH = Path("data/ntu_rooms_all_buildings.csv")
OUT_TS = Path("db/10_insert_timeslot_rule.sql")

df = pd.read_csv(CSV_PATH)

with OUT_TS.open("w", encoding="utf-8") as f:
    f.write("-- 10_insert_timeslot_rule.sql\n")
    f.write("-- 全館時段規則（平日 08-22，週末 09-22）\n\n")

    # 全場地
    venues = df[["building", "room_name"]].drop_duplicates()

    for _, row in venues.iterrows():
        b = row["building"]
        v = row["room_name"].replace("'", "''")

        # 平日 (1~5)
        for wd in range(1, 6):
            f.write(f"""
INSERT INTO timeslot_rule (venue_id, weekday, open_time, close_time, slot_minute)
SELECT v.venue_id, {wd}, '08:00', '22:00', 60
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='{v}' AND b.name='{b}';
""")

        # 週日=0、週六=6
        for wd in [0, 6]:
            f.write(f"""
INSERT INTO timeslot_rule (venue_id, weekday, open_time, close_time, slot_minute)
SELECT v.venue_id, {wd}, '09:00', '22:00', 60
FROM venue v
JOIN building b ON v.building_id=b.building_id
WHERE v.name='{v}' AND b.name='{b}';
""")

print(f"✔ 已輸出 → {OUT_TS}")
