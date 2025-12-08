# ============================================
# 生成操作日誌測試數據
# ============================================

import os
from dotenv import load_dotenv
from pymongo import MongoClient
from app.db.mongodb_operation_logs import log_operation, create_timeseries_collection
from datetime import datetime, timedelta
from random import randint

# 載入環境變數
load_dotenv()

def connect_mongodb():
    """
    從環境變數連接 MongoDB
    
    環境變數：
    - MONGODB_URI: MongoDB 連接字串（預設: mongodb://localhost:27017）
    - MONGODB_DB_NAME: 資料庫名稱（預設: booking_system）
    """
    uri = os.getenv('mongodb_uri')
    db_name = os.getenv('MONGODB_DB_NAME', 'booking_system')
    
    # 檢查環境變數是否設置
    if not uri:
        raise ValueError(
            '❌ 錯誤: 未設置 mongodb_uri 環境變數\n'
            '請在 .env 文件中設置: mongodb_uri=your_connection_string'
        )
    
    try:
        # 創建客戶端並測試連接
        client = MongoClient(uri, serverSelectionTimeoutMS=5000)
        client.server_info()  # 觸發實際連接測試
        db = client[db_name]
        return client, db
        
    except Exception as error:
        error_msg = str(error)
        
        if '10061' in error_msg or '拒絕連線' in error_msg or '無法連線' in error_msg:
            print(f'❌ 無法連接到 MongoDB 服務器')
            print(f'   請確認 MongoDB 服務是否正在運行')
        elif 'authentication failed' in error_msg or 'bad auth' in error_msg or 'AtlasError' in error_msg:
            print(f'❌ MongoDB Atlas 認證失敗')
            print(f'   請檢查 .env 文件中的用戶名和密碼是否正確')
            print(f'   注意: 密碼中的特殊字符需要 URL 編碼')
        else:
            print(f'❌ 連接失敗: {error}')
        raise

def generate_simple_test_data():
    """生成 5 筆簡單的測試數據"""
    
    # 簡單的動作代號（不需要太多屬性的）
    simple_actions = [
        'SEARCH_PENDING',           # 查詢待審核
        'SEARCH_ALL_BLACKLIST',      # 查詢黑名單
        'SEARCH_PENDING_PAYMENT',    # 查詢待付款
        'CHECK_BLACKLIST',           # 檢查黑名單
        'SEARCH_TIMESLOT_RULE_ALL'   # 查詢時段規則
    ]
    
    try:
        # 連接資料庫
        client, db = connect_mongodb()
        
        # 確保集合存在
        create_timeseries_collection(db, 'operation_logs')
        
        # 生成 5 筆數據
        for i, action in enumerate(simple_actions, 1):
            hours_ago = randint(0, 7 * 24)
            timestamp = datetime.now() - timedelta(hours=hours_ago)
            
            detail = {
                'operation_id': i,
                'description': f'執行 {action} 操作'
            }
            
            log_operation(
                db=db,
                action=action,
                operator_id=1,
                operator='admin',
                detail=detail,
                user_agent="admin",
                timestamp=timestamp
            )
        
        print(f'✅ 成功生成 5 筆測試數據')
        
        return True
        
    except Exception as error:
        print(f'❌ 生成測試數據失敗: {error}')
        return False
    finally:
        if 'client' in locals():
            client.close()

if __name__ == '__main__':
    generate_simple_test_data()

