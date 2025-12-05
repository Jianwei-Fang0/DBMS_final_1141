# app/services/admin_booking.py
from __future__ import annotations

from typing import Any, Dict, List, Optional

from psycopg.rows import dict_row

from app.db.postgres import get_conn

from datetime import date, time

# === 1. 待審清單 ===
def list_pending_bookings(
    limit: int = 50,
    offset: int = 0,
) -> List[Dict[str, Any]]:
    """
    對應 approval_queries.sql 的 SEARCH_PENDING + 加上場地/申請人名稱。
    """
    sql = """
    SELECT
      b.booking_id,
      b.purpose,
      b.date,
      b.start_time,
      b.end_time,
      b.people,
      b.amount_est,
      b.deposit,
      b.status,
      b.created_at,
      u.name AS applicant_name,
      v.name AS venue_name
    FROM booking b
    JOIN "user" u ON b.user_id = u.user_id
    JOIN venue   v ON b.venue_id = v.venue_id
    WHERE b.status = 'Pending'
    ORDER BY b.created_at ASC
    LIMIT %s OFFSET %s;
    """
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, (limit, offset))
        rows = cur.fetchall()
    return list(rows)


# === 2. 單筆詳情 ===
def get_booking_detail(booking_id: int) -> Optional[Dict[str, Any]]:
    """
    對應 SEARCH_PENDING_DETAIL，但不限於 Pending（admin 也可看歷史）
    """
    sql = """
    SELECT
      b.booking_id,
      b.purpose,
      b.date,
      b.start_time,
      b.end_time,
      b.people,
      b.amount_est,
      b.deposit,
      b.status,
      b.created_at AS booking_created_at,
      u.name  AS applicant_name,
      u.email AS applicant_email,
      u.phone AS applicant_phone,
      o.name  AS org_name,
      v.name  AS venue_name,
      v.type  AS venue_type,
      v.capacity AS venue_capacity,
      bd.name AS building_name
    FROM booking b
    JOIN "user"   u  ON b.user_id = u.user_id
    LEFT JOIN org o  ON b.org_id = o.org_id
    JOIN venue    v  ON b.venue_id = v.venue_id
    JOIN building bd ON v.building_id = bd.building_id
    WHERE b.booking_id = %s;
    """
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, (booking_id,))
        row = cur.fetchone()
    return dict(row) if row is not None else None


# === 3. 審核歷史 ===
def get_booking_history(booking_id: int) -> List[Dict[str, Any]]:
    """
    對應 SEARCH_PENDING_HISTORY：查 APPROVAL 列表
    """
    sql = """
    SELECT
      a.approval_id,
      a.step,
      a.decision,
      a.comment,
      a.decided_at,
      u.name AS approver_name
    FROM approval a
    JOIN "user" u ON a.approver_id = u.user_id
    WHERE a.booking_id = %s
    ORDER BY a.step ASC, a.decided_at ASC;
    """
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, (booking_id,))
        rows = cur.fetchall()
    return list(rows)


# === 4. 核准 / 駁回 / 要求修改 ===

def approve_booking(
    booking_id: int,
    approver_id: int,
    step: int = 1,
    comment: Optional[str] = None,
    final: bool = True,
) -> Dict[str, Any]:
    """
    呼叫 plpgsql: approve_booking(p_booking_id, p_approver_id, p_step, p_comment, p_final)
    回傳 JSON → Python dict
    """
    sql = "SELECT approve_booking(%s, %s, %s, %s, %s);"
    params = (booking_id, approver_id, step, comment, final)

    with get_conn() as conn, conn.cursor() as cur:
        cur.execute(sql, params)
        row = cur.fetchone()
        conn.commit()

    if row is None:
        # 理論上不會發生，保護一下
        return {"success": False, "error": "approve_booking returned no result"}

    # psycopg 會把 json 型別 decode 成 Python dict/list
    result = row[0]
    return result


def reject_booking(
    booking_id: int,
    approver_id: int,
    step: int = 1,
    comment: Optional[str] = None,
) -> Dict[str, Any]:
    """
    呼叫 plpgsql: reject_booking(p_booking_id, p_approver_id, p_step, p_comment)
    """
    sql = "SELECT reject_booking(%s, %s, %s, %s);"
    params = (booking_id, approver_id, step, comment)

    with get_conn() as conn, conn.cursor() as cur:
        cur.execute(sql, params)
        row = cur.fetchone()
        conn.commit()

    if row is None:
        return {"success": False, "error": "reject_booking returned no result"}

    result = row[0]
    return result


def request_changes(
    booking_id: int,
    approver_id: int,
    step: int = 1,
    comment: str = "請補件",
) -> Dict[str, Any]:
    """
    呼叫 plpgsql: request_changes(p_booking_id, p_approver_id, p_step, p_comment)
    """
    sql = "SELECT request_changes(%s, %s, %s, %s);"
    params = (booking_id, approver_id, step, comment)

    with get_conn() as conn, conn.cursor() as cur:
        cur.execute(sql, params)
        row = cur.fetchone()
        conn.commit()

    if row is None:
        return {"success": False, "error": "request_changes returned no result"}

    result = row[0]
    return result

# === 5. 綜合審核檢查（COMPREHENSIVE_APPROVAL_CHECK） ===

def check_booking(booking_id: int) -> Optional[Dict[str, Any]]:
    """
    對應 approval_queries.sql 裡的 COMPREHENSIVE_APPROVAL_CHECK，
    以 booking_id 切片檢查：帳號凍結 / 超容 / 場地關閉 / 與其他訂單衝突 / 與封館衝突。
    僅針對 status = 'Pending' 的訂單。
    """
    sql = """
    WITH slot_len AS (
      SELECT COALESCE((
        SELECT tr.slot_minute
        FROM TIMESLOT_RULE tr
        WHERE tr.venue_id = b.venue_id
          AND tr.weekday = EXTRACT(DOW FROM b.date)
        LIMIT 1
      ), 30)::int AS m
      FROM BOOKING b WHERE b.booking_id = %s
    ),
    req AS (
      SELECT
        b.booking_id, b.venue_id,
        generate_series(
          (b.date || ' ' || b.start_time)::timestamp,
          (b.date || ' ' || b.end_time)::timestamp - (m || ' minutes')::interval,
          (m || ' minutes')::interval
        ) AS slot_start
      FROM BOOKING b, slot_len
      WHERE b.booking_id = %s
    )
    SELECT
      b.booking_id, b.purpose, b.date, b.start_time, b.end_time,
      u.name AS applicant_name, v.name AS venue_name,
      CASE WHEN u.status = 'Frozen' THEN '⚠ 帳號已凍結' ELSE '✓' END AS user_status_check,
      CASE WHEN b.people > v.capacity THEN '⚠ 超容' ELSE '✓' END AS capacity_check,
      CASE WHEN v.open_status = 'Off' THEN '⚠ 場地關閉' ELSE '✓' END AS venue_status_check,
      CASE WHEN EXISTS (
        SELECT 1 FROM BOOKING_SLOT s
        JOIN BOOKING ob ON ob.booking_id = s.booking_id
        WHERE s.venue_id = b.venue_id
          AND ob.status IN ('Approved','PendingPayment')
          AND ob.booking_id <> b.booking_id
          AND s.slot_start IN (SELECT slot_start FROM req)
      ) THEN '⚠ 與已核准/保留衝突' ELSE '✓' END AS conflict_with_bookings,
      CASE WHEN EXISTS (
        SELECT 1 FROM v_blocked_slot_slots x
        WHERE x.venue_id = b.venue_id
          AND x.slot_start IN (SELECT slot_start FROM req)
      ) THEN '⚠ 與封館衝突' ELSE '✓' END AS conflict_with_blocked
    FROM BOOKING b
    JOIN "user" u ON b.user_id = u.user_id
    JOIN VENUE   v ON b.venue_id = v.venue_id
    WHERE b.booking_id = %s
      AND b.status = 'Pending';
    """
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, (booking_id, booking_id, booking_id))
        row = cur.fetchone()
    return dict(row) if row is not None else None


# === 6. 訂單異動（modify_booking） ===

def modify_booking(
    booking_id: int,
    new_date: date,
    new_start_time: time,
    new_end_time: time,
    new_venue_id: Optional[int] = None,
    new_people: Optional[int] = None,
) -> Dict[str, Any]:
    """
    呼叫 booking_modification.sql 裡的 modify_booking(...)，
    回傳 JSON → Python dict。
    """
    sql = "SELECT modify_booking(%s, %s, %s, %s, %s, %s);"
    params = (
        booking_id,
        new_date,
        new_start_time,
        new_end_time,
        new_venue_id,
        new_people,
    )
    with get_conn() as conn, conn.cursor() as cur:
        cur.execute(sql, params)
        row = cur.fetchone()
        conn.commit()

    if row is None:
        return {"success": False, "error": "modify_booking returned no result"}

    result = row[0]
    return result


# === 7. 管理員總覽（SEARCH_ALL_BOOKING_PROCESS） ===

def list_booking_overview(
    limit: int = 100,
    offset: int = 0,
) -> List[Dict[str, Any]]:
    """
    對應 approval_queries.sql 的 SEARCH_ALL_BOOKING_PROCESS：
    依 booking 狀態 + 最後一次審核結果，給管理員 overview。
    """
    sql = """
    SELECT
      b.booking_id, b.purpose, b.date, b.status,
      u.name AS applicant_name, v.name AS venue_name,
      a.decision AS last_decision, a.decided_at AS last_decision_time
    FROM BOOKING b
    JOIN "user" u ON b.user_id = u.user_id
    JOIN VENUE   v ON b.venue_id = v.venue_id
    LEFT JOIN LATERAL (
      SELECT decision, decided_at
      FROM APPROVAL
      WHERE booking_id = b.booking_id
      ORDER BY decided_at DESC
      LIMIT 1
    ) a ON true
    WHERE b.status IN ('Pending','Approved','Rejected','Draft')
    ORDER BY b.created_at DESC
    LIMIT %s OFFSET %s;
    """
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, (limit, offset))
        rows = cur.fetchall()
    return list(rows)