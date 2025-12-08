import psycopg
from psycopg_pool import ConnectionPool
from app.core.config import settings

pool: ConnectionPool | None = None

def init_pg_pool() -> None:
    global pool
    if pool is None:
        pool = ConnectionPool(
            conninfo=settings.PG_DSN,
            min_size=1,
            max_size=10,
            open=True,
        )

def get_pool() -> ConnectionPool:
    global pool
    if pool is None:
        init_pg_pool()
    assert pool is not None
    return pool

def get_conn():
    return get_pool().connection()  # context manager

def close_pg_pool() -> None:
    global pool
    if pool is not None:
        pool.close()
        pool = None
