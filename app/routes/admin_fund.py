# app/routes/admin_fund.py
from __future__ import annotations

from typing import Any, Dict, Optional

from fastapi import APIRouter, Header, HTTPException, status
from pydantic import BaseModel

from app.services import admin_fund

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

    return {"result": result}
