# app/routes/admin_logs.py
from datetime import datetime
from typing import Optional

from fastapi import APIRouter

from app.services import admin_logs

router = APIRouter(prefix="/api/v1/admin/logs", tags=["admin-logs"])


@router.get("")
def get_logs(
    action: Optional[str] = None,
    operator_id: Optional[int] = None,
    start: Optional[datetime] = None,
    end: Optional[datetime] = None,
    limit: int = 100,
):
    logs = admin_logs.list_logs(
        action=action,
        operator_id=operator_id,
        start=start,
        end=end,
        limit=limit,
    )
    # ObjectId 不能直接 JSON，要轉成字串
    for doc in logs:
        if "_id" in doc:
            doc["_id"] = str(doc["_id"])
    return {"data": logs}


@router.get("/booking/{booking_id}")
def get_logs_by_booking(booking_id: int, limit: int = 100):
    logs = admin_logs.list_logs_for_booking(booking_id=booking_id, limit=limit)
    for doc in logs:
        if "_id" in doc:
            doc["_id"] = str(doc["_id"])
    return {"data": logs}


@router.get("/payment/{payment_id}")
def get_logs_by_payment(payment_id: int, limit: int = 100):
    logs = admin_logs.list_logs_for_payment(payment_id=payment_id, limit=limit)
    for doc in logs:
        if "_id" in doc:
            doc["_id"] = str(doc["_id"])
    return {"data": logs}


@router.get("/stats")
def get_log_stats(days: int = 7):
    stats = admin_logs.stats_logs(days=days)
    return {"data": stats}
