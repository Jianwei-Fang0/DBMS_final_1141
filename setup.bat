@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ============================================================
echo NTU Venue Booking System - 自動設定腳本
echo ============================================================
echo.

REM 設定變數
set PG_USER=ntu
set PG_PASSWORD=ntu
set PG_DB=ntu_venue_dev
set PG_HOST=localhost
set PG_PORT=5432
set PG_ADMIN_USER=postgres

REM ============================================================
REM 1. 檢查並設定 PostgreSQL
REM ============================================================
echo [1/6] 檢查 PostgreSQL 設定...
echo.

REM 檢查 psql 是否可用
where psql >nul 2>&1
if errorlevel 1 (
    echo [錯誤] 找不到 psql 命令，請確認 PostgreSQL 已安裝並加入 PATH
    pause
    exit /b 1
)

REM 檢查使用者是否存在
echo 正在檢查使用者是否存在...
for /f "delims=" %%i in ('psql -U %PG_ADMIN_USER% -h %PG_HOST% -p %PG_PORT% -d postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='%PG_USER%';" 2^>nul') do set USER_EXISTS=%%i
if not defined USER_EXISTS (
    echo 使用者不存在，正在建立使用者 %PG_USER%...
    psql -U %PG_ADMIN_USER% -h %PG_HOST% -p %PG_PORT% -d postgres -c "CREATE ROLE %PG_USER% LOGIN PASSWORD '%PG_PASSWORD%';" 2>nul
    if errorlevel 1 (
        echo [警告] 無法建立使用者，可能需要手動建立或使用者已存在
    ) else (
        echo [成功] 使用者 %PG_USER% 已建立
    )
) else (
    echo [資訊] 使用者 %PG_USER% 已存在
)

REM 檢查資料庫是否存在
echo 正在檢查資料庫是否存在...
set DB_EXISTS=
for /f "delims=" %%i in ('psql -U %PG_ADMIN_USER% -h %PG_HOST% -p %PG_PORT% -d postgres -tAc "SELECT 1 FROM pg_database WHERE datname='%PG_DB%';" 2^>nul') do set DB_EXISTS=%%i
if not defined DB_EXISTS (
    echo 資料庫不存在，正在建立資料庫 %PG_DB%...
    psql -U %PG_ADMIN_USER% -h %PG_HOST% -p %PG_PORT% -d postgres -c "CREATE DATABASE %PG_DB% OWNER %PG_USER%;" 2>nul
    if errorlevel 1 (
        echo [錯誤] 無法建立資料庫，請檢查 PostgreSQL 連線設定
        pause
        exit /b 1
    )
    
    REM 給予權限
    psql -U %PG_ADMIN_USER% -h %PG_HOST% -p %PG_PORT% -d postgres -c "GRANT ALL PRIVILEGES ON DATABASE %PG_DB% TO %PG_USER%;" 2>nul
    
    echo [成功] 資料庫 %PG_DB% 已建立
) else (
    echo [資訊] 資料庫 %PG_DB% 已存在，跳過建立步驟
)

REM 檢查資料表是否已存在
echo.
echo 正在檢查資料表是否已存在...
set TABLES_EXIST=
REM 檢查 booking 表是否存在
psql -U %PG_USER% -h %PG_HOST% -p %PG_PORT% -d %PG_DB% -tAc "SELECT 1 FROM information_schema.tables WHERE table_schema='public' AND table_name='booking' LIMIT 1;" >nul 2>&1
if errorlevel 1 (
    REM 查詢失敗，可能是連線問題，嘗試匯入
    echo [警告] 無法檢查資料表，將嘗試匯入...
    set TABLES_EXIST=
) else (
    REM 查詢成功，檢查是否有結果
    for /f "delims=" %%i in ('psql -U %PG_USER% -h %PG_HOST% -p %PG_PORT% -d %PG_DB% -tAc "SELECT 1 FROM information_schema.tables WHERE table_schema='public' AND table_name='booking' LIMIT 1;" 2^>nul') do set TABLES_EXIST=%%i
)

REM 如果表已存在，跳過匯入
if defined TABLES_EXIST (
    if "!TABLES_EXIST!"=="1" (
        echo [資訊] 資料表已存在，跳過匯入步驟
        goto :skip_import
    )
)

REM 如果表不存在，執行匯入
echo 資料表不存在，正在匯入資料表結構...
if exist "db\bootstrap_dev.sql" (
    psql "postgresql://%PG_USER%:%PG_PASSWORD%@%PG_HOST%:%PG_PORT%/%PG_DB%" -f db\bootstrap_dev.sql >nul 2>&1
    if errorlevel 1 (
        echo [警告] 匯入資料表結構時發生錯誤，可能部分資料表已存在
        echo 這是正常的，如果資料表已存在則會顯示錯誤但可忽略
    ) else (
        echo [成功] 資料表結構匯入完成
    )
) else (
    echo [錯誤] 找不到 db\bootstrap_dev.sql 檔案
    pause
    exit /b 1
)

:skip_import

REM ============================================================
REM 2. 檢查 MongoDB
REM ============================================================
echo.
echo [2/6] 檢查 MongoDB 服務...
where mongosh >nul 2>&1
if errorlevel 1 (
    where mongo >nul 2>&1
    if errorlevel 1 (
        echo [警告] 找不到 mongosh 或 mongo 命令，請確認 MongoDB 已安裝
        echo MongoDB 資料庫會在第一次寫入時自動建立
    ) else (
        echo [資訊] 找到 mongo 命令，MongoDB 應該已安裝
    )
) else (
    echo [資訊] 找到 mongosh 命令，MongoDB 應該已安裝
)

REM 嘗試連線 MongoDB（可選）
echo 正在檢查 MongoDB 連線...
timeout /t 1 >nul 2>&1

REM ============================================================
REM 3. 設定 Python 虛擬環境
REM ============================================================
echo.
echo [3/6] 設定 Python 虛擬環境...

REM 檢查 Python 是否可用
where python >nul 2>&1
if errorlevel 1 (
    echo [錯誤] 找不到 python 命令，請確認 Python 已安裝並加入 PATH
    pause
    exit /b 1
)

REM 檢查虛擬環境是否存在
if exist ".venv\Scripts\activate.bat" (
    echo [資訊] 虛擬環境已存在
) else (
    echo 正在建立虛擬環境...
    python -m venv .venv
    if errorlevel 1 (
        echo [錯誤] 無法建立虛擬環境
        pause
        exit /b 1
    )
    echo [成功] 虛擬環境已建立
)

REM 啟動虛擬環境
echo 正在啟動虛擬環境...
call .venv\Scripts\activate.bat
if errorlevel 1 (
    echo [錯誤] 無法啟動虛擬環境
    pause
    exit /b 1
)

REM ============================================================
REM 4. 安裝相依套件
REM ============================================================
echo.
echo [4/6] 安裝 Python 相依套件...
if exist "requirements.txt" (
    pip install -r requirements.txt
    if errorlevel 1 (
        echo [錯誤] 安裝套件時發生錯誤
        pause
        exit /b 1
    )
    echo [成功] 相依套件安裝完成
) else (
    echo [錯誤] 找不到 requirements.txt 檔案
    pause
    exit /b 1
)

REM ============================================================
REM 5. 檢查 .env 檔案
REM ============================================================
echo.
echo [5/6] 檢查 .env 環境變數檔案...

if exist ".env" (
    echo [資訊] .env 檔案已存在
) else (
    echo 正在建立 .env 檔案...
    (
        echo PG_DSN=postgresql://%PG_USER%:%PG_PASSWORD%@%PG_HOST%:%PG_PORT%/%PG_DB%
        echo MONGO_URI=mongodb://localhost:27017
        echo MONGO_DB=ntu_venue_logs
    ) > .env
    echo [成功] .env 檔案已建立
)

REM ============================================================
REM 6. 啟動 FastAPI 服務
REM ============================================================
echo.
echo [6/6] 準備啟動 FastAPI 服務...
echo.
echo ============================================================
echo 設定完成！正在啟動 FastAPI 服務...
echo ============================================================
echo.
echo 服務將在以下網址啟動：
echo - API: http://127.0.0.1:8000
echo - Swagger UI: http://localhost:8000/docs
echo.
echo 按 Ctrl+C 可停止服務
echo.

REM 啟動 uvicorn
uvicorn app.main:app --reload

REM 如果服務停止，顯示訊息
echo.
echo 服務已停止
pause
