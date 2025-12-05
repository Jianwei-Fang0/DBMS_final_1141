# app/services/admin_blacklist.py
from __future__ import annotations

from typing import Any, Dict, List

from psycopg.rows import dict_row

from app.db.postgres import get_conn


def list_blacklist(limit: int = 100, offset: int = 0) -> List[Dict[str, Any]]:
    """
    SEARCH_ALL_BLACKLIST
    """
    sql = """
    SELECT
        u.user_id,
        u.name       AS user_name,
        u.email,
        o.name       AS org_name,
        u.status,
        u.created_at
    FROM "user" u
    LEFT JOIN org o ON u.org_id = o.org_id
    WHERE u.status = 'Frozen'
    ORDER BY u.created_at DESC
    LIMIT %s OFFSET %s;
    """
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, (limit, offset))
        rows = cur.fetchall()
    return list(rows)


def add_blacklist(user_id: int) -> Dict[str, Any]:
    """
    ADD_BLACKLIST：將 user.status 設為 Frozen
    """
    sql = """
    UPDATE "user"
    SET status = 'Frozen'
    WHERE user_id = %s
    RETURNING user_id, status;
    """
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, (user_id,))
        row = cur.fetchone()
        conn.commit()

    if row is None:
        return {"success": False, "error": "user not found"}

    return {"success": True, "user": dict(row)}


def remove_blacklist(user_id: int) -> Dict[str, Any]:
    """
    DELETE_BLACKLIST：將 user.status 改回 Active
    """
    sql = """
    UPDATE "user"
    SET status = 'Active'
    WHERE user_id = %s
    RETURNING user_id, status;
    """
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, (user_id,))
        row = cur.fetchone()
        conn.commit()

    if row is None:
        return {"success": False, "error": "user not found"}

    return {"success": True, "user": dict(row)}
