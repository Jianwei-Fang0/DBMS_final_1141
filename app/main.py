from fastapi import FastAPI

from app.db.postgres import init_pg_pool, close_pg_pool
from app.db.mongo import init_mongo, close_mongo
from app.routes.user import router as user_router
from app.routes.admin_logs import router as admin_logs_router
from app.routes.admin_booking import router as admin_booking_router
from app.routes.admin_blacklist import router as admin_blacklist_router
from app.routes.admin_rules import router as admin_rules_router
from app.routes.admin_fund import router as admin_fund_router

app = FastAPI(title="NTU Venue API")

app.include_router(user_router)
app.include_router(admin_logs_router)
app.include_router(admin_booking_router)
app.include_router(admin_blacklist_router)
app.include_router(admin_rules_router)
app.include_router(admin_fund_router)

@app.on_event("startup")
def _startup():
    init_pg_pool()
    init_mongo()


@app.on_event("shutdown")
def _shutdown():
    close_pg_pool()
    close_mongo()
