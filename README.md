# ntu-venue-booking 本地開發環境安裝
## 0. 前置需求

請先安裝好以下工具：

- Python 3.10+

- PostgreSQL 14 / 15 / 16（或以上任一版本）

- MongoDB Community Edition（本機跑一個 mongod 即可）

- MongoDB Mongosh（如果要檢查 NoSQL log 有沒有被正確存儲）

- Git

## 1. 下載專案
```
git clone <你的 repo 位址>
cd ntu-venue-booking
```

若不是用 Git，就直接把整個專案資料夾複製到本機，接下來所有指令都在專案根目錄下執行。

## 2. 設定 PostgreSQL
### 2.1 建立使用者與資料庫

假設 PostgreSQL 跑在 localhost:5432，在終端機執行：
```
psql -U postgres
```
進入 `psql` 後執行：

-- 1) 建一個帳號 ntu / 密碼 ntu  
CREATE ROLE ntu LOGIN PASSWORD 'ntu';

-- 2) 建資料庫 ntu_venue_dev，owner 設成 ntu  
CREATE DATABASE ntu_venue_dev OWNER ntu;

-- 3) 給基本權限（視需要）  
GRANT ALL PRIVILEGES ON DATABASE ntu_venue_dev TO ntu;

\q

### 2.2 匯入資料表結構以及建表
在專案根目錄執行：
```
psql "postgresql://ntu:ntu@localhost:5432/ntu_venue_dev" -f db/bootstrap_dev.sql
```
成功後，`booking / venue / user / payment / refund ...` 等所有資料表就建好了。  

若在 booking_modification.sql 匯入時碰到編碼錯誤，可先在 psql 裡執行：
```
\encoding UTF8
```
再執行：
```
\i app/queries/admin/booking_modification.sql
```

## 3. 設定 MongoDB

1. 確認本機 MongoDB 服務已啟動（預設連線： `mongodb://localhost:27017`）。

2. 後端程式會使用資料庫名稱 `ntu_venue_logs`，不需要事先建立，第一次寫入 log 會自動建立。

想確認是否有寫入，可以之後使用 `mongosh`：
```
mongosh
show dbs
use ntu_venue_logs
show collections
db.operation_logs.find().limit(5)
```

## 4. 設定 Python 虛擬環境與相依套件

在專案根目錄執行：
```
python -m venv .venv

# Windows:
.\.venv\Scripts\activate

# macOS / Linux:
source .venv/bin/activate
```
安裝需要的套件
```
pip install -r requirements.txt
```

## 5. 確認 .env 環境變數
確認 .env 設置無誤
```
PG_DSN=postgresql://ntu:ntu@localhost:5432/ntu_venue_dev
MONGO_URI=mongodb://localhost:27017
MONGO_DB=ntu_venue_logs
```

## 6. 啟動 FastAPI 後端服務
在專案根目錄（確保虛擬環境已啟動）執行：
```
uvicorn app.main:app --reload
```
看到類似訊息：
```
Application startup complete.
Uvicorn running on http://127.0.0.1:8000
```
代表啟動成功。

瀏覽器開啟：
- Swagger UI：http://localhost:8000/docs

即可看到所有 User / Admin API。

## 7. 快速測試流程（Demo 用）

以下是一個「前台 User 建單 → 後台 Admin 審核 / 修改 → Fund 處理」的完整範例流程。

### 7.1 User：查可預約時段
Swagger：`GET /api/v1/venues/availability`

範例參數：

- date: 2025-01-01

- start_time: 10:00

- end_time: 17:00

- people: 10

→ 回傳該日期、時間區間內可預約的場地與時段。

### 7.2 User：建立預約（建立 Pending Booking）

Swagger：`POST /api/v1/bookings`

Query 參數示例：

- user_id: 4（從 seed 04_insert_users.sql 取一個 user）

- venue_id: 2

- date: 2025-01-01

- start_time: 10:00

- end_time: 12:00

- people: 10

- affiliation: Internal

成功回應範例：
```
{
  "result": {
    "success": true,
    "booking_id": 493,
    "amount_est": 2000,
    ...
  }
}
```
記下 `booking_id`（例如 493），後面管理端會用到。

### 7.3 User：查看自己的訂單列表

Swagger：`GET /api/v1/bookings`

範例參數：

- user_id: 4

- status:（可留空；空值表示查全部狀態）

→ 回傳此 user 所有訂單；剛建立那筆會是 `status = "Pending"`。

### 7.4 Admin：查看待審清單

Swagger：`GET /api/v1/admin/bookings/pending`

→ 可以看到所有 Pending 訂單，包括剛才 `booking_id = 493` 那筆。

### 7.5 Admin：綜合審核檢查

Swagger：`GET /api/v1/admin/bookings/{booking_id}/check`

**Path：**

- `booking_id: 493`

→ 回傳內容包含：

- user_status_check（帳號是否凍結）

- capacity_check（有無超容）

- venue_status_check（場地是否開放）

- conflict_with_bookings（與已核准 / 待付款訂單是否衝突）

- conflict_with_blocked（是否與封館時段衝突）

### 7.6 Admin：核准訂單

Swagger：`POST /api/v1/admin/bookings/{booking_id}/approve`

**Path：**

- `booking_id: 493`

**Query：**

- `operator_id: 1`

- `operator: "admin@test.com"（純文字標記）`

**Body：**
```
{
  "step": 1,
  "comment": "demo: first approve",
  "final": true
}
```
成功回應範例：
```
{
  "result": {
    "success": true,
    "booking_id": 493,
    ...
  }
}
```
此時 DB 會將該訂單狀態改為 `Approved`，並在 `BOOKING_SLOT` 切出實際時段。

###　7.7 Admin：總覽列表

Swagger：`GET /api/v1/admin/bookings/overview`

→ 顯示所有訂單的摘要（狀態＋最後一次審核結果），可以確認剛剛那筆從 `Pending → Approved`

### 7.8 Admin：修改訂單（可選 Demo）

Swagger：`POST /api/v1/admin/bookings/{booking_id}/modify`

**Path：**

- `booking_id: 493`

**Query：**

- `operator_id: 1`

**Body：**
```
{
  "new_date": "2025-01-01",
  "new_start_time": "13:00",
  "new_end_time": "15:00",
  "new_venue_id": 2,
  "new_people": 12
}
```
若新時段沒有衝突，回應類似：
```
{
  "result": {
    "success": true,
    "booking_id": 493,
    "amount_diff": 500
  }
}
```
並在 `payment` 表多出一筆差額紀錄`（type='Adjustment'、method='Transfer'、status='Pending'）`。

### 7.9 Admin：Fund 模組（付款與退款）

1. 查看待處理付款

Swagger：`GET /api/v1/admin/fund/payments/pending`
→ 顯示所有 `status='Pending'` 的 `payment`。

2. 標記付款成功

Swagger：`POST /api/v1/admin/fund/payments/{payment_id}/succeed`

- `payment_id`: 填上一步查到的一筆

- `operator_id: 1`

成功會將該筆 `payment.status` 改為 `Succeeded`。

3. 建立退款申請

Swagger：`POST /api/v1/admin/fund/refunds`

**Body 範例：**
```
{
  "payment_id": 10,
  "amount": 100,
  "reason": "demo refund for video"
}
```

→ 新增一筆 `refund`，`status='Pending`'。

4. 完成退款

Swagger：`POST /api/v1/admin/fund/refunds/{refund_id}/succeed`

- `refund_id`: 上一步新建的那筆 `refund ID`

- `operator_id: 1`

→ 將 `refund.status` 改為 `Succeeded`，並把對應 `payment.status` 改為 `Refunded`。

### 7.10 User：取消 Pending 訂單（另一筆 demo）

如果要示範取消流程，可以再多建立一筆「不要核准」的 Pending 訂單，
用 Swagger：`POST /api/v1/bookings/{booking_id}/cancel`

**Query：**

- `user_id`: 下訂單的 user（例如 4）

成功會回：
```
{
  "result": {
    "success": true
  }
}
```

若試圖取消不是自己 `user_id` 的訂單，會收到 `403 Forbidden`；
若試圖取消已核准的訂單，會收到 `409 Conflict`。

## 8. MongoDB Log
若要在影片裡展示 NoSQL log，可以使用 `mongosh`：
```
mongosh
use ntu_venue_logs
db.operation_logs.find().sort({ _id: -1 }).limit(10).pretty()
```