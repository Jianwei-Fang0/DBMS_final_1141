# API 請求流程說明

## 範例：查詢可借場地

### 完整流程圖

```
客戶端 (client.py / main/user_cli.py)
    ↓ HTTP GET 請求
    requests.get("http://127.0.0.1:8000/api/v1/venues/availability?date=2025-01-20&start=10:00&end=12:00")
    ↓
後端 FastAPI (app/main.py)
    ↓ 路由匹配
    app/routes/user.py
    ↓ 執行路由函數
    @router.get("/venues/availability")
    def get_availability(date, start, end, ...):
        rows = search_availability(...)  ← 調用 Service 層
        return {"data": rows}
    ↓
業務邏輯層 (app/services/booking.py)
    def search_availability(...):
        1. 讀取 SQL 文件: app/queries/user/search_availability.sql
        2. 準備參數: (date, start, end, people, ...)
        3. 連接資料庫
        4. 執行 SQL 查詢
        5. 返回結果: List[dict]
    ↓
資料庫層 (app/db/postgres.py)
    get_conn() → 從連接池獲取連接
    ↓
PostgreSQL 資料庫
    ↓ 執行 SQL 查詢
    返回查詢結果
    ↓
反向返回
    ↓
客戶端收到 JSON 響應: {"data": [場地列表]} 
```

---

## 詳細步驟說明

### 步驟 1：客戶端發起請求

**檔案：** `client.py` 或 `main/user_cli.py`

```python
url = f"{BASE_URL}/api/v1/venues/availability"
params = {
    "date": "2025-01-20",
    "start": "10:00",
    "end": "12:00"
}
resp = requests.get(url, params=params)
```

**說明：** 客戶端發送 HTTP GET 請求到後端 API

---

### 步驟 2：FastAPI 路由匹配

**檔案：** `app/routes/user.py`

```python
router = APIRouter(prefix="/api/v1")  # 前綴: /api/v1

@router.get("/venues/availability")   # 路徑: /venues/availability
def get_availability(
    date: str = Query(...),    # 從 URL 參數提取
    start: str = Query(...),
    end: str = Query(...),
    ...
):
```

**說明：** 
- 完整 URL: `/api/v1/venues/availability`
- FastAPI 自動匹配到這個路由函數
- 自動從 URL 參數提取 `date`, `start`, `end` 等參數

---

### 步驟 3：路由函數調用 Service 層

**檔案：** `app/routes/user.py` (第 28-35 行)

```python
rows = search_availability(
    p_date=date,        # "2025-01-20"
    p_start=start,      # "10:00"
    p_end=end,          # "12:00"
    p_people=people,    # 1
    building_id=building_id,
    venue_type=venue_type,
)
return {"data": rows}  # 包裝成 JSON 格式返回
```

**說明：** 路由層負責處理 HTTP 請求/響應，業務邏輯交給 Service 層處理

---

### 步驟 4：Service 層執行 SQL 查詢

**檔案：** `app/services/booking.py` (第 10-44 行)

```python
def search_availability(...):
    # 1. 讀取 SQL 文件
    sql_path = "app/queries/user/search_availability.sql"
    with open(sql_path, "r", encoding="utf-8") as f:
        sql = f.read()  # 讀取整個 SQL 文件內容
    
    # 2. 準備參數
    params = (p_date, p_start, p_end, p_people, building_id, venue_type)
    
    # 3. 連接資料庫並執行查詢
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, params)  # 執行 SQL，傳入參數
        rows = cur.fetchall()     # 獲取所有查詢結果
    
    # 4. 返回結果
    return list(rows)  # 返回 List[dict]
```

**說明：** 
- Service 層負責業務邏輯
- 讀取 SQL 文件並執行
- 處理資料庫連接和查詢

---

### 步驟 5：資料庫層連接資料庫

**檔案：** `app/db/postgres.py`

```python
def get_conn():
    return pool.connection()  # 從連接池獲取連接
```

**說明：** 使用連接池管理資料庫連接，避免每次請求都建立新連接

---

### 步驟 6：執行 SQL 查詢

**檔案：** `app/queries/user/search_availability.sql`

```sql
-- 這個 SQL 會：
-- 1. 檢查場地開放規則
-- 2. 排除已被占用的時段
-- 3. 排除封場時段
-- 4. 返回可用的場地列表

SELECT v.venue_id, v.name, v.type, v.capacity, ...
FROM open_venue v
WHERE NOT EXISTS (占用檢查)
AND NOT EXISTS (封場檢查)
...
```

**說明：** PostgreSQL 執行 SQL 查詢，返回符合條件的場地列表

---

### 步驟 7：返回結果

**資料流程：**

```
PostgreSQL 資料庫
    ↓ 返回查詢結果
    [
        {"venue_id": 1, "name": "會議室A", "capacity": 50, ...},
        {"venue_id": 2, "name": "會議室B", "capacity": 30, ...}
    ]
    ↓
Service 層: return list(rows)
    ↓
Route 層: return {"data": rows}
    ↓
FastAPI 自動序列化為 JSON
    ↓
HTTP 響應: 
{
    "data": [
        {"venue_id": 1, "name": "會議室A", ...},
        {"venue_id": 2, "name": "會議室B", ...}
    ]
}
    ↓
客戶端收到 JSON 響應
```

---

## 架構分層

```
┌─────────────────────────────────┐
│  客戶端 (Frontend)               │
│  - client.py                    │
│  - main/user_cli.py             │
│  - main/admin_cli.py            │
└──────────────┬──────────────────┘
               │ HTTP 請求
               ↓
┌─────────────────────────────────┐
│  路由層 (Route Layer)            │
│  app/routes/user.py             │
│  app/routes/admin_booking.py    │
│  - 處理 HTTP 請求/響應          │
│  - 參數驗證和提取               │
└──────────────┬──────────────────┘
               ↓
┌─────────────────────────────────┐
│  業務邏輯層 (Service Layer)      │
│  app/services/booking.py        │
│  app/services/admin_booking.py  │
│  - 業務邏輯處理                 │
│  - 調用資料庫                   │
└──────────────┬──────────────────┘
               ↓
┌─────────────────────────────────┐
│  資料庫層 (DB Layer)              │
│  app/db/postgres.py             │
│  - 連接池管理                   │
│  - 資料庫連接                   │
└──────────────┬──────────────────┘
               ↓
┌─────────────────────────────────┐
│  資料庫 (PostgreSQL)             │
│  - 執行 SQL 查詢                │
│  - 返回查詢結果                 │
└─────────────────────────────────┘
```

---

## 關鍵要點

1. **URL 路徑匹配**
   - 客戶端請求：`/api/v1/venues/availability`
   - 路由定義：`@router.get("/venues/availability")` (prefix="/api/v1")
   - FastAPI 自動匹配

2. **參數自動提取**
   - FastAPI 自動從 URL 參數提取並驗證
   - 例如：`?date=2025-01-20` → `date: str = Query(...)`

3. **分層架構**
   - Route 層：處理 HTTP
   - Service 層：業務邏輯
   - DB 層：資料庫操作

4. **自動序列化**
   - FastAPI 自動將 Python 物件轉為 JSON
   - 例如：`return {"data": rows}` → JSON 響應

---

## 其他 API 的流程相同

所有 API 都遵循相同的流程：

- **建立預約：** `POST /api/v1/bookings`
- **查詢訂單：** `GET /api/v1/bookings`
- **取消訂單：** `POST /api/v1/bookings/{id}/cancel`
- **管理員核准：** `POST /api/v1/admin/bookings/{id}/approve`
- ... 等等

**流程都一樣：**
客戶端 → Route 層 → Service 層 → DB 層 → 資料庫 → 返回結果
