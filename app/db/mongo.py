# app/db/mongo.py
from typing import Optional, Any, Dict, List
from datetime import datetime

from pymongo import MongoClient, ASCENDING
from pymongo.errors import PyMongoError

from app.core.config import settings
from pymongo.errors import PyMongoError
from pymongo.errors import OperationFailure

# 直接用你那份工具庫
from app.db.mongodb_operation_logs import (
    create_timeseries_collection,
    create_log_indexes,
    log_operation as _log_operation,
    get_operation_logs as _get_operation_logs,
    get_operation_logs_by_booking_id as _get_logs_by_booking_id,
    get_operation_logs_by_payment_id as _get_logs_by_payment_id,
    get_operation_statistics as _get_operation_statistics,
)

_client: Optional[MongoClient] = None
_db = None


def init_mongo() -> None:
    global _client, _db
    if _client is not None:
        return

    uri = settings.MONGO_URI
    db_name = settings.MONGO_DB

    try:
        _client = MongoClient(uri, serverSelectionTimeoutMS=5000)
        _client.server_info()  # 測連線
        _db = _client[db_name]
        try:
            create_timeseries_collection(_db, "operation_logs")
            create_log_indexes(_db)
            print(f"[INFO] MongoDB connected: {uri}, db={db_name}")
        except PyMongoError as e:
            # 👉 這裡不要讓整個 app 掛掉，先印警告
            print(f"[WARN] MongoDB init failed: {e}")
    except PyMongoError as e:
        # 👉 這裡不要讓整個 app 掛掉，先印警告
        print(f"[WARN] MongoDB init failed: {e}")
        _client = None
        _db = None

def get_mongo():
    global _client
    if _client is None:
        _client = MongoClient(settings.MONGO_URI)
        db = _client[settings.MONGO_DB]
        try:
            db.operation_logs.create_index(
                [("timestamp", ASCENDING)],
                name="timestamp_1",
                expireAfterSeconds=60*60*24*90,
            )
        except OperationFailure as e:
            if e.code == 85:  # IndexOptionsConflict
                print("[WARN] timestamp_1 index already exists, skip TTL creation")
            else:
                raise
    return db

def get_db():
    """提供給 service / admin 查 log 用"""
    global _db
    if _db is None:
        init_mongo()
    return _db


def close_mongo() -> None:
    global _client, _db
    if _client is not None:
        _client.close()
    _client = None
    _db = None


# === 對外提供的「記錄操作日誌」函式 ===

def log(
    action: str,
    operator_id: Optional[int],
    operator: Optional[str],
    detail: Dict[str, Any],
    user_agent: Optional[str] = None,
    timestamp: Optional[datetime] = None,
) -> None:
    """
    專案內部統一呼叫這個：

    - 不要求呼叫端提供 db
    - log 寫失敗會吞掉錯誤，不會讓主流程炸掉
    """
    try:
        db = get_db()
        _log_operation(
            db=db,
            action=action,
            operator_id=operator_id or 0,
            operator=operator or "",
            user_agent=user_agent,
            detail=detail,
            timestamp=timestamp,
        )
    except Exception as e:
        # 這裡不要 raise，避免 booking / approval 因 log 壞掉
        print(f"[WARN] Mongo log failed: {e}")


# === 給 admin 用的查詢 wrapper ===

def query_logs(
    action: Optional[str] = None,
    operator_id: Optional[int] = None,
    start: Optional[datetime] = None,
    end: Optional[datetime] = None,
    limit: int = 100,
) -> List[Dict[str, Any]]:
    db = get_db()
    return _get_operation_logs(
        db=db,
        action=action,
        operator_id=operator_id,
        start_date=start,
        end_date=end,
        limit=limit,
    )


def query_logs_by_booking(booking_id: int, limit: int = 100) -> List[Dict[str, Any]]:
    db = get_db()
    return _get_logs_by_booking_id(db, booking_id=booking_id, limit=limit)


def query_logs_by_payment(payment_id: int, limit: int = 100) -> List[Dict[str, Any]]:
    db = get_db()
    return _get_logs_by_payment_id(db, payment_id=payment_id, limit=limit)


def query_log_stats(days: int = 7, group_by_action: bool = True) -> List[Dict[str, Any]]:
    db = get_db()
    return _get_operation_statistics(db, days=days, group_by_action=group_by_action)
