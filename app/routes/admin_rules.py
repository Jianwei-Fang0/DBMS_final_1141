# app/routes/admin_rules.py
from __future__ import annotations

from datetime import date
from typing import Any, Dict, Optional

from fastapi import APIRouter, Header, Query

from app.services import admin_rules
from app.db.mongo import log

router = APIRouter(prefix="/api/v1/admin/rules", tags=["admin-rules"])


# === Timeslot Rule ===

@router.get("/timeslot")
def get_timeslot_rules(
    venue_id: Optional[int] = Query(default=None),
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    rows = admin_rules.list_timeslot_rules(venue_id=venue_id)

    log(
        action="SEARCH_TIMESLOT_RULE",
        operator_id=operator_id,
        operator=operator,
        detail={
            "venue_id": venue_id,
            "result_count": len(rows),
        },
        user_agent=user_agent,
    )
    return {"data": rows}


# === Blocked Slot ===

@router.get("/blocked")
def get_blocked_slots(
    venue_id: Optional[int] = Query(default=None),
    date_from: Optional[date] = Query(default=None),
    date_to: Optional[date] = Query(default=None),
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    rows = admin_rules.list_blocked_slots(
        venue_id=venue_id,
        date_from=date_from,
        date_to=date_to,
    )

    log(
        action="SEARCH_BLOCKED_SLOT",
        operator_id=operator_id,
        operator=operator,
        detail={
            "venue_id": venue_id,
            "date_from": str(date_from) if date_from else None,
            "date_to": str(date_to) if date_to else None,
            "result_count": len(rows),
        },
        user_agent=user_agent,
    )
    return {"data": rows}


# === Rate Plan ===

@router.get("/rate-plans")
def get_rate_plans(
    venue_id: Optional[int] = Query(default=None),
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    rows = admin_rules.list_rate_plans(venue_id=venue_id)

    log(
        action="SEARCH_RATE_PLAN",
        operator_id=operator_id,
        operator=operator,
        detail={
            "venue_id": venue_id,
            "result_count": len(rows),
        },
        user_agent=user_agent,
    )
    return {"data": rows}


# === Price Rule ===

@router.get("/price-rules")
def get_price_rules(
    plan_id: Optional[int] = Query(default=None),
    version_id: Optional[int] = Query(default=None),
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    rows = admin_rules.list_price_rules(
        plan_id=plan_id,
        version_id=version_id,
    )

    log(
        action="SEARCH_PRICE_RULE",
        operator_id=operator_id,
        operator=operator,
        detail={
            "plan_id": plan_id,
            "version_id": version_id,
            "result_count": len(rows),
        },
        user_agent=user_agent,
    )
    return {"data": rows}


# === Venue Equip ===

@router.get("/venue-equip")
def get_venue_equip(
    venue_id: Optional[int] = Query(default=None),
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    rows = admin_rules.list_venue_equip(venue_id=venue_id)

    log(
        action="SEARCH_VENUE_EQUIP",
        operator_id=operator_id,
        operator=operator,
        detail={
            "venue_id": venue_id,
            "result_count": len(rows),
        },
        user_agent=user_agent,
    )
    return {"data": rows}
