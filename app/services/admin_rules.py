# app/services/admin_rules.py
from __future__ import annotations

from datetime import date
from typing import Any, Dict, List, Optional

from psycopg.rows import dict_row

from app.db.postgres import get_conn


# === 1. Timeslot Rule ===

def list_timeslot_rules(
    venue_id: Optional[int] = None,
) -> List[Dict[str, Any]]:
    """
    查場地時段規則：
    - 若給 venue_id → 該場地
    - 若沒給 → 全部場地
    """
    if venue_id is None:
        sql = """
        SELECT 
            tr.rule_id,
            tr.venue_id,
            v.name AS venue_name,
            CASE tr.weekday
                WHEN 0 THEN '週日'
                WHEN 1 THEN '週一'
                WHEN 2 THEN '週二'
                WHEN 3 THEN '週三'
                WHEN 4 THEN '週四'
                WHEN 5 THEN '週五'
                WHEN 6 THEN '週六'
            END AS weekday_name,
            tr.weekday,
            tr.open_time,
            tr.close_time,
            tr.slot_minute
        FROM timeslot_rule tr
        JOIN venue v ON tr.venue_id = v.venue_id
        ORDER BY tr.venue_id, tr.weekday, tr.open_time;
        """
        params: tuple[()] = ()
    else:
        sql = """
        SELECT 
            tr.rule_id,
            tr.venue_id,
            v.name AS venue_name,
            CASE tr.weekday
                WHEN 0 THEN '週日'
                WHEN 1 THEN '週一'
                WHEN 2 THEN '週二'
                WHEN 3 THEN '週三'
                WHEN 4 THEN '週四'
                WHEN 5 THEN '週五'
                WHEN 6 THEN '週六'
            END AS weekday_name,
            tr.weekday,
            tr.open_time,
            tr.close_time,
            tr.slot_minute
        FROM timeslot_rule tr
        JOIN venue v ON tr.venue_id = v.venue_id
        WHERE tr.venue_id = %s
        ORDER BY tr.weekday, tr.open_time;
        """
        params = (venue_id,)

    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, params)
        rows = cur.fetchall()
    return list(rows)


# === 2. Blocked Slot ===

def list_blocked_slots(
    venue_id: Optional[int] = None,
    date_from: Optional[date] = None,
    date_to: Optional[date] = None,
) -> List[Dict[str, Any]]:
    """
    查臨時阻擋：
    - 可選 venue_id
    - 可選日期區間
    """
    base = """
    SELECT 
        bs.block_id,
        bs.venue_id,
        v.name AS venue_name,
        bs.date,
        bs.start_time,
        bs.end_time,
        bs.reason,
        CASE 
            WHEN bs.date < CURRENT_DATE THEN '已過期'
            WHEN bs.date = CURRENT_DATE AND bs.end_time < CURRENT_TIME THEN '今日已過期'
            ELSE '有效'
        END AS status
    FROM blocked_slot bs
    JOIN venue v ON bs.venue_id = v.venue_id
    """
    where_clauses = []
    params: list[Any] = []

    if venue_id is not None:
        where_clauses.append("bs.venue_id = %s")
        params.append(venue_id)
    if date_from is not None:
        where_clauses.append("bs.date >= %s")
        params.append(date_from)
    if date_to is not None:
        where_clauses.append("bs.date <= %s")
        params.append(date_to)

    if where_clauses:
        base += " WHERE " + " AND ".join(where_clauses)

    base += " ORDER BY bs.date DESC, bs.start_time;"

    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(base, tuple(params))
        rows = cur.fetchall()
    return list(rows)


# === 3. Rate Plan / Price Rule ===

def list_rate_plans(
    venue_id: Optional[int] = None,
) -> List[Dict[str, Any]]:
    """
    查費率方案與版本數摘要。
    """
    sql = """
    SELECT 
        rp.plan_id,
        rp.venue_id,
        v.name AS venue_name,
        rp.name AS plan_name,
        rp.status,
        MIN(rv.effective_from) AS first_effective_from,
        MAX(rv.effective_to)   AS last_effective_to,
        COUNT(DISTINCT rv.version_id) AS version_count
    FROM rate_plan rp
    JOIN venue v ON rp.venue_id = v.venue_id
    LEFT JOIN rate_version rv ON rv.plan_id = rp.plan_id
    {where}
    GROUP BY rp.plan_id, rp.venue_id, v.name, rp.name, rp.status
    ORDER BY rp.venue_id, rp.plan_id;
    """
    if venue_id is None:
        where = ""
        params: tuple[()] = ()
    else:
        where = "WHERE rp.venue_id = %s"
        params = (venue_id,)

    sql = sql.format(where=where)

    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, params)
        rows = cur.fetchall()
    return list(rows)


def list_price_rules(
    plan_id: Optional[int] = None,
    version_id: Optional[int] = None,
) -> List[Dict[str, Any]]:
    """
    查場地計價規則：
    - 優先用 version_id
    - 其次用 plan_id
    - 都沒給就列全部（慎用）
    """
    base = """
    SELECT 
        pr.price_id,
        pr.version_id,
        rv.plan_id,
        rp.venue_id,
        v.name AS venue_name,
        rp.name AS plan_name,
        pr.affiliation,
        pr.day_type,
        pr.start_time,
        pr.end_time,
        pr.base_fee_per_hour,
        pr.min_hours,
        pr.step_minute,
        pr.peak_surcharge_pct,
        pr.deposit_required_bool,
        pr.deposit_amount
    FROM price_rule pr
    JOIN rate_version rv ON pr.version_id = rv.version_id
    JOIN rate_plan rp ON rv.plan_id = rp.plan_id
    JOIN venue v ON rp.venue_id = v.venue_id
    """
    where_clauses = []
    params: list[Any] = []

    if version_id is not None:
        where_clauses.append("pr.version_id = %s")
        params.append(version_id)
    elif plan_id is not None:
        where_clauses.append("rv.plan_id = %s")
        params.append(plan_id)

    if where_clauses:
        base += " WHERE " + " AND ".join(where_clauses)

    base += """
    ORDER BY rp.plan_id, pr.version_id, pr.day_type, pr.start_time;
    """

    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(base, tuple(params))
        rows = cur.fetchall()
    return list(rows)


# === 4. Venue Equip ===

def list_venue_equip(
    venue_id: Optional[int] = None,
) -> List[Dict[str, Any]]:
    """
    查場地設備庫存。
    """
    sql = """
    SELECT 
        ve.venue_id,
        v.name AS venue_name,
        ve.equip_id,
        e.name      AS equipment_name,
        e.category,
        e.unit,
        ve.stock_qty      AS current_stock,
        ve.default_on_bool AS default_included
    FROM venue_equip ve
    JOIN venue v ON ve.venue_id = v.venue_id
    JOIN equipment e ON ve.equip_id = e.equip_id
    {where}
    ORDER BY ve.venue_id, e.name;
    """

    if venue_id is None:
        where = ""
        params: tuple[()] = ()
    else:
        where = "WHERE ve.venue_id = %s"
        params = (venue_id,)

    sql = sql.format(where=where)

    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, params)
        rows = cur.fetchall()
    return list(rows)
