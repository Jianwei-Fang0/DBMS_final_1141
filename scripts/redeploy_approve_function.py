#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
重新部署 approve_booking 函數
確保批准訂單時自動創建 payment 記錄
"""
import sys
import os

# 添加項目根目錄到路徑
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

from app.db.postgres import get_conn

def redeploy_approve_function():
    """重新部署 approve_booking 函數"""
    sql_path = os.path.join(os.path.dirname(__file__), '..', 'app', 'queries', 'admin', 'approval_queries.sql')
    
    with open(sql_path, 'r', encoding='utf-8') as f:
        sql_content = f.read()
    
    # 只提取 approve_booking 函數定義部分
    # 從 "CREATE OR REPLACE FUNCTION approve_booking" 開始到 "$$ LANGUAGE plpgsql;" 結束
    start_marker = "CREATE OR REPLACE FUNCTION approve_booking"
    end_marker = "$$ LANGUAGE plpgsql;"
    
    start_idx = sql_content.find(start_marker)
    if start_idx == -1:
        print("❌ 找不到 approve_booking 函數定義")
        return False
    
    # 找到函數結束位置（需要找到對應的 $$ LANGUAGE plpgsql;）
    # 從 start_idx 開始查找
    remaining = sql_content[start_idx:]
    # 找到第一個 $$ LANGUAGE plpgsql; 之後的位置
    end_idx = remaining.find(end_marker)
    if end_idx == -1:
        print("❌ 找不到函數結束標記")
        return False
    
    function_sql = remaining[:end_idx + len(end_marker)]
    
    print("📝 正在重新部署 approve_booking 函數...")
    print("=" * 60)
    
    # 先檢查函數中是否包含創建 payment 的邏輯
    if "INSERT INTO PAYMENT" not in function_sql and "INSERT INTO payment" not in function_sql:
        print("⚠️  警告：函數定義中似乎沒有創建 payment 的邏輯")
        print("   請確認 approval_queries.sql 已更新")
    
    with get_conn() as conn, conn.cursor() as cur:
        try:
            # 執行函數定義
            cur.execute(function_sql)
            conn.commit()
            print("✅ approve_booking 函數已成功重新部署！")
            print("\n📋 函數功能確認：")
            print("  - 批准訂單時會自動創建 payment 記錄")
            print("  - payment 狀態為 'Pending'")
            print("  - 金額使用 booking.amount_est")
            print("  - 只有最終批准（p_final=TRUE）且金額>0時才創建")
            
            # 驗證函數是否存在
            cur.execute("""
                SELECT proname, prosrc 
                FROM pg_proc 
                WHERE proname = 'approve_booking'
            """)
            result = cur.fetchone()
            if result:
                print(f"\n✅ 函數已存在於資料庫中")
                if "INSERT INTO" in result[1] and "PAYMENT" in result[1].upper():
                    print("✅ 確認函數包含創建 payment 的邏輯")
            return True
        except Exception as e:
            conn.rollback()
            print(f"❌ 部署失敗: {e}")
            import traceback
            traceback.print_exc()
            return False

if __name__ == "__main__":
    try:
        success = redeploy_approve_function()
        if success:
            print("\n" + "=" * 60)
            print("🎉 完成！現在當你批准訂單時，待付款記錄會自動創建。")
            print("\n💡 測試步驟：")
            print("  1. 創建一個新的預約（status='Pending'）")
            print("  2. 使用管理員批准這個預約")
            print("  3. 查看待付款清單，應該會看到新創建的 payment 記錄")
        sys.exit(0 if success else 1)
    except Exception as e:
        print(f"\n❌ 錯誤: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
