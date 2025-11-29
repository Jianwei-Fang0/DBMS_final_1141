# ============================================
# MongoDB 操作日誌系統 - 針對場地預訂系統
# 統一的操作日誌記錄函數
# ============================================

from pymongo import MongoClient, ASCENDING, DESCENDING
from datetime import datetime, timedelta
from typing import List, Dict, Optional
import json
import os
from dotenv import load_dotenv

# 載入環境變數
load_dotenv()

# ============================================
# 1. 連接 MongoDB
# ============================================

def connect_mongodb(uri: Optional[str] = None, db_name: Optional[str] = None):
    """
    連接 MongoDB
    
    Args:
        uri: MongoDB 連接字串（可選，預設從環境變數 MONGODB_URI 讀取）
        db_name: 資料庫名稱（可選，預設從環境變數 MONGODB_DB_NAME 讀取，或使用 'booking_system'）
    
    Returns:
        tuple: (client, db) MongoDB 客戶端和資料庫物件
    """
    # 從環境變數讀取，如果沒有則使用預設值
    if uri is None:
        uri = os.getenv('MONGODB_URI', 'mongodb://localhost:27017')
    
    if db_name is None:
        db_name = os.getenv('MONGODB_DB_NAME', 'booking_system')
    
    try:
        client = MongoClient(uri)
        db = client[db_name]
        print(f'成功連接到 MongoDB: {db_name}')
        return client, db
    except Exception as error:
        print(f'連接 MongoDB {db_name} 失敗: {error}')
        raise

# ============================================
# 2. 統一的操作日誌函數
# ============================================

def log_operation(
    db,
    action: str,
    operator_id: int,
    operator: str,
    detail: Dict,
    user_agent: Optional[str] = None,
    timestamp: Optional[datetime] = None
):
    """
    統一的操作日誌記錄函數
    
    Schema:
    - id: MongoDB 自動生成的 _id（不需要手動指定）
    - operator_id: 操作者的 user_id（管理員或一般使用者）
    - operator: 操作者名稱或帳號（例如 email 或 name）
    - action: 這次操作的「動作代號」，用固定字串（對應 SQL 文件中的命名）
    - timestamp: 操作時間
    - user_agent: 前端帶來的 UA
    - detail: JSON 物件，記錄「改了什麼」與關鍵 id（例如前後差異、booking_id、payment_id 等）
    
    Args:
        db: MongoDB 資料庫物件
        action: 動作代號（例如 'SEARCH_PENDING', 'ADD_BLACKLIST', 'APPROVE_PENDING' 等）
        operator_id: 操作者的 user_id
        operator: 操作者名稱或帳號
        detail: 詳細資訊的字典（包含相關 ID、變更內容等）
        user_agent: 可選，前端 User-Agent
        timestamp: 可選，操作時間（預設為當前時間）
    
    Returns:
        InsertOneResult: MongoDB 插入結果
    """
    collection = db['operation_logs']
    
    log_doc = {
        'operator_id': operator_id,
        'operator': operator,
        'action': action,
        'timestamp': timestamp or datetime.now(),
        'detail': detail
    }
    
    # 如果有 user_agent，加入記錄
    if user_agent:
        log_doc['user_agent'] = user_agent
    
    result = collection.insert_one(log_doc)
    return result

# ============================================
# 3. 查詢操作日誌
# ============================================

def get_operation_logs(
    db,
    action: Optional[str] = None,
    operator_id: Optional[int] = None,
    start_date: Optional[datetime] = None,
    end_date: Optional[datetime] = None,
    limit: int = 100
):
    """
    查詢操作日誌
    
    Args:
        db: MongoDB 資料庫物件
        action: 可選，篩選特定動作代號
        operator_id: 可選，篩選特定操作者
        start_date: 可選，開始時間
        end_date: 可選，結束時間
        limit: 返回筆數限制
    
    Returns:
        List[Dict]: 日誌記錄列表
    """
    collection = db['operation_logs']
    
    query = {}
    
    if action:
        query['action'] = action
    
    if operator_id:
        query['operator_id'] = operator_id
    
    if start_date or end_date:
        query['timestamp'] = {}
        if start_date:
            query['timestamp']['$gte'] = start_date
        if end_date:
            query['timestamp']['$lte'] = end_date
    
    logs = list(collection.find(query)
                .sort('timestamp', DESCENDING)
                .limit(limit))
    
    return logs

def get_operation_logs_by_booking_id(db, booking_id: int, limit: int = 100):
    """
    根據 booking_id 查詢相關操作日誌
    
    Args:
        db: MongoDB 資料庫物件
        booking_id: 訂單 ID
        limit: 返回筆數限制
    
    Returns:
        List[Dict]: 日誌記錄列表
    """
    collection = db['operation_logs']
    
    logs = list(collection.find({
        'detail.booking_id': booking_id
    }).sort('timestamp', ASCENDING).limit(limit))
    
    return logs

def get_operation_logs_by_payment_id(db, payment_id: int, limit: int = 100):
    """
    根據 payment_id 查詢相關操作日誌
    
    Args:
        db: MongoDB 資料庫物件
        payment_id: 付款 ID
        limit: 返回筆數限制
    
    Returns:
        List[Dict]: 日誌記錄列表
    """
    collection = db['operation_logs']
    
    logs = list(collection.find({
        'detail.payment_id': payment_id
    }).sort('timestamp', ASCENDING).limit(limit))
    
    return logs

def get_operation_statistics(
    db,
    days: int = 7,
    group_by_action: bool = True
):
    """
    統計操作數量
    
    Args:
        db: MongoDB 資料庫物件
        days: 統計最近幾天
        group_by_action: 是否按 action 分組
    
    Returns:
        List[Dict]: 統計結果
    """
    collection = db['operation_logs']
    
    start_date = datetime.now() - timedelta(days=days)
    
    if group_by_action:
        pipeline = [
            {
                '$match': {
                    'timestamp': {'$gte': start_date}
                }
            },
            {
                '$group': {
                    '_id': '$action',
                    'count': {'$sum': 1}
                }
            },
            {
                '$sort': {'count': -1}
            }
        ]
        
        stats = list(collection.aggregate(pipeline))
        return stats
    else:
        count = collection.count_documents({
            'timestamp': {'$gte': start_date}
        })
        return [{'total': count}]

# ============================================
# 4. 建立 Time-Series 集合
# ============================================

def create_timeseries_collection(
    db, 
    collection_name: str = 'operation_logs',
    time_field: str = 'timestamp',
    meta_field: Optional[str] = 'action',
    granularity: str = 'minutes',  # 預設改為 minutes，適合一般業務日誌
    expire_after_seconds: Optional[int] = 7776000  # 90 天
):
    """
    建立 Time-Series 集合（如果不存在）
    
    Time-Series 集合設定說明：
    
    必需參數：
    - timeField: 指定作為時間字段的欄位名稱，必須是 BSON date 類型
      範例：'timestamp'
    
    可選參數：
    - metaField: 元數據字段，用於按操作類型分組，提升查詢效率
      範例：'action' 或 'operator_id'
      建議：使用 'action' 可以按操作類型分組，查詢特定操作時更高效
    
    - granularity: 粒度設定，允許指定更粗的粒度以便更高效地儲存和查詢長時間跨度的測量值
      選項：'seconds', 'minutes', 'hours'
      說明：
        * granularity 不會影響實際存儲的數據量（數據量取決於實際操作頻率）
        * 它只影響 MongoDB 如何組織數據到「桶」（buckets）中
        * 選擇建議：
          - 'seconds': 適合高頻操作（每秒多次操作，如 API 日誌、即時監控）
          - 'minutes': 適合中頻操作（每分鐘多次操作，如一般業務操作日誌）
          - 'hours': 適合低頻操作（每小時多次操作，如報表生成日誌）
      建議：場地預訂系統通常使用 'minutes' 即可，除非操作非常頻繁
    
    - bucketMaxSpanSeconds: 桶的最大時間跨度（秒）
      預設：根據 granularity 自動設定
      說明：控制每個桶能包含的最大時間範圍
    
    - bucketRoundingSeconds: 桶的起始時間間隔（秒）
      預設：根據 granularity 自動設定
      說明：決定新桶的起始時間戳
    
    - expireAfterSeconds: 自動刪除過期文檔的秒數（TTL）
      範例：7776000 = 90 天
      建議：根據業務需求設定，日誌通常保留 30-90 天
    
    Args:
        db: MongoDB 資料庫物件
        collection_name: 集合名稱（預設為 'operation_logs'）
        time_field: 時間字段名稱（預設為 'timestamp'）
        meta_field: 元數據字段名稱（預設為 'action'，設為 None 則不使用）
        granularity: 粒度設定（預設為 'seconds'）
        expire_after_seconds: TTL 秒數（預設為 90 天，設為 None 則不自動刪除）
    
    Returns:
        Collection: MongoDB 集合物件
    """
    # 檢查集合是否已存在
    if collection_name in db.list_collection_names():
        print(f'集合 {collection_name} 已存在')
        return db[collection_name]
    
    # 建立 Time-Series 集合配置
    timeseries_config = {
        'timeField': time_field
    }
    
    # 可選：元數據字段
    if meta_field:
        timeseries_config['metaField'] = meta_field
    
    # 可選：粒度設定
    if granularity:
        timeseries_config['granularity'] = granularity
    
    # 建立集合
    try:
        create_options = {
            'timeseries': timeseries_config
        }
        
        # 可選：TTL 設定
        if expire_after_seconds:
            create_options['expireAfterSeconds'] = expire_after_seconds
        
        db.create_collection(collection_name, **create_options)
        
        print(f'Time-Series 集合 {collection_name} 建立成功')
        print(f'  時間字段: {time_field}')
        if meta_field:
            print(f'  元數據字段: {meta_field}')
        print(f'  粒度: {granularity}')
        if expire_after_seconds:
            days = expire_after_seconds / 86400
            print(f'  自動刪除: {days} 天前的文檔')
        
        return db[collection_name]
    except Exception as error:
        # 如果集合已存在或其他錯誤
        print(f'建立集合時發生錯誤: {error}')
        return db[collection_name]

# ============================================
# 5. 索引建立（提升查詢效能）
# ============================================

def create_log_indexes(db, collection_name: str = 'operation_logs'):
    """
    建立日誌索引
    
    注意：Time-Series 集合會自動為 timestamp 和 metaField 建立索引，
    但仍可建立其他查詢常用的索引。
    
    Args:
        db: MongoDB 資料庫物件
        collection_name: 集合名稱（預設為 'operation_logs'）
    """
    collection = db[collection_name]
    
    # 檢查是否為 Time-Series 集合
    is_timeseries = False
    try:
        collection_info = db.command('listCollections', filter={'name': collection_name})
        for coll in collection_info['cursor']['firstBatch']:
            if 'timeseries' in coll.get('options', {}):
                is_timeseries = True
                break
    except:
        pass
    
    if is_timeseries:
        print('檢測到 Time-Series 集合，timestamp 和 action 已自動建立索引')
        # Time-Series 集合的額外索引
        try:
            collection.create_index('operator_id')
            collection.create_index('detail.booking_id')
            collection.create_index('detail.payment_id')
            print('額外索引建立完成')
        except Exception as e:
            print(f'建立額外索引時發生錯誤: {e}')
    else:
        # 普通集合的索引
        collection.create_index([('action', ASCENDING), ('timestamp', DESCENDING)])
        collection.create_index([('operator_id', ASCENDING), ('timestamp', DESCENDING)])
        collection.create_index('timestamp')
        collection.create_index('detail.booking_id')
        collection.create_index('detail.payment_id')
        
        # TTL 索引：自動刪除 90 天前的日誌（可調整）
        collection.create_index('timestamp', expireAfterSeconds=7776000)  # 90 天
        print('日誌索引建立完成')

# ============================================
# 6. 使用範例
# ============================================

def example_usage():
    """完整使用範例"""
    try:
        # 連接資料庫
        client, db = connect_mongodb()
        
        # 建立 Time-Series 集合（首次使用時）
        create_timeseries_collection(db, 'operation_logs')
        
        # 建立索引
        create_log_indexes(db)
        
        # 範例 1: 記錄審核通過操作
        log_operation(
            db,
            action='APPROVE_PENDING',
            operator_id=1,
            operator='admin@example.com',
            detail={
                'booking_id': 123,
                'previous_status': 'Pending',
                'new_status': 'Approved',
                'comment': '符合使用規定，准予使用'
            },
            user_agent='Mozilla/5.0 (Windows NT 10.0; Win64; x64)'
        )
        
        # 範例 2: 記錄新增黑名單操作
        log_operation(
            db,
            action='ADD_BLACKLIST',
            operator_id=1,
            operator='admin@example.com',
            detail={
                'user_id': 456,
                'user_name': '張三',
                'reason': '違反使用規定',
                'blocked_until': '2025-12-31'
            }
        )
        
        # 範例 3: 記錄訂單異動操作
        log_operation(
            db,
            action='BOOKING_MODIFY_FULL_FLOW',
            operator_id=789,
            operator='user@example.com',
            detail={
                'booking_id': 123,
                'old_date': '2025-01-15',
                'new_date': '2025-01-20',
                'old_amount': 1000.00,
                'new_amount': 1200.00,
                'amount_diff': 200.00
            },
            user_agent='Mozilla/5.0...'
        )
        
        # 範例 4: 記錄付款成功操作
        log_operation(
            db,
            action='UPDATE_PAYMENT_STATUS_TO_SUCCEEDED',
            operator_id=1,
            operator='admin@example.com',
            detail={
                'payment_id': 789,
                'booking_id': 123,
                'previous_status': 'Pending',
                'new_status': 'Succeeded',
                'amount': 1000.00
            }
        )
        
        # 查詢特定訂單的操作歷史
        booking_logs = get_operation_logs_by_booking_id(db, booking_id=123)
        print(f'訂單 123 的操作歷史: {len(booking_logs)} 筆記錄')
        
        # 查詢特定動作的操作記錄
        approval_logs = get_operation_logs(db, action='APPROVE_PENDING', limit=50)
        print(f'審核通過操作: {len(approval_logs)} 筆記錄')
        
        # 統計操作
        stats = get_operation_statistics(db, days=7)
        print(f'操作統計: {stats}')
        
    except Exception as error:
        print(f'操作失敗: {error}')
    finally:
        if 'client' in locals():
            client.close()
            print('MongoDB 連接已關閉')

# ============================================
# 7. Time-Series 集合設定說明
# ============================================

"""
在 MongoDB Compass 或 Atlas 中建立 Time-Series 集合時，需要設定：

【必需設定】
1. Database Name: venue_booking_logs（或 operation_logs）
2. Collection Name: operation_logs
3. 勾選 "Time-Series" 選項
4. Time Field: timestamp
   - 必須是 BSON date 類型
   - 這是時間序列的主要字段

【可選設定 - 建議配置】
5. Meta Field: action
   - 用於按操作類型分組
   - 提升按 action 查詢的效率
   - 例如：查詢所有 'APPROVE_PENDING' 操作時會更快

6. Granularity: minutes（推薦）或 seconds
   - 'seconds': 適合高頻操作（每秒多次，如 API 日誌、即時監控）
   - 'minutes': 適合中頻操作（每分鐘多次，如一般業務操作日誌）【推薦】
   - 'hours': 適合低頻操作（每小時多次，如報表生成日誌）
   - 重要：granularity 不會影響實際數據量，只影響存儲優化方式
   - 建議：場地預訂系統使用 'minutes' 即可，除非操作非常頻繁

【可選設定 - 進階配置】
7. Bucket Max Span Seconds: （通常不需要手動設定）
   - 桶的最大時間跨度
   - 預設會根據 granularity 自動設定

8. Bucket Rounding Seconds: （通常不需要手動設定）
   - 桶的起始時間間隔
   - 預設會根據 granularity 自動設定

9. Expire After Seconds: 7776000（90 天）
   - 自動刪除過期文檔
   - 7776000 秒 = 90 天
   - 可根據需求調整（例如：2592000 = 30 天）

【使用程式碼建立（推薦）】
    client, db = connect_mongodb()
    create_timeseries_collection(
        db, 
        collection_name='operation_logs',
        time_field='timestamp',
        meta_field='action',          # 可選
        granularity='seconds',        # 可選
        expire_after_seconds=7776000  # 可選，90 天
    )

Time-Series 集合的優點：
- 自動壓縮，節省儲存空間（通常可節省 50-90%）
- 針對時間範圍查詢優化
- 自動為 timestamp 和 metaField 建立索引
- 適合大量時間序列數據（如日誌）
- 查詢性能優於普通集合（特別是時間範圍查詢）

【推薦配置（日誌系統）】
- Time Field: timestamp
- Meta Field: action（按操作類型分組）
- Granularity: minutes（一般業務日誌）或 seconds（高頻操作）
- Expire After Seconds: 7776000（90 天自動刪除）

【Granularity 選擇指南】
根據預估的操作頻率選擇：
- 每秒 > 10 次操作 → 使用 'seconds'
- 每分鐘 > 10 次操作 → 使用 'minutes'（推薦）
- 每小時 > 10 次操作 → 使用 'hours'

注意：granularity 不會增加數據量，只影響 MongoDB 的內部優化方式。
實際數據量取決於操作頻率，與 granularity 無關。
"""

# ============================================
# 8. 常用動作代號對照表（對應 SQL 文件中的命名）
# ============================================

"""
審核與核准流程 (approval_queries.sql):
- SEARCH_PENDING: 查詢待審核申請清單
- SEARCH_PENDING_DETAIL: 查詢待審核申請詳細資訊
- SEARCH_PENDING_HISTORY: 查詢單一申請的審核歷史
- SEARCH_ALL_BOOKING_PROCESS: 查詢所有審核狀態的申請
- APPROVE_PENDING: 審核通過流程
- REJECT_PENDING: 審核拒絕流程
- MULTI_APPROVAL: 多關卡審核流程
- ADD_BLOCKED_SLOT: 鎖定時段
- ADD_BOOKING_SLOT: 建立 BOOKING_SLOT 切片
- CHECK_BLACKLIST: 檢查申請人是否在黑名單中
- CHECK_VENUE_SPECIFICATION: 檢查場地規範
- CHECK_TIME_CONFLICT: 檢查時段衝突
- CHECK_TIME_RULE: 檢查場地開放時間規則
- CHECK_EQUIPMENT_REQUIREMENT: 檢查設備需求是否滿足
- COMPREHENSIVE_APPROVAL_CHECK: 綜合審核檢查

訂單異動 (booking_modification.sql):
- BOOKING_MODIFY_FULL_FLOW: 訂單異動完整流程
- BOOKING_MODIFY_FUNCTION: 使用函數處理訂單異動

黑名單管理 (black_list.sql):
- ADD_BLACKLIST: 新增黑名單紀錄
- DELETE_BLACKLIST: 刪除黑名單紀錄
- SEARCH_ALL_BLACKLIST: 查詢黑名單清單

規則與資源設定 (set_rule.sql):
- SEARCH_TIMESLOT_RULE_ALL: 查看所有場地的時段規則
- SEARCH_TIMESLOT_RULE_BY_VENUE: 查看特定場地的時段規則
- ADD_TIMESLOT_RULE: 新增時段規則
- UPDATE_TIMESLOT_RULE: 更新時段規則
- DELETE_TIMESLOT_RULE: 刪除時段規則
- SEARCH_BLOCKED_SLOT_ALL: 查看所有臨時阻擋
- SEARCH_BLOCKED_SLOT_BY_VENUE: 查看特定場地未過期的阻擋時段
- ADD_BLOCKED_SLOT: 建立臨時阻擋
- DELETE_BLOCKED_SLOT: 刪除臨時阻擋
- SEARCH_RATE_PLAN_ALL: 查看所有費率方案
- SEARCH_RATE_PLAN_BY_VENUE: 查看特定場地的費率方案
- SEARCH_PRICE_RULE_BY_PLAN: 查看單一方案的詳細價格規則
- ADD_RATE_PLAN: 建立新的費率方案
- ADD_RATE_VERSION: 建立新的費率版本
- ADD_PRICE_RULE: 建立價格規則
- UPDATE_RATE_PLAN_STATUS: 更新費率方案狀態
- SEARCH_VENUE_EQUIP_ALL: 查看所有場地的設備與庫存
- SEARCH_VENUE_EQUIP_BY_VENUE: 查看特定場地的設備清單
- UPDATE_VENUE_EQUIP_STOCK: 更新設備庫存數量
- ADD_VENUE_EQUIP: 新增場地設備
- UPDATE_VENUE_EQUIP_DEFAULT: 更新設備是否預設附帶
- SEARCH_EQUIP_PRICE_RULE_ALL: 查看所有設備加價規則
- SEARCH_EQUIP_PRICE_RULE_BY_VERSION: 查看特定版本的設備加價規則
- SEARCH_EQUIP_PRICE_RULE_BY_VENUE: 查看特定場地的設備加價規則
- ADD_EQUIP_PRICE_RULE: 建立新的設備加價規則
- UPDATE_EQUIP_PRICE_RULE: 更新設備加價規則
- DELETE_EQUIP_PRICE_RULE: 刪除設備加價規則

金流入帳與退款 (update_fund.sql):
- UPDATE_PAYMENT_STATUS_TO_SUCCEEDED: 標記付款成功
- SEARCH_PENDING_PAYMENT: 查詢所有待付款紀錄
- ADD_REFUND: 建立退款紀錄
- UPDATE_PAYMENT_STATUS_BY_REFUND: 退款後更新付款狀態
"""

# 執行範例
# if __name__ == '__main__':
#     example_usage()
