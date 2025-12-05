# app/services/admin_fund.py
from __future__ import annotations

from typing import Any, Dict, List, Optional

from psycopg.rows import dict_row

from app.db.postgres import get_conn


def list_pending_payments(
    limit: int = 100,
    offset: int = 0,
) -> List[Dict[str, Any]]:
    """
    SEARCH_PENDING_PAYMENT：
    列出所有 status='Pending' 的 payment，帶 booking / user 資訊。
    """
    sql = """
    SELECT
        p.payment_id,
        p.booking_id,
        p.method,
        p.amount,
        p.type,
        p.status,
        p.created_at,
        b.purpose,
        b.date,
        b.start_time,
        b.end_time,
        u.name AS applicant_name,
        v.name AS venue_name
    FROM payment p
    JOIN booking b ON p.booking_id = b.booking_id
    JOIN "user" u ON b.user_id = u.user_id
    JOIN venue v   ON b.venue_id = v.venue_id
    WHERE p.status = 'Pending'
    ORDER BY p.created_at ASC
    LIMIT %s OFFSET %s;
    """
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, (limit, offset))
        rows = cur.fetchall()
    return list(rows)


def mark_payment_succeeded(payment_id: int) -> Dict[str, Any]:
    """
    UPDATE_PAYMENT_STATUS_TO_SUCCEEDED：
    將 Pending → Succeeded
    """
    sql = """
    UPDATE payment
    SET status = 'Succeeded'
    WHERE payment_id = %s
      AND status = 'Pending'
    RETURNING payment_id, status;
    """
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, (payment_id,))
        row = cur.fetchone()
        conn.commit()

    if row is None:
        return {"success": False, "error": "payment not found or not Pending"}

    return {"success": True, "payment": dict(row)}


def create_refund(payment_id: int, amount: float, reason: Optional[str]) -> Dict[str, Any]:
    """
    ADD_REFUND：
    建立一筆 refund（status='Pending'）
    """
    sql = """
    INSERT INTO refund (payment_id, amount, reason, status)
    VALUES (%s, %s, %s, 'Pending')
    RETURNING refund_id, payment_id, amount, reason, status, created_at;
    """
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, (payment_id, amount, reason))
        row = cur.fetchone()
        conn.commit()

    if row is None:
        return {"success": False, "error": "failed to create refund"}

    return {"success": True, "refund": dict(row)}


def mark_refund_succeeded(refund_id: int) -> Dict[str, Any]:
    """
    UPDATE_PAYMENT_STATUS_BY_REFUND：
    - refund.status: Pending → Succeeded
    - payment.status: Pending / Succeeded → Refunded
    """
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        try:
            cur.execute("BEGIN")
            # 1) 先把 REFUND 標成 Succeeded，拿出對應 payment_id
            cur.execute(
                """
                UPDATE refund
                SET status = 'Succeeded'
                WHERE refund_id = %s
                  AND status = 'Pending'
                RETURNING refund_id, payment_id, amount, status;
                """,
                (refund_id,),
            )
            row = cur.fetchone()
            if row is None:
                conn.rollback()
                return {
                    "success": False,
                    "error": "refund not found or not Pending",
                }

            refund = dict(row)
            payment_id = refund["payment_id"]

            # 2) 對應的 PAYMENT 改成 Refunded
            cur.execute(
                """
                UPDATE payment
                SET status = 'Refunded'
                WHERE payment_id = %s
                  AND status IN ('Pending','Succeeded')
                RETURNING payment_id, status;
                """,
                (payment_id,),
            )
            prow = cur.fetchone()
            if prow is None:
                # 如果 payment 沒改成功，就 rollback（維持一致性）
                conn.rollback()
                return {
                    "success": False,
                    "error": "payment not found or status not Pending/Succeeded",
                }

            payment = dict(prow)
            conn.commit()
            return {
                "success": True,
                "refund": refund,
                "payment": payment,
            }
        except Exception as e:
            conn.rollback()
            return {"success": False, "error": str(e)}
