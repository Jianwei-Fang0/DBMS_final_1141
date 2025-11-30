import pandas as pd
from pathlib import Path

CSV_PATH = Path("data/ntu_rooms_all_buildings.csv")
OUT_PLAN = Path("db/07_insert_rate_plan.sql")
OUT_VER  = Path("db/08_insert_rate_version.sql")
OUT_RULE = Path("db/09_insert_price_rule.sql")

df = pd.read_csv(CSV_PATH)

# 🔥 建築名稱標準化（非常重要！！！）
BUILDING_ALIAS = {
    "博雅教學館藝文空間": "博雅教學館",    # 🔧 修正點
}

def normalize_building(b):
    return BUILDING_ALIAS.get(b, b)

# -------------------------------------------------------
# Step C1: rate_plan（每個 venue 一個方案）
# -------------------------------------------------------
with OUT_PLAN.open("w", encoding="utf-8") as f:
    f.write("-- 07_insert_rate_plan.sql\n")
    f.write("-- 每個場地建立一個費率方案\n\n")
    f.write("INSERT INTO rate_plan (venue_id, name, status)\nVALUES\n")

    values = []
    venues = df[["building", "room_name"]].drop_duplicates()

    for _, row in venues.iterrows():
        b = normalize_building(row["building"])
        v = row["room_name"].replace("'", "''")

        values.append(
            "    ((SELECT v.venue_id FROM venue v "
            "JOIN building b ON v.building_id = b.building_id "
            f"WHERE v.name = '{v}' AND b.name = '{b}'), '預設方案', 'On')"
        )

    f.write(",\n".join(values) + ";\n")

print(f"✔ 已輸出 → {OUT_PLAN}")


# -------------------------------------------------------
# Step C2: rate_version（一版到底）
# -------------------------------------------------------
with OUT_VER.open("w", encoding="utf-8") as f:
    f.write("-- 08_insert_rate_version.sql\n")
    f.write("-- 每個方案建立費率版本\n\n")
    f.write(
        "INSERT INTO rate_version (plan_id, effective_from, effective_to)\n"
        "SELECT plan_id, DATE '2025-01-01', NULL FROM rate_plan;\n"
    )

print(f"✔ 已輸出 → {OUT_VER}")


# -------------------------------------------------------
# Step C3: price_rule（依 morning/afternoon/day/night）
# -------------------------------------------------------

def mk_rule(vname, bname, start, end, fee):
    v = vname.replace("'", "''")
    return f"""
INSERT INTO price_rule (version_id, affiliation, day_type, start_time, end_time, base_fee_per_hour)
SELECT rv.version_id, 'Internal', 'Weekday', '{start}', '{end}', {fee}
FROM venue v
JOIN building b ON v.building_id=b.building_id
JOIN rate_plan rp ON rp.venue_id=v.venue_id
JOIN rate_version rv ON rv.plan_id=rp.plan_id
WHERE v.name='{v}' AND b.name='{bname}';
"""

with OUT_RULE.open("w", encoding="utf-8") as f:
    f.write("-- 09_insert_price_rule.sql\n\n")
    for _, row in df.iterrows():
        b = normalize_building(row["building"])
        v = row["room_name"]

        f.write(mk_rule(v, b, "08:00", "12:00", row["morning_fee"]))
        f.write(mk_rule(v, b, "13:00", "17:00", row["afternoon_fee"]))
        f.write(mk_rule(v, b, "08:00", "17:00", row["day_fee"]))
        f.write(mk_rule(v, b, "18:00", "22:00", row["night_fee"]))

print(f"✔ 已輸出 → {OUT_RULE}")
