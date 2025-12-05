# app/routes/admin_fund.py
from __future__ import annotations

from typing import Any, Dict, Optional

from fastapi import APIRouter, Header, HTTPException, status
from pydantic import BaseModel

from app.services import admin_fund
from app.db.mongo import log

router = APIRouter(prefix="/api/v1/admin/fund", tags=["admin-fund"])


class CreateRefundBody(BaseModel):
    payment_id: int
    amount: float
    reason: Optional[str] = None


@router.get("/payments/pending")
def get_pending_payments(
    limit: int = 100,
    offset: int = 0,
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    rows = admin_fund.list_pending_payments(limit=limit, offset=offset)

    log(
        action="SEARCH_PENDING_PAYMENT",
        operator_id=operator_id,
        operator=operator,
        detail={"limit": limit, "offset": offset, "result_count": len(rows)},
        user_agent=user_agent,
    )
    return {"data": rows}


@router.post("/payments/{payment_id}/succeed")
def mark_payment_succeeded(
    payment_id: int,
    operator_id: int,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    result = admin_fund.mark_payment_succeeded(payment_id=payment_id)

    if not result.get("success", False):
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=result,
        )

    log(
        action="UPDATE_PAYMENT_STATUS_TO_SUCCEEDED",
        operator_id=operator_id,
        operator=operator,
        detail={"payment_id": payment_id, "result": result},
        user_agent=user_agent,
    )
    return {"result": result}


@router.post("/refunds")
def create_refund(
    body: CreateRefundBody,
    operator_id: int,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    result = admin_fund.create_refund(
        payment_id=body.payment_id,
        amount=body.amount,
        reason=body.reason,
    )

    if not result.get("success", False):
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=result,
        )

    log(
        action="ADD_REFUND",
        operator_id=operator_id,
        operator=operator,
        detail={"body": body.model_dump(), "result": result},
        user_agent=user_agent,
    )
    return {"result": result}


@router.post("/refunds/{refund_id}/succeed")
def mark_refund_succeeded(
    refund_id: int,
    operator_id: int,
    operator: Optional[str] = None,
    user_agent: Optional[str] = Header(default=None, alias="User-Agent"),
) -> Dict[str, Any]:
    result = admin_fund.mark_refund_succeeded(refund_id=refund_id)

    if not result.get("success", False):
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail=result,
        )

    log(
        action="UPDATE_PAYMENT_STATUS_BY_REFUND",
        operator_id=operator_id,
        operator=operator,
        detail={"refund_id": refund_id, "result": result},
        user_agent=user_agent,
    )
    return {"result": result}
