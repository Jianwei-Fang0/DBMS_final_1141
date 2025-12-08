# app/routes/admin_blacklist.py
from __future__ import annotations

from typing import Any, Dict, Optional

from fastapi import APIRouter, Header, HTTPException, status

from app.services import admin_blacklist
from app.db.mongo import log

router = APIRouter(prefix="/api/v1/admin/blacklist", tags=["admin-blacklist"])


@router.get("")
def get_blacklist(
    limit: int = 100,
    offset: int = 0,
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    rows = admin_blacklist.list_blacklist(limit=limit, offset=offset)

    log(
        action="SEARCH_ALL_BLACKLIST",
        operator_id=operator_id,
        operator=operator,
        detail={"limit": limit, "offset": offset, "result_count": len(rows)},
        user_agent=user_agent,
    )
    return {"data": rows}


@router.post("/{user_id}")
def add_to_blacklist(
    user_id: int,
    operator_id: int,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    result = admin_blacklist.add_blacklist(user_id=user_id)

    if not result.get("success", False):
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=result,
        )

    log(
        action="ADD_BLACKLIST",
        operator_id=operator_id,
        operator=operator,
        detail={"user_id": user_id, "result": result},
        user_agent=user_agent,
    )
    return {"result": result}


@router.delete("/{user_id}")
def remove_from_blacklist(
    user_id: int,
    operator_id: int,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    result = admin_blacklist.remove_blacklist(user_id=user_id)

    if not result.get("success", False):
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=result,
        )

    log(
        action="DELETE_BLACKLIST",
        operator_id=operator_id,
        operator=operator,
        detail={"user_id": user_id, "result": result},
        user_agent=user_agent,
    )
    return {"result": result}
