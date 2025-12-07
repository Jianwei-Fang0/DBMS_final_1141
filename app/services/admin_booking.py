# app/services/admin_booking.py
from __future__ import annotations

from typing import Any, Dict, List, Optional

from psycopg.rows import dict_row

from app.db.postgres import get_conn
from app.db.mongo import log

from datetime import date, time

# === 1. 待審清單 ===
def list_pending_bookings(
    limit: int = 50,
    offset: int = 0,
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = None,
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
    
    result = list(rows)
    
    # 記錄查詢日誌
    log(
        action="SEARCH_PENDING",
        operator_id=operator_id,
        operator=operator,
        detail={
            "limit": limit,
            "offset": offset,
            "result_count": len(result),
        },
        user_agent=user_agent,
    )
    
    return result


# === 2. 單筆詳情 ===
def get_booking_preview(
    page: int = 1,
    limit: int = 20,
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = None,
) -> Dict[str, Any]:
    """
    取得訂單預覽列表，支援分頁（每頁20筆）
    """
    offset = (page - 1) * limit
    
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
      bd.name AS building_name,
      COALESCE(ARRAY_AGG(ur.role) FILTER (WHERE ur.role IS NOT NULL), ARRAY[]::VARCHAR[]) AS user_roles
    FROM booking b
    JOIN "user"   u  ON b.user_id = u.user_id
    LEFT JOIN user_role ur ON u.user_id = ur.user_id
    LEFT JOIN org o  ON u.org_id = o.org_id
    JOIN venue    v  ON b.venue_id = v.venue_id
    JOIN building bd ON v.building_id = bd.building_id
    GROUP BY b.booking_id, b.purpose, b.date, b.start_time, b.end_time, 
             b.people, b.amount_est, b.deposit, b.status, b.created_at,
             u.name, u.email, u.phone, o.name, v.name, v.type, bd.name
    ORDER BY b.created_at DESC
    LIMIT %s OFFSET %s;
    """
    
    # 計算總數
    count_sql = """
    SELECT COUNT(*) as total
    FROM booking b;
    """
    
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, (limit, offset))
        rows = cur.fetchall()
        
        cur.execute(count_sql)
        total_row = cur.fetchone()
        total = total_row['total'] if total_row else 0
    
    result = list(rows)
    total_pages = (total + limit - 1) // limit if total > 0 else 1
    
    # 記錄查詢日誌
    log(
        action="SEARCH_BOOKING_PREVIEW",
        operator_id=operator_id,
        operator=operator,
        detail={
            "page": page,
            "limit": limit,
            "result_count": len(result),
            "total": total,
            "total_pages": total_pages,
        },
        user_agent=user_agent,
    )
    
    return {
        "data": result,
        "pagination": {
            "page": page,
            "limit": limit,
            "total": total,
            "total_pages": total_pages,
        }
    }


def get_booking_detail(
    booking_id: int,
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = None,
) -> Optional[Dict[str, Any]]:
    """
    對應 SEARCH_PENDING_DETAIL，但不限於 Pending（admin 也可看歷史）
    包含 user 的 phone, email, org_name，並 join user_role 和 org
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
      bd.name AS building_name,
      COALESCE(ARRAY_AGG(ur.role) FILTER (WHERE ur.role IS NOT NULL), ARRAY[]::VARCHAR[]) AS user_roles
    FROM booking b
    JOIN "user"   u  ON b.user_id = u.user_id
    LEFT JOIN user_role ur ON u.user_id = ur.user_id
    LEFT JOIN org o  ON u.org_id = o.org_id
    JOIN venue    v  ON b.venue_id = v.venue_id
    JOIN building bd ON v.building_id = bd.building_id
    WHERE b.booking_id = %s
    GROUP BY b.booking_id, b.purpose, b.date, b.start_time, b.end_time, 
             b.people, b.amount_est, b.deposit, b.status, b.created_at,
             u.name, u.email, u.phone, o.name, v.name, v.type, v.capacity, bd.name;
    """
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, (booking_id,))
        row = cur.fetchone()
    
    result = dict(row) if row is not None else None
    
    # 記錄查詢日誌
    log(
        action="SEARCH_PENDING_DETAIL",
        operator_id=operator_id,
        operator=operator,
        detail={"booking_id": booking_id},
        user_agent=user_agent,
    )
    
    return result


# === 3. 審核歷史 ===
def get_booking_history(
    booking_id: int,
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = None,
) -> List[Dict[str, Any]]:
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
    
    result = list(rows)
    
    # 記錄查詢日誌
    log(
        action="SEARCH_PENDING_HISTORY",
        operator_id=operator_id,
        operator=operator,
        detail={"booking_id": booking_id, "result_count": len(result)},
        user_agent=user_agent,
    )
    
    return result


# === 4. 核准 / 駁回 / 要求修改 ===

def approve_booking(
    booking_id: int,
    approver_id: int,
    step: int = 1,
    comment: Optional[str] = None,
    final: bool = True,
    operator: Optional[str] = None,
    user_agent: Optional[str] = None,
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
    
    # 記錄操作日誌（只在成功時記錄）
    if result.get("success", False):
        log(
            action="APPROVE_PENDING",
            operator_id=approver_id,
            operator=operator,
            detail={
                "booking_id": booking_id,
                "step": step,
                "final": final,
                "comment": comment,
                "result": result,
            },
            user_agent=user_agent,
        )
    
    return result


def reject_booking(
    booking_id: int,
    approver_id: int,
    step: int = 1,
    comment: Optional[str] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = None,
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
    
    # 記錄操作日誌（只在成功時記錄）
    if result.get("success", False):
        log(
            action="REJECT_PENDING",
            operator_id=approver_id,
            operator=operator,
            detail={
                "booking_id": booking_id,
                "step": step,
                "comment": comment,
                "result": result,
            },
            user_agent=user_agent,
        )
    
    return result


def request_changes(
    booking_id: int,
    approver_id: int,
    step: int = 1,
    comment: str = "請補件",
    operator: Optional[str] = None,
    user_agent: Optional[str] = None,
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
    
    # 記錄操作日誌（只在成功時記錄）
    if result.get("success", False):
        log(
            action="REQUEST_CHANGES",
            operator_id=approver_id,
            operator=operator,
            detail={
                "booking_id": booking_id,
                "step": step,
                "comment": comment,
                "result": result,
            },
            user_agent=user_agent,
        )
    
    return result

# === 5. 綜合審核檢查（COMPREHENSIVE_APPROVAL_CHECK） ===

def check_booking(
    booking_id: int,
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = None,
) -> Optional[Dict[str, Any]]:
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
    
    result = dict(row) if row is not None else None
    
    # 記錄查詢日誌
    if result:
        log(
            action="COMPREHENSIVE_APPROVAL_CHECK",
            operator_id=operator_id,
            operator=operator,
            detail={"booking_id": booking_id, "result": result},
            user_agent=user_agent,
        )
    
    return result


# === 6. 訂單異動（modify_booking） ===

def modify_booking(
    booking_id: int,
    new_date: date,
    new_start_time: time,
    new_end_time: time,
    new_venue_id: Optional[int] = None,
    new_people: Optional[int] = None,
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = None,
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
    
    # 記錄操作日誌（只在成功時記錄）
    if result.get("success", False):
        log(
            action="BOOKING_MODIFY_FULL_FLOW",
            operator_id=operator_id,
            operator=operator,
            detail={
                "booking_id": booking_id,
                "new_date": str(new_date),
                "new_start_time": str(new_start_time),
                "new_end_time": str(new_end_time),
                "new_venue_id": new_venue_id,
                "new_people": new_people,
                "result": result,
            },
            user_agent=user_agent,
        )
    
    return result


# === 7. 管理員總覽（SEARCH_ALL_BOOKING_PROCESS） ===

def list_booking_overview(
    limit: int = 100,
    offset: int = 0,
    operator_id: Optional[int] = None,
    operator: Optional[str] = None,
    user_agent: Optional[str] = None,
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
    
    result = list(rows)
    
    # 記錄查詢日誌
    log(
        action="SEARCH_ALL_BOOKING_PROCESS",
        operator_id=operator_id,
        operator=operator,
        detail={
            "limit": limit,
            "offset": offset,
            "result_count": len(result),
        },
        user_agent=user_agent,
    )
    
    return result