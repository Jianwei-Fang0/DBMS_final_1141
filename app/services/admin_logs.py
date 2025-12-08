# app/services/admin_logs.py
from datetime import datetime
from typing import Optional, List, Dict, Any

from app.db.mongo import (
    query_logs,
    query_logs_by_booking,
    query_logs_by_payment,
    query_log_stats,
)


def list_logs(
    action: Optional[str] = None,
    operator_id: Optional[int] = None,
    start: Optional[datetime] = None,
    end: Optional[datetime] = None,
    limit: int = 100,
) -> List[Dict[str, Any]]:
    return query_logs(
        action=action,
        operator_id=operator_id,
        start=start,
        end=end,
        limit=limit,
    )


def list_logs_for_booking(booking_id: int, limit: int = 100) -> List[Dict[str, Any]]:
    return query_logs_by_booking(booking_id=booking_id, limit=limit)


def list_logs_for_payment(payment_id: int, limit: int = 100) -> List[Dict[str, Any]]:
    return query_logs_by_payment(payment_id=payment_id, limit=limit)


def stats_logs(days: int = 7):
    # group_by_action=True → 回傳每個 action 的次數
    return query_log_stats(days=days, group_by_action=True)
