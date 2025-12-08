from __future__ import annotations

from datetime import date, time
from typing import Optional, Any, Dict

from fastapi import APIRouter, HTTPException, Header, status
from pydantic import BaseModel

from app.services import admin_booking

router = APIRouter(prefix="/api/v1/admin/bookings", tags=["admin-bookings"])


# ==== 共用 Request Body ====


class ApproveBody(BaseModel):
    step: int = 1
    comment: Optional[str] = None
    final: bool = True  # 多關卡時只有最後一關傳 True


class RejectBody(BaseModel):
    step: int = 1
    comment: Optional[str] = None


class RequestChangesBody(BaseModel):
    step: int = 1
    comment: str = "請補件"


class ModifyBookingBody(BaseModel):
    new_date: date
    new_start_time: time
    new_end_time: time
    new_venue_id: Optional[int] = None
    new_people: Optional[int] = None

# ==== 1. 管理員總覽 ====


@router.get("/overview")
def get_booking_overview(
    limit: int = 100,
    offset: int = 0,
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    rows = admin_booking.list_booking_overview(limit=limit, offset=offset)

    return {"data": rows}

# ==== 2. 待審清單 ====


@router.get("/pending")
def get_pending_bookings(
    limit: int = 50,
    offset: int = 0,
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    rows = admin_booking.list_pending_bookings(limit=limit, offset=offset)

    return {"data": rows}


# ==== 2-1. 訂單預覽（分頁） ====


@router.get("/preview")
def get_booking_preview(
    page: int = 1,
    limit: int = 20,
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    result = admin_booking.get_booking_preview(
        page=page,
        limit=limit,
        operator_id=operator_id,
        operator=operator,
        user_agent=user_agent,
    )
    return result

@router.get("/preview/date")
def get_booking_preview_by_date(
    days: int = 7,
    page: int = 1,
    limit: int = 20,
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    """
    查詢從今天開始算指定天數內的訂單預覽列表
    
    Args:
        days: 從今天開始算的天數（預設7天）
        page: 頁碼（預設1）
        limit: 每頁筆數（預設20）
    """
    result = admin_booking.get_booking_preview_by_date(
        days=days,
        page=page,
        limit=limit,
        operator_id=operator_id,
        operator=operator,
        user_agent=user_agent,
    )
    return result

# ==== 3. 單筆詳情 ====


@router.get("/{booking_id}")
def get_booking_detail(
    booking_id: int,
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    row = admin_booking.get_booking_detail(
        booking_id=booking_id,
        operator_id=operator_id,
        operator=operator,
        user_agent=user_agent,
    )
    if row is None:
        raise HTTPException(status_code=404, detail="Booking not found")

    return {"data": row}


# ==== 4. 審核歷史 ====


@router.get("/{booking_id}/history")
def get_booking_history(
    booking_id: int,
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    rows = admin_booking.get_booking_history(booking_id)

    return {"data": rows}


# ==== 5. 綜合審核檢查（不改資料，只看風險） ====


@router.get("/{booking_id}/check")
def check_booking(
    booking_id: int,
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    row = admin_booking.check_booking(booking_id)
    if row is None:
        raise HTTPException(
            status_code=404,
            detail="Booking not found or not pending",
        )

    return {"data": row}


# ==== 6. 核准 ====


@router.post("/{booking_id}/approve")
def approve_booking(
    booking_id: int,
    body: ApproveBody,
    operator_id: int,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    result = admin_booking.approve_booking(
        booking_id=booking_id,
        approver_id=operator_id,
        step=body.step,
        comment=body.comment,
        final=body.final,
    )

    if not result.get("success", False):
        raw_error = str(result.get("error", "") or "")
        lower = raw_error.lower()

        status_code = status.HTTP_400_BAD_REQUEST
        code = "APPROVE_FAILED"

        if "conflict with existing bookings" in lower:
            status_code = status.HTTP_409_CONFLICT
            code = "BOOKING_CONFLICT"
        elif "slot race" in lower:
            status_code = status.HTTP_409_CONFLICT
            code = "SLOT_RACE"
        elif "status must be pending" in lower:
            status_code = status.HTTP_400_BAD_REQUEST
            code = "ILLEGAL_STATUS"

        raise HTTPException(
            status_code=status_code,
            detail={
                "code": code,
                "error": raw_error,
            },
        )

    return {"result": result}


# ==== 7. 駁回 ====


@router.post("/{booking_id}/reject")
def reject_booking(
    booking_id: int,
    body: RejectBody,
    operator_id: int,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    result = admin_booking.reject_booking(
        booking_id=booking_id,
        approver_id=operator_id,
        step=body.step,
        comment=body.comment,
    )

    if not result.get("success", False):
        raise HTTPException(status_code=400, detail=result)

    return {"result": result}


# ==== 8. 要求補件 / 調整 ====


@router.post("/{booking_id}/request-changes")
def request_changes(
    booking_id: int,
    body: RequestChangesBody,
    operator_id: int,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    result = admin_booking.request_changes(
        booking_id=booking_id,
        approver_id=operator_id,
        step=body.step,
        comment=body.comment,
    )

    if not result.get("success", False):
        raise HTTPException(status_code=400, detail=result)

    return {"result": result}


# ==== 9. 訂單異動（Admin 幫忙改期 / 改場地） ====


@router.post("/{booking_id}/modify")
def modify_booking_endpoint(
    booking_id: int,
    body: ModifyBookingBody,
    operator_id: int,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    result = admin_booking.modify_booking(
        booking_id=booking_id,
        new_date=body.new_date,
        new_start_time=body.new_start_time,
        new_end_time=body.new_end_time,
        new_venue_id=body.new_venue_id,
        new_people=body.new_people,
    )

    if not result.get("success", False):
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={
                "code": "MODIFY_FAILED",
                "error": str(result.get("error", "")),
            },
        )

    return {"result": result}



