import pandas as pd
from pathlib import Path

# 路徑依照你的專案結構調整
CSV_PATH = Path("data/ntu_rooms_all_buildings.csv")
OUT_EQUIP = Path("db/05_insert_equipment.sql")
OUT_VENUE_EQUIP = Path("db/06_insert_venue_equip.sql")

# ---------- 設備正規化邏輯（你選的方案 A） ----------
def normalize_equip_token(raw: str):
    """
    把「雙投影機」→ (name='投影機', qty=2)
       「單投影機」→ (name='投影機', qty=1)
       「三投影機」→ (name='投影機', qty=3)
       其他：原樣 name，qty=1
    """
    if not isinstance(raw, str):
        return None

    token = raw.strip()
    if not token:
        return None

    # 投影機系列
    if "投影機" in token:
        base_name = "投影機"
        if "雙" in token:
            qty = 2
        elif "三" in token:
            qty = 3
        elif "單" in token:
            qty = 1
        else:
            qty = 1
        return base_name, qty

    # 電視牆
    if "電視牆" in token:
        return "電視牆", 1

    # 冷氣
    if "冷氣" in token:
        return "冷氣空調", 1

    # 推播系統
    if "推播系統" in token:
        return "推播系統", 1

    # 其他設備：原樣名稱 + qty=1
    return token, 1


# ---------- Step 1：讀取 CSV ----------
df = pd.read_csv(CSV_PATH)

required_cols = [
    "room_name", "floor", "type", "capacity",
    "equipment", "morning_fee", "afternoon_fee",
    "day_fee", "night_fee", "building"
]
for c in required_cols:
    if c not in df.columns:
        raise ValueError(f"CSV 缺少欄位：{c}")

# ---------- Step 2：整理所有設備種類（equipment table 用） ----------
equip_name_set = set()

# 每間教室的 equipment 欄位類似「雙投影機、推播系統、冷氣空調」
for eq_raw in df["equipment"]:
    if isinstance(eq_raw, str):
        # 先用「、」切，有些也可能用逗號
        parts = []
        for chunk in str(eq_raw).replace("，", "、").split("、"):
            chunk = chunk.strip()
            if chunk:
                parts.append(chunk)

        for p in parts:
            norm = normalize_equip_token(p)
            if norm is None:
                continue
            name, _qty = norm
            equip_name_set.add(name)

# 排序讓 SQL 比較漂亮
equip_names = sorted(equip_name_set)

# ---------- Step 3：寫出 05_insert_equipment.sql ----------
with OUT_EQUIP.open("w", encoding="utf-8") as f:
    f.write("-- 05_insert_equipment.sql\n")
    f.write("-- 從 ntu_rooms_all_buildings.csv 自動產生設備 master\n\n")
    f.write("INSERT INTO equipment (name, category, need_staff_bool, unit, status) VALUES\n")

    values_sql = []
    for name in equip_names:
        # 簡單設定：全部 category='器材'，unit='PerUse'
        # 之後你們可以再人工調整，例如音響設備改成 PerHour
        safe_name = name.replace("'", "''")
        values_sql.append(
            f"    ('{safe_name}', '器材', FALSE, 'PerUse', 'On')"
        )

    f.write(",\n".join(values_sql))
    f.write(";\n")

print(f"✅ 已輸出設備 SQL → {OUT_EQUIP}")


# ---------- Step 4：寫出 06_insert_venue_equip.sql ----------
with OUT_VENUE_EQUIP.open("w", encoding="utf-8") as f:
    f.write("-- 06_insert_venue_equip.sql\n")
    f.write("-- 從 ntu_rooms_all_buildings.csv 自動產生場地設備對應\n\n")

    for _, row in df.iterrows():
        room_name = str(row["room_name"])
        building_name = str(row["building"])
        eq_raw = row["equipment"]

        if not isinstance(eq_raw, str) or not eq_raw.strip():
            continue

        # 先拆成多個設備 token
        parts = []
        for chunk in str(eq_raw).replace("，", "、").split("、"):
            chunk = chunk.strip()
            if chunk:
                parts.append(chunk)

        for p in parts:
            norm = normalize_equip_token(p)
            if norm is None:
                continue
            equip_name, qty = norm

            # escape
            b_safe = building_name.replace("'", "''")
            r_safe = room_name.replace("'", "''")
            e_safe = equip_name.replace("'", "''")

            # 這裡用子查詢找 venue_id & equip_id，
            # 不直接寫死數字，這樣就算未來 ID 變動都還是 OK
            sql = f"""
INSERT INTO venue_equip (venue_id, equip_id, stock_qty, default_on_bool)
SELECT v.venue_id, e.equip_id, {qty}, TRUE
FROM venue v
JOIN building b ON v.building_id = b.building_id
JOIN equipment e ON e.name = '{e_safe}'
WHERE b.name = '{b_safe}' AND v.name = '{r_safe}';
"""
            f.write(sql)

print(f"✅ 已輸出場地設備 SQL → {OUT_VENUE_EQUIP}")
