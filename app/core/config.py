from pydantic import BaseModel
from dotenv import load_dotenv
import os

load_dotenv()

class Settings(BaseModel):
    PG_DSN: str = os.getenv("PG_DSN", "")
    MONGO_URI: str = (
        os.getenv("MONGO_URI") or
        os.getenv("MONGODB_URI") or
        "mongodb://localhost:27017"
    )
    MONGO_DB: str = (
        os.getenv("MONGO_DB") or
        os.getenv("MONGODB_DB_NAME") or
        "ntu_venue_logs"
    )
    PORT: int = int(os.getenv("PORT", "8000"))

settings = Settings()

