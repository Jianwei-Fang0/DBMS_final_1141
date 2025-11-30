import pandas as pd

# 1. 讀取 CSV（注意路徑是相對於 repo 根目錄）
df = pd.read_csv("data/ntu_clubs_full.csv")

output_path = "db/01_insert_org_clubs.sql"

with open(output_path, "w", encoding="utf-8") as f:
    for i, row in df.iterrows():
        # 取出社團名稱，處理單引號避免 SQL 爆炸
        club_name = str(row["name"]).replace("'", "''")

        # 這裡全部先當作學生社團：type = 'Club'
        sql = (
            "INSERT INTO org (name, type, contact_email) "
            f"VALUES ('{club_name}', 'Club', NULL);\n"
        )
        f.write(sql)

print(f"✅ SQL 產生完成！輸出檔案：{output_path}")
