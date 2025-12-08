#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
NTU Venue Booking CLI - 主入口
"""
import sys
import os
import io
import requests
from typing import Optional

# ===== 設定路徑（確保可以導入 app 模組）=====
# 將專案根目錄加入 sys.path
project_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
if project_root not in sys.path:
    sys.path.insert(0, project_root)

# ===== 設定 UTF-8 編碼（解決 Windows 中文顯示問題）=====
if sys.platform == 'win32':
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')
    sys.stderr = io.TextIOWrapper(sys.stderr.buffer, encoding='utf-8')

# ===== 配置 =====
BASE_URL = "http://127.0.0.1:8000"  # 後端 API 位址


# ===== 工具函數 =====
def input_nonempty(prompt: str) -> str:
    """輸入非空字串"""
    while True:
        try:
            s = input(prompt).strip()
            if s:
                return s
            print("輸入不能為空，請重新輸入。")
        except KeyboardInterrupt:
            print("\n操作已取消")
            sys.exit(0)
        except EOFError:
            print("\n輸入結束")
            sys.exit(0)


def input_int(prompt: str, min_value: Optional[int] = None) -> int:
    """輸入整數"""
    while True:
        try:
            value = input_nonempty(prompt)
            num = int(value)
            if min_value is not None and num < min_value:
                print(f"數值必須 >= {min_value}，請重新輸入。")
                continue
            return num
        except ValueError:
            print("必須輸入數字，請重新輸入。")
        except KeyboardInterrupt:
            print("\n操作已取消")
            sys.exit(0)


def press_enter():
    """按 Enter 繼續"""
    try:
        input("\n按 Enter 繼續...")
    except KeyboardInterrupt:
        print("\n操作已取消")
        sys.exit(0)


def show_error(resp: requests.Response):
    """顯示 API 錯誤資訊"""
    print(f"\n[錯誤 HTTP {resp.status_code}]")
    try:
        error_detail = resp.json().get("detail", {})
        if isinstance(error_detail, dict):
            code = error_detail.get("code", "UNKNOWN_ERROR")
            error_msg = error_detail.get("error", str(error_detail))
            print(f"錯誤代碼: {code}")
            print(f"錯誤資訊: {error_msg}")
            
            # 針對常見錯誤的友善提示
            if code == "SLOT_RACE":
                print("💡 提示：時段已被其他人搶先預約")
            elif code == "ILLEGAL_STATUS":
                print("💡 提示：訂單狀態已改變，請重新查詢")
            elif code == "BOOKING_CONFLICT":
                print("💡 提示：與其他已核准訂單時間衝突")
        else:
            print(error_detail)
    except Exception:
        print(resp.text)


def test_connection() -> bool:
    """測試後端連線"""
    try:
        # 嘗試存取 API 根路徑或健康檢查端點
        resp = requests.get(f"{BASE_URL}/docs", timeout=5)
        return True
    except requests.exceptions.ConnectionError:
        print(f"\n❌ 無法連接到後端伺服器: {BASE_URL}")
        print("請確認後端服務已啟動：")
        print("  uvicorn app.main:app --reload")
        return False
    except Exception as e:
        print(f"\n❌ 連線測試失敗: {e}")
        return False


# ===== 登入相關 =====
def login_user() -> Optional[dict]:
    """使用者登入（統一登入，根據角色判斷身份）"""
    print("\n" + "="*50)
    print("登入")
    print("="*50)
    
    try:
        user_email = input_nonempty("請輸入註冊之email: ")
        password = input_nonempty("請輸入密碼: ")
    except (KeyboardInterrupt, EOFError):
        print("\n登入已取消")
        return None
    
    # 調用後端登入 API
    url = f"{BASE_URL}/api/v1/auth/login"
    try:
        resp = requests.post(
            url,
            json={"user_email": user_email, "password": password},
            timeout=10
        )
        
        # 處理 HTTP 錯誤響應
        if resp.status_code != 200:
            try:
                error_detail = resp.json().get("detail", {})
                if isinstance(error_detail, dict):
                    code = error_detail.get("code", "UNKNOWN_ERROR")
                    error_msg = error_detail.get("error", str(error_detail))
                    
                    # 針對不同錯誤代碼顯示友善提示
                    if code == "USER_NOT_FOUND":
                        print(f"\n❌ 錯誤：使用者 ID {user_email} 不存在")
                        print("💡 提示：請確認 user_id 是否正確")
                    elif code == "INVALID_PASSWORD":
                        print(f"\n❌ 錯誤：密碼錯誤")
                        print("💡 提示：請確認密碼是否正確")
                    elif code == "USER_FROZEN":
                        print(f"\n❌ 錯誤：帳號已凍結")
                        print("💡 提示：請聯繫管理員")
                    else:
                        print(f"\n❌ 錯誤代碼: {code}")
                        print(f"   錯誤資訊: {error_msg}")
                else:
                    print(f"\n❌ 登入失敗: {error_detail}")
            except Exception as parse_error:
                # 如果無法解析 JSON，顯示原始響應
                print(f"\n❌ 登入失敗 [HTTP {resp.status_code}]")
                print(f"   無法解析錯誤訊息: {parse_error}")
                if resp.text:
                    print(f"   原始響應: {resp.text[:200]}")
            
            # 暫停讓用戶看清楚錯誤訊息
            try:
                input("\n按 Enter 繼續...")
            except (KeyboardInterrupt, EOFError):
                pass
            return None
        
        # 解析成功響應
        try:
            result = resp.json()
        except ValueError as e:
            print(f"\n❌ 無法解析伺服器響應")
            print(f"   錯誤: {e}")
            print(f"   響應內容: {resp.text[:200]}")
            try:
                input("\n按 Enter 繼續...")
            except (KeyboardInterrupt, EOFError):
                pass
            return None
        
        # 檢查登入是否成功
        if result.get("success"):
            print(f"\n✓ 登入成功！")
            print(f"  姓名: {result.get('name')}")
            print(f"  Email: {result.get('email')}")
            roles = result.get('roles', [])
            if roles:
                print(f"  角色: {', '.join(roles)}")
            
            if result.get("is_admin"):
                print(f"  身份: 管理員")
            else:
                print(f"  身份: 使用者")
            
            return result
        else:
            print("\n❌ 登入失敗：伺服器返回 success=false")
            try:
                input("\n按 Enter 繼續...")
            except (KeyboardInterrupt, EOFError):
                pass
            return None
            
    except requests.exceptions.ConnectionError:
        print(f"\n❌ 無法連接到後端伺服器: {BASE_URL}")
        print("💡 提示：請確認後端服務是否已啟動")
        try:
            input("\n按 Enter 繼續...")
        except (KeyboardInterrupt, EOFError):
            pass
        return None
    except requests.exceptions.Timeout:
        print(f"\n❌ 連線逾時：無法在 10 秒內連接到伺服器")
        try:
            input("\n按 Enter 繼續...")
        except (KeyboardInterrupt, EOFError):
            pass
        return None
    except requests.exceptions.RequestException as e:
        print(f"\n❌ 網路請求錯誤: {e}")
        try:
            input("\n按 Enter 繼續...")
        except (KeyboardInterrupt, EOFError):
            pass
        return None
    except ValueError as e:
        print(f"\n❌ 資料格式錯誤: {e}")
        try:
            input("\n按 Enter 繼續...")
        except (KeyboardInterrupt, EOFError):
            pass
        return None
    except Exception as e:
        print(f"\n❌ 登入時發生未預期的錯誤: {e}")
        import traceback
        traceback.print_exc()
        try:
            input("\n按 Enter 繼續...")
        except (KeyboardInterrupt, EOFError):
            pass
        return None


def select_identity():
    """選擇身份（統一登入）"""
    print("\n" + "="*50)
    print("NTU Venue Booking CLI")
    print("="*50)
    print("\n請登入：")
    
    login_result = login_user()
    
    if login_result is None:
        return (None, None, None, None)
    
    # 根據 is_admin 判斷身份
    if login_result.get("is_admin"):
        return ("admin", login_result.get("user_id"), login_result.get("name"), login_result)
    else:
        return ("user", login_result.get("user_id"), login_result.get("name"), login_result)


# ===== 主函數 =====
def main():
    """主函數"""
    try:
        # 初始化 MongoDB（CLI 前置條件）
        try:
            from app.db.mongo import init_mongo
            init_mongo()
            print("✓ MongoDB 連線正常\n")
        except Exception as e:
            print(f"[警告] MongoDB 初始化失敗: {e}")
            print("操作日誌功能可能無法使用，但其他功能仍可正常運作\n")
        
        # 測試連線
        print("正在測試後端連線...")
        if not test_connection():
            print("\n請先啟動後端服務後再執行前端。")
            return
        
        print("✓ 後端連線正常\n")
        
        # 選擇身份並登入
        result = select_identity()
        
        if result[0] is None:
            return
        
        identity, user_id, name, login_info = result
        
        # 根據身份進入對應選單
        if identity == "user":
            from main.user_cli import user_main_menu
            user_main_menu(user_id, name, login_info)
        elif identity == "admin":
            from main.admin_cli import admin_main_menu
            # admin_main_menu 只接受 admin_id 和 login_info 兩個參數
            try:
                admin_main_menu(user_id, login_info)
            except TypeError as e:
                print(f"\n❌ 參數錯誤: {e}")
                print(f"   傳入的參數: user_id={user_id}, login_info={login_info}")
                import traceback
                traceback.print_exc()
                try:
                    input("\n按 Enter 結束程式...")
                except (KeyboardInterrupt, EOFError):
                    pass
                sys.exit(1)
            
    except KeyboardInterrupt:
        print("\n\n程式已中斷")
        sys.exit(0)
    except Exception as e:
        print(f"\n❌ 發生錯誤: {e}")
        import traceback
        traceback.print_exc()
        print("\n" + "="*50)
        print("錯誤詳情已顯示在上方")
        print("="*50)
        try:
            input("\n按 Enter 結束程式...")
        except (KeyboardInterrupt, EOFError):
            pass
        sys.exit(1)


if __name__ == "__main__":
    main()
