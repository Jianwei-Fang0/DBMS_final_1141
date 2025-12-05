from datetime import datetime, timedelta
from typing import Any, Dict, List, Optional

from psycopg.rows import dict_row

from app.db.postgres import get_conn
from app.db.mongo import log

# === 1. 查可預約時段 ===
def search_availability(
    p_date: str,
    p_start: str,
    p_end: str,
    p_people: int,
    building_id: int | None = None,
    venue_type: str | None = None,
) -> List[dict]:
    """
    呼叫 app/queries/user/search_availability.sql
    建議該 SQL 已改成使用 $1..$6 參數：
      $1::date  p_date
      $2::time  p_start
      $3::time  p_end
      $4::int   p_people
      $5::int   p_building_id (可為 NULL)
      $6::text  p_type        (可為 NULL)
    """
    sql_path = "app/queries/user/search_availability.sql"
    with open(sql_path, "r", encoding="utf-8") as f:
        sql = f.read()

    params = (
        p_date,
        p_start,
        p_end,
        p_people,
        building_id,
        venue_type,
    )

    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, params)
        rows = cur.fetchall()
    return list(rows)


# === 2. 取 rate_version ===
def get_rate_version(conn, venue_id: int, date_str: str) -> int:
    q = """
    SELECT rv.version_id
    FROM rate_version rv
    JOIN rate_plan rp ON rp.plan_id = rv.plan_id
    WHERE rp.venue_id = %s
      AND rv.effective_from <= %s
      AND (rv.effective_to IS NULL OR rv.effective_to >= %s)
    ORDER BY rv.effective_from DESC
    LIMIT 1;
    """
    with conn.cursor() as cur:
        cur.execute(q, (venue_id, date_str, date_str))
        r = cur.fetchone()
        if not r:
            raise ValueError("No active RATE_VERSION for venue_id=%s date=%s" % (venue_id, date_str))
        return r[0]


# === 3. 粗略估算金額 ===
def estimate_amount(
    conn,
    version_id: int,
    date_str: str,
    start_time: str,
    end_time: str,
    affiliation: str = "Internal",
) -> float:
    """
    粗略估價：
      1) 用 booking 日期決定 weekday/weekend
      2) 取對應 price_rule.base_fee_per_hour
      3) * 小時數（至少 0.5 小時）
    """
    hours_q = """
    SELECT EXTRACT(EPOCH FROM ((%s::time) - (%s::time))) / 3600.0 AS h
    """

    fee_q = """
    WITH dt AS (
      SELECT CASE
        WHEN EXTRACT(dow FROM %s::date) IN (0,6) THEN 'Weekend'
        ELSE 'Weekday' END AS day_type
    )
    SELECT COALESCE(MAX(pr.base_fee_per_hour),0)
    FROM price_rule pr, dt
    WHERE pr.version_id = %s
      AND pr.affiliation = %s
      AND pr.day_type = dt.day_type
      AND %s::time >= pr.start_time
      AND %s::time <= pr.end_time
    """

    with conn.cursor() as cur:
        # 1) 算總時數（小時）
        cur.execute(hours_q, (end_time, start_time))
        hours = float(cur.fetchone()[0] or 0.0)
        hours = max(0.5, hours)  # 至少半小時

        # 2) 根據 booking date 決定 day_type，抓對應單價
        cur.execute(
            fee_q,
            (
                date_str,      # %s::date → 判斷 weekday/weekend
                version_id,    # pr.version_id = %s
                affiliation,   # pr.affiliation = %s
                start_time,    # %s::time >= pr.start_time
                end_time,      # %s::time <= pr.end_time
            ),
        )
        fee = float(cur.fetchone()[0] or 0.0)

    return round(hours * fee, 2)




# === 4. 建立 booking（不切 slot，維持 Pending） ===
def create_booking(
    venue_id: int,
    user_id: int,
    date_str: str,
    start_time: str,
    end_time: str,
    people: int,
    affiliation: str,
    ua: str | None,
) -> dict[str, Any]:
    """
    user 建立預約：
      1) 算 rate_version + amount_est
      2) 呼叫 app/queries/user/create_booking.sql 插入一筆 BOOKING（status='Pending'）
      3) 寫 Mongo log
      4) 不切 BOOKING_SLOT，留給 admin approve_booking 處理
    """
    sql_path = "app/queries/user/create_booking.sql"
    with open(sql_path, "r", encoding="utf-8") as f:
        sql = f.read()

    with get_conn() as conn:
        try:
            conn.execute("BEGIN")
            version_id = get_rate_version(conn, venue_id, date_str)
            amount_est = estimate_amount(
                conn,
                version_id=version_id,
                date_str=date_str,
                start_time=start_time,
                end_time=end_time,
                affiliation="Internal",
            )


            # 建 BOOKING（create_booking.sql 須對應 $1..$8）
            with conn.cursor() as cur:
                cur.execute(
                    sql,
                    (
                        venue_id,
                        user_id,
                        date_str,
                        start_time,
                        end_time,
                        people,
                        version_id,
                        amount_est,
                    ),
                )
                row = cur.fetchone()
                if row is None:
                    raise ValueError("Failed to create booking")
                booking_id = row[0]

            conn.execute("COMMIT")

            log(
                "USER_CREATE_BOOKING",
                user_id,
                None,
                {
                    "booking_id": booking_id,
                    "venue_id": venue_id,
                    "date": date_str,
                    "start": start_time,
                    "end": end_time,
                    "people": people,
                    "affiliation": affiliation,
                    "amount_est": float(amount_est),
                },
                ua,
            )
            return {"booking_id": booking_id, "amount_est": float(amount_est)}

        except Exception as e:
            conn.execute("ROLLBACK")
            log(
                "USER_CREATE_BOOKING_FAILED",
                user_id,
                None,
                {
                    "venue_id": venue_id,
                    "date": date_str,
                    "start": start_time,
                    "end": end_time,
                    "people": people,
                    "affiliation": affiliation,
                    "error": str(e),
                },
                ua,
            )
            raise

def list_user_bookings(user_id: int, status: Optional[str] = None) -> list[dict]:
    """
    列出某個 user 的訂單。
    如果 status 有給，只列出該狀態（例如 Pending / Approved / Cancelled）。
    """
    # 基本 SQL
    sql = """
    SELECT
        b.booking_id,
        b.venue_id,
        v.name       AS venue_name,
        b.date,
        b.start_time,
        b.end_time,
        b.people,
        b.status,
        b.amount_est,
        b.created_at
    FROM booking b
    JOIN venue v ON v.venue_id = b.venue_id
    WHERE b.user_id = %s
    """
    params: list = [user_id]

    # 如果有指定 status，就加一條 AND
    if status is not None:
        sql += " AND b.status = %s"
        params.append(status)

    sql += " ORDER BY b.date DESC, b.start_time DESC, b.booking_id DESC"

    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, params)
        rows = cur.fetchall()

    # Mongo log（可有可無，不影響主流程）
    try:
        log(
            "USER_LIST_BOOKINGS",
            user_id,
            None,
            {"user_id": user_id, "status": status},
            None,
        )
    except Exception:
        pass

    return rows

class BookingNotFoundError(Exception):
    pass


class BookingForbiddenError(Exception):
    pass


class BookingStatusError(Exception):
    pass


def cancel_booking(booking_id: int, user_id: int, user_agent: str | None = None) -> dict:
    """
    使用者取消自己的訂單：
      - 僅允許 Pending 訂單
      - 僅限該 user 自己
      - 將 status 設為 Cancelled, hold_until 設為 NULL
    """
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        # 鎖住這筆訂單，避免併發衝突
        cur.execute(
            """
            SELECT booking_id, user_id, status, date, start_time, end_time
            FROM booking
            WHERE booking_id = %s
            FOR UPDATE;
            """,
            (booking_id,),
        )
        row = cur.fetchone()

        if row is None:
            raise BookingNotFoundError("booking not found")

        if row["user_id"] != user_id:
            raise BookingForbiddenError("booking does not belong to this user")

        if row["status"] != "Pending":
            # 目前簡化只允許 Pending 訂單取消
            raise BookingStatusError("only Pending bookings can be cancelled")

        # 更新為 Cancelled
        cur.execute(
            """
            UPDATE booking
            SET status = 'Cancelled',
                hold_until = NULL
            WHERE booking_id = %s;
            """,
            (booking_id,),
        )

        conn.commit()

    # 寫 Mongo log
    try:
        log(
            "USER_CANCEL_BOOKING",
            user_id,
            None,
            {
                "booking_id": booking_id,
                "prev_status": row["status"],
                "date": row["date"].isoformat(),
                "start": row["start_time"].isoformat(),
                "end": row["end_time"].isoformat(),
            },
            user_agent,
        )
    except Exception:
        # 不讓 log 影響主流程
        pass

    return {"booking_id": booking_id, "status": "Cancelled"}
