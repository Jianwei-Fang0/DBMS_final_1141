from typing import Optional

from fastapi import APIRouter, Request, HTTPException, Query

from app.services.booking import (
    search_availability,
    create_booking,
    list_user_bookings,
    cancel_booking,
    BookingNotFoundError,
    BookingForbiddenError,
    BookingStatusError,
)

router = APIRouter(prefix="/api/v1")


# === 1. 查詢可預約場地 ===
@router.get("/venues/availability")
def get_availability(
    date: str = Query(..., description="日期 YYYY-MM-DD"),
    start: str = Query(..., description="開始時間 HH:MM"),
    end: str = Query(..., description="結束時間 HH:MM"),
    people: int = Query(1, description="人數"),
    building_id: int | None = Query(None, description="大樓 ID（可選）"),
    venue_type: str | None = Query(None, description="場地類型（可選）"),
):
    rows = search_availability(
        p_date=date,
        p_start=start,
        p_end=end,
        p_people=people,
        building_id=building_id,
        venue_type=venue_type,
    )
    return {"data": rows}



# === 2. 建立 booking（所有參數都從 query 進來） ===
@router.post("/bookings")
def post_booking(
    req: Request,
    venue_id: int = Query(..., description="場地 ID"),
    date: str = Query(..., description="日期 YYYY-MM-DD"),
    start: str = Query(..., description="開始時間 HH:MM"),
    end: str = Query(..., description="結束時間 HH:MM"),
    people: int = Query(1, description="人數"),
    user_id: int = Query(1, description="使用者 ID（簡化版 auth）"),
):
    """
    建立一筆新的預約。
    目前 user_id 先由 query param 傳入，預設為 1。
    """
    try:
        ua = req.headers.get("user-agent")
        result = create_booking(
            venue_id=venue_id,
            user_id=user_id,
            date_str=date,    
            start_time=start,  
            end_time=end,     
            people=people,
            affiliation="Internal",
            ua=ua, 
        )
        return result
    except Exception as e:
        # 409：時段衝突或其它 business constraint
        raise HTTPException(status_code=409, detail=str(e))



# === 3. 查詢自己的 booking 列表 ===
@router.get("/bookings")
def get_my_bookings(
    user_id: int = Query(1, description="使用者 ID"),
    status: Optional[str] = Query(None, description="狀態過濾：Pending/Approved/Cancelled 等"),
):
    try:
        rows = list_user_bookings(user_id=user_id, status=status)
        return {"data": rows}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


# === 4. 取消自己的 booking（只允許 Pending） ===
@router.post("/bookings/{booking_id}/cancel")
def cancel_my_booking(
    booking_id: int,
    req: Request,
    user_id: int = Query(1, description="使用者 ID"),
):
    ua = req.headers.get("user-agent")
    try:
        result = cancel_booking(
            booking_id=booking_id,
            user_id=user_id,
            user_agent=ua,
        )
        return result
    except BookingNotFoundError as e:
        raise HTTPException(status_code=404, detail=str(e))
    except BookingForbiddenError as e:
        raise HTTPException(status_code=403, detail=str(e))
    except BookingStatusError as e:
        raise HTTPException(status_code=409, detail=str(e))
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
