本專案為場地租借系統的關聯式資料庫設計與操作腳本，以下整理目前提供的 **Relational DB Query** 功能清單（僅列出「查詢 / 操作名稱」與「目的說明」，不含範例 SQL）。

---
增加 → ADD
刪除 → DELETE
查詢 → SEARCH
允許 → APPROVE
拒絕 → REJECT
更新 → UPDATE


## 關聯式資料庫 Query 一覽

### 1. `approval_queries.sql`（審核與核准流程）
- **`SEARCH_PENDING`**：查詢待審核申請清單，列出所有 `BOOKING.status = 'Pending'` 的訂單。
- **`SEARCH_PENDING_DETAIL`**：查詢待審核申請詳細資訊，包含申請人、單位、場地、金額等詳細欄位。
- **`SEARCH_PENDING_HISTORY`**：查詢單一申請的審核歷史，查看某筆訂單在 `APPROVAL` 表中的所有審核紀錄與關卡。
- **`SEARCH_ALL_BOOKING_PROCESS`**：查詢所有審核狀態的申請（管理員總覽），整合使用者、場地、建物等資訊的明細查詢。
- **`APPROVE_PENDING`**：審核通過流程（單關），更新訂單狀態為 Approved、寫入 `APPROVAL`、鎖定 `BLOCKED_SLOT`、建立 `BOOKING_SLOT`。
- **`REJECT_PENDING`**：審核拒絕流程，更新訂單狀態為 Rejected 並寫入拒絕原因到 `APPROVAL`。
- **`MULTI_APPROVAL`**：多關卡審核流程，示範第一關 / 第二關審核如何逐關更新狀態與寫入 `APPROVAL`、鎖定與切片時段。
- **`ADD_BLOCKED_SLOT`**：鎖定時段，在審核通過後建立臨時阻擋記錄。
- **`ADD_BOOKING_SLOT`**：建立 BOOKING_SLOT 切片（時段切段）。
- **`CHECK_BLACKLIST`**：檢查申請人是否在黑名單中。
- **`CHECK_VENUE_SPECIFICATION`**：檢查場地規範（容量、開放狀態、設備需求）。
- **`CHECK_TIME_CONFLICT`**：檢查時段衝突（與已核准的預約和保留時段）。
- **`CHECK_TIME_RULE`**：檢查場地開放時間規則。
- **`CHECK_EQUIPMENT_REQUIREMENT`**：檢查設備需求是否滿足。
- **`COMPREHENSIVE_APPROVAL_CHECK`**：綜合審核檢查（所有檢查項目彙總），包含黑名單檢查、違規紀錄、場地容量與開放狀態、時段衝突、開放時間規則、設備可用量等檢查 SQL。

### 2. `booking_modification.sql`（訂單異動與差額處理）
- **`BOOKING_MODIFY_FULL_FLOW`**：訂單異動完整流程（DO 區塊示範版）
  - 讀取原始訂單資訊。
  - 檢查新時段是否被 `BLOCKED_SLOT` 或開放規則阻擋。
  - 鎖定新時段、釋放舊時段。
  - 依 `PRICE_RULE` 重算金額，計算差額。
  - 更新 `BOOKING` 主資料（日期、時段、場地、金額、狀態）。
  - 重新建立 `BOOKING_SLOT` 切段。
  - 依差額產生補收或退款用的 `PAYMENT` 記錄。
- **`BOOKING_MODIFY_FUNCTION`**：使用函數處理訂單異動（推薦），將上述流程封裝成可重複呼叫的 PL/pgSQL 函數，回傳異動結果 JSON（舊金額、新金額、差額、新狀態等）。

### 3. `black_list.sql`（黑名單管理）
- **`ADD_BLACKLIST`**：新增黑名單紀錄，在 `BLACKLIST` 表中新增特定使用者的黑名單資料（原因、有效期限、狀態）。
- **`DELETE_BLACKLIST`**：刪除黑名單紀錄，根據 `user_id` 將使用者自黑名單移除。
- **`SEARCH_ALL_BLACKLIST`**：查詢黑名單清單，聯結 `USER`、`ORG` 等資料，列出黑名單使用者的基本資訊與原因。

### 4. `set_rule.sql`（規則與資源設定）
- **TIMESLOT_RULE – 可租時段規則**
  - **`SEARCH_TIMESLOT_RULE_ALL`**：查看所有場地的時段規則。
  - **`SEARCH_TIMESLOT_RULE_BY_VENUE`**：查看特定場地的時段規則。
  - **`ADD_TIMESLOT_RULE`**：新增時段規則（每週開放時間與切片分鐘數）。
  - **`UPDATE_TIMESLOT_RULE`**：更新時段規則（開放時間 / 關閉時間 / slot_minute）。
  - **`DELETE_TIMESLOT_RULE`**：刪除時段規則。
- **BLOCKED_SLOT – 臨時阻擋 / 保留**
  - **`SEARCH_BLOCKED_SLOT_ALL`**：查看所有臨時阻擋（含是否已過期的狀態判斷）。
  - **`SEARCH_BLOCKED_SLOT_BY_VENUE`**：查看特定場地未過期的阻擋時段。
  - **`ADD_BLOCKED_SLOT`**：建立臨時阻擋（指定日期、時間區段與原因）。
  - **`DELETE_BLOCKED_SLOT`**：刪除臨時阻擋。
- **RATE_PLAN / RATE_VERSION / PRICE_RULE – 費率方案管理**
  - **`SEARCH_RATE_PLAN_ALL`**：查看所有費率方案與版本數統計。
  - **`SEARCH_RATE_PLAN_BY_VENUE`**：查看特定場地的費率方案與各版本生效期間。
  - **`SEARCH_PRICE_RULE_BY_PLAN`**：查看單一方案的詳細價格規則（身份、日型、時間帶、每小時金額、押金等）。
  - **`ADD_RATE_PLAN`**：建立新的費率方案。
  - **`ADD_RATE_VERSION`**：建立新的費率版本（版本生效 / 失效日期）。
  - **`ADD_PRICE_RULE`**：建立價格規則（依版本、身份、日型與時段設定費率與押金規則）。
  - **`UPDATE_RATE_PLAN_STATUS`**：更新費率方案狀態（On / Off）。
- **VENUE_EQUIP – 場地設備庫存**
  - **`SEARCH_VENUE_EQUIP_ALL`**：查看所有場地的設備與庫存。
  - **`SEARCH_VENUE_EQUIP_BY_VENUE`**：查看特定場地的設備清單與庫存、是否預設附帶。
  - **`UPDATE_VENUE_EQUIP_STOCK`**：更新設備庫存數量。
  - **`ADD_VENUE_EQUIP`**：新增（或更新）場地設備設定（含 default_on_bool）。
  - **`UPDATE_VENUE_EQUIP_DEFAULT`**：更新設備是否預設附帶。
- **EQUIP_PRICE_RULE – 設備加價規則**
  - **`SEARCH_EQUIP_PRICE_RULE_ALL`**：查看所有設備加價規則（關聯費率版本與方案）。
  - **`SEARCH_EQUIP_PRICE_RULE_BY_VERSION`**：查看特定版本的設備加價規則。
  - **`SEARCH_EQUIP_PRICE_RULE_BY_VENUE`**：查看特定場地在「目前有效版本」下的設備加價規則。
  - **`ADD_EQUIP_PRICE_RULE`**：建立新的設備加價規則（依版本、設備、身份、單價、計價單位）。
  - **`UPDATE_EQUIP_PRICE_RULE`**：更新設備加價規則（調整單價 / 計價單位）。
  - **`DELETE_EQUIP_PRICE_RULE`**：刪除設備加價規則。

### 5. `update_fund.sql`（金流入帳與退款標記）
- **`UPDATE_PAYMENT_STATUS_TO_SUCCEEDED`**：標記付款成功（手動），依 `payment_id` 將 `PAYMENT.status` 從 `Pending` 更新為 `Succeeded`，模擬金流入帳後的人工確認。
- **`SEARCH_PENDING_PAYMENT`**：查詢所有待付款紀錄，列出 `PAYMENT.status = 'Pending'` 的紀錄，含訂單目的、申請人、金額與建立時間，用於對帳與人工處理。
- **`ADD_REFUND`**：建立退款紀錄
  - 在 `REFUND` 表中新增一筆退款紀錄（指定 `payment_id`、退款金額與原因）。
  - 退款狀態預設為 `Pending`，供後續追蹤實際退款結果。
- **`UPDATE_PAYMENT_STATUS_BY_REFUND`**：退款後更新付款狀態（預留），依 `refund_id` 更新對應 `PAYMENT` 狀態的操作，搭配實際金流系統結果使用。

---

## 備註
- 上述檔案皆為 **關聯式資料庫（PostgreSQL）** 的查詢與操作腳本，主要對應資料字典中的各個表（`BOOKING`、`APPROVAL`、`PAYMENT`、`REFUND`、`TIMESLOT_RULE`、`BLOCKED_SLOT`、`RATE_PLAN`、`VENUE_EQUIP` 等）。
- NoSQL（MongoDB）相關的日誌與建議說明則集中在 `query/mongodb_*.py` 與 `query/mongodb_recommendations.md` 中，與本節的關聯式查詢說明分開。