import random
from pathlib import Path

OUTPUT_SQL = Path("db/04_insert_users.sql")

# 你要多少使用者？
N_USERS = 200

# 中文名字庫
FAMILY_NAMES = list("王李張陳林黃趙周吳徐孫胡朱高蔡鄭謝賴何呂唐許")
GIVEN_NAMES  = ["怡君", "家豪", "俊傑", "雅婷", "志強", "佩玲", "冠廷", "郁婷", "柏妤",
                "佳穎", "冠宇", "彥廷", "鈺婷", "宗翰", "冠瑋", "冠儒", "采潔", "雅雯"]

# 英文名字庫
ENGLISH_FIRST = ["Alice","Bob","Cindy","David","Ellen","Frank","Grace","Henry","Ivy","Jack",
                 "Kevin","Linda","Mike","Nina","Oscar","Penny","Queen","Ryan","Sara","Tom"]
ENGLISH_LAST  = ["Wang","Chen","Lin","Chang","Lee","Huang","Wu","Tsai","Hsueh","Su"]

MOBILE_PREFIX = ["0900","0901","0910","0920","0930","0981"]

ROLES = ["Applicant", "Applicant", "Applicant", "VenueManager", "Finance", "SysAdmin"]
MAX_ORG_ID = 200
FAKE_HASH = "$2b$12$Wc1AgYh3Ul3Z5x2yvdF7z.abcdefghijklmnopqrstu"


def random_chinese_name():
    return random.choice(FAMILY_NAMES) + random.choice(GIVEN_NAMES)

def random_english_name():
    return random.choice(ENGLISH_FIRST) + " " + random.choice(ENGLISH_LAST)

def generate_user(i):
    """
    i: 從 1 開始的 index，用來產生穩定不重複的 email
    """
    lang = random.choice(["zh","en"])

    if lang == "zh":
        name = random_chinese_name()
    else:
        name = random_english_name()

    # ✅ email 只跟 index 有關，保證唯一
    email = f"user{i}@ntu.edu.tw"

    phone = random.choice(MOBILE_PREFIX) + f"{random.randint(100000,999999)}"
    org = random.randint(1, MAX_ORG_ID)
    role = random.choice(ROLES)
    verified = "TRUE" if random.random() < 0.6 else "FALSE"

    return {
        "name": name.replace("'", "''"),
        "email": email,
        "phone": phone,
        "org": org,
        "role": role,
        "verified": verified,
    }


# ============================
#   產生 SQL
# ============================
with OUTPUT_SQL.open("w", encoding="utf-8") as f:

    f.write("-- 04_insert_users.sql\n")
    f.write("-- 自動產生大量 demo 使用者（email 唯一 user1@ntu.edu.tw ...）\n\n")

    # --- INSERT INTO user ---
    f.write("INSERT INTO \"user\" (email, password_hash, name, phone, affiliation, org_id, status)\nVALUES\n")

    user_rows = []
    users = []

    for i in range(1, N_USERS + 1):
        u = generate_user(i)
        users.append(u)
        sql = (
            f"    ('{u['email']}', '{FAKE_HASH}', '{u['name']}', '{u['phone']}', "
            f"'Internal', {u['org']}, 'Active')"
        )
        user_rows.append(sql)

    f.write(",\n".join(user_rows) + ";\n\n")

    # --- INSERT INTO user_role ---
    f.write("-- 使用者角色\n")
    role_sql = []
    for idx, u in enumerate(users):
        user_id = idx + 1
        role_sql.append(
            f"INSERT INTO user_role (user_id, role) VALUES ({user_id}, '{u['role']}');"
        )
    f.write("\n".join(role_sql) + "\n\n")

    # --- INSERT INTO org_member ---
    f.write("-- 組織成員\n")
    org_sql = []
    for idx, u in enumerate(users):
        user_id = idx + 1
        org_sql.append(
            f"INSERT INTO org_member (org_id, user_id, verified_bool) VALUES "
            f"({u['org']}, {user_id}, {u['verified']});"
        )
    f.write("\n".join(org_sql) + "\n\n")

print(f"✔ 產生完成 → {OUTPUT_SQL}")
