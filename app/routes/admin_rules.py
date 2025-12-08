# app/routes/admin_rules.py
from __future__ import annotations

from datetime import date
from typing import Any, Dict, Optional

from fastapi import APIRouter, Header, Query

from app.services import admin_rules

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

    return {"data": rows}
