# admin_client.py
"""
管理員端 CLI 功能函數
通過 HTTP 請求調用 FastAPI 後端
"""
import sys
import requests
from typing import Optional, Dict, Any, List
from datetime import datetime, date, time

BASE_URL = "http://127.0.0.1:8000"


def input_nonempty(prompt: str) -> str:
    """輸入非空字串"""
    while True:
        try:
            s = input(prompt).strip()
            if s:
                return s
        except (KeyboardInterrupt, EOFError):
            print("\n操作已取消")
            raise


def input_optional(prompt: str) -> Optional[str]:
    """輸入可選字串（可為空）"""
    try:
        return input(prompt).strip() or None
    except (KeyboardInterrupt, EOFError):
        print("\n操作已取消")
        raise


def input_int(prompt: str, min_value: Optional[int] = None, allow_cancel: bool = True) -> Optional[int]:
    """輸入整數，支援取消操作"""
    while True:
        try:
            value = input_nonempty(prompt)
            num = int(value)
            if min_value is not None and num < min_value:
                print(f"數值必須 >= {min_value}，請重新輸入。")
                continue
            return num
        except (KeyboardInterrupt, EOFError):
            if allow_cancel:
                print("\n操作已取消")
                return None
            raise
        except ValueError:
            print("必須輸入數字，請重新輸入。")


def input_float(prompt: str, min_value: Optional[float] = None, allow_cancel: bool = True) -> Optional[float]:
    """輸入浮點數，支援取消操作"""
    while True:
        try:
            value = input_nonempty(prompt)
            num = float(value)
            if min_value is not None and num < min_value:
                print(f"數值必須 >= {min_value}，請重新輸入。")
                continue
            return num
        except (KeyboardInterrupt, EOFError):
            if allow_cancel:
                print("\n操作已取消")
                return None
            raise
        except ValueError:
            print("必須輸入數字，請重新輸入。")


def input_date(prompt: str = "日期 (YYYY-MM-DD): ", allow_cancel: bool = True, allow_empty: bool = False) -> Optional[date]:
    """輸入日期，支援取消操作和可選輸入"""
    while True:
        try:
            if allow_empty:
                date_str = input_optional(prompt)
                if date_str is None:
                    return None
            else:
                date_str = input_nonempty(prompt)
            return date.fromisoformat(date_str)
        except (KeyboardInterrupt, EOFError):
            if allow_cancel:
                print("\n操作已取消")
                return None
            raise
        except ValueError:
            print(f"日期格式必須是 YYYY-MM-DD，例如：{date.today().isoformat()}")


def input_time(prompt: str = "時間 (HH:MM): ", allow_cancel: bool = True, allow_empty: bool = False) -> Optional[time]:
    """輸入時間，支援取消操作和可選輸入"""
    while True:
        try:
            if allow_empty:
                time_str = input_optional(prompt)
                if time_str is None:
                    return None
            else:
                time_str = input_nonempty(prompt)
            return time.fromisoformat(time_str)
        except (KeyboardInterrupt, EOFError):
            if allow_cancel:
                print("\n操作已取消")
                return None
            raise
        except ValueError:
            print("時間格式必須是 HH:MM，例如：14:30")


def input_int_optional(prompt: str) -> Optional[int]:
    """輸入可選整數（可為空）"""
    while True:
        try:
            value = input_optional(prompt)
            if value is None:
                return None
            return int(value)
        except (KeyboardInterrupt, EOFError):
            print("\n操作已取消")
            raise
        except ValueError:
            print("[錯誤] 請輸入有效的整數，或直接按 Enter 跳過")
            continue


def show_error(resp: requests.Response):
    """顯示 API 錯誤資訊"""
    print(f"[HTTP {resp.status_code}]")
    try:
        error_detail = resp.json().get("detail", {})
        if isinstance(error_detail, dict):
            code = error_detail.get("code", "UNKNOWN_ERROR")
            error_msg = error_detail.get("error", str(error_detail))
            print(f"錯誤代碼: {code}")
            print(f"錯誤資訊: {error_msg}")
        else:
            print(error_detail)
    except Exception:
        print(resp.text)


# ===== Admin Booking 功能 =====

def action_list_pending_bookings(admin_id: int, operator: Optional[str] = None):
    """列出待審訂單"""
    url = f"{BASE_URL}/api/v1/admin/bookings/pending"
    params = {
        "limit": 50,
        "offset": 0,
        "operator_id": admin_id,
    }
    if operator:
        params["operator"] = operator
    
    headers = {"User-Agent": "admin_cli"}
    
    try:
        resp = requests.get(url, params=params, headers=headers, timeout=10)
        if resp.status_code != 200:
            print("[錯誤] 查詢待審訂單失敗")
            show_error(resp)
            return None
        
        data = resp.json().get("data", [])
        if not data:
            print("\n目前沒有待審的訂單")
            return None
        
        print(f"\n{'='*60}")
        print("待審訂單清單")
        print(f"{'='*60}")
        for i, b in enumerate(data, 1):
            print(f"\n[{i}] 訂單 ID: {b['booking_id']}")
            print(f"    申請人: {b.get('applicant_name', 'N/A')}")
            print(f"    場地: {b.get('venue_name', 'N/A')}")
            print(f"    用途: {b.get('purpose', 'N/A')}")
            print(f"    日期: {b.get('date', 'N/A')} {b.get('start_time', 'N/A')}-{b.get('end_time', 'N/A')}")
            print(f"    人數: {b.get('people', 'N/A')}")
            print(f"    預估金額: ${b.get('amount_est', 0):.2f}")
            print(f"    押金: ${b.get('deposit', 0):.2f}")
            print(f"    建立時間: {b.get('created_at', 'N/A')}")
        
        return data
    except Exception as e:
        print(f"[錯誤] 查詢失敗: {e}")
        return None


def action_get_booking_preview(admin_id: int, operator: Optional[str] = None):
    """查看訂單預覽（分頁）"""
    page = input_int("請輸入頁數（預設 1）: ", min_value=1) or 1
    if page is None:
        page = 1
    
    url = f"{BASE_URL}/api/v1/admin/bookings/preview"
    params = {
        "page": page,
        "limit": 20,
        "operator_id": admin_id,
    }
    if operator:
        params["operator"] = operator
    
    headers = {"User-Agent": "admin_cli"}
    
    try:
        resp = requests.get(url, params=params, headers=headers, timeout=10)
        if resp.status_code != 200:
            print("[錯誤] 查詢訂單預覽失敗")
            show_error(resp)
            return None
        
        result = resp.json()
        bookings = result.get("data", [])
        pagination = result.get("pagination", {})
        
        if not bookings:
            print("\n目前沒有訂單")
            return None
        
        print(f"\n{'='*60}")
        print(f"訂單預覽 - 第 {pagination.get('page', 1)} 頁 / 共 {pagination.get('total_pages', 1)} 頁")
        print(f"總共 {pagination.get('total', 0)} 筆訂單")
        print(f"{'='*60}")
        
        for i, b in enumerate(bookings, 1):
            print(f"\n[{i}] 訂單 ID: {b['booking_id']}")
            print(f"    申請人: {b.get('applicant_name', 'N/A')}")
            print(f"    聯絡方式: {b.get('applicant_email', 'N/A')} / {b.get('applicant_phone', 'N/A')}")
            print(f"    組織: {b.get('org_name', 'N/A')}")
            print(f"    角色: {', '.join(b.get('user_roles', [])) if b.get('user_roles') else 'N/A'}")
            print(f"    場地: {b.get('venue_name', 'N/A')} ({b.get('venue_type', 'N/A')})")
            print(f"    用途: {b.get('purpose', 'N/A')}")
            print(f"    日期: {b.get('date', 'N/A')} {b.get('start_time', 'N/A')}-{b.get('end_time', 'N/A')}")
            print(f"    人數: {b.get('people', 'N/A')}")
            print(f"    狀態: {b.get('status', 'N/A')}")
            print(f"    預估金額: ${b.get('amount_est', 0):.2f}")
            print(f"    押金: ${b.get('deposit', 0):.2f}")
        
        print(f"\n分頁資訊: 第 {pagination.get('page', 1)} 頁 / 共 {pagination.get('total_pages', 1)} 頁")
        print(f"顯示 {len(bookings)} 筆，總共 {pagination.get('total', 0)} 筆")
        
        return result
    except Exception as e:
        print(f"[錯誤] 查詢失敗: {e}")
        return None


def action_get_booking_detail(admin_id: int, operator: Optional[str] = None):
    """查看訂單詳情"""
    booking_id = input_int("請輸入訂單 ID: ")
    if booking_id is None:
        return None
    
    url = f"{BASE_URL}/api/v1/admin/bookings/{booking_id}"
    params = {
        "operator_id": admin_id,
    }
    if operator:
        params["operator"] = operator
    
    headers = {"User-Agent": "admin_cli"}
    
    try:
        resp = requests.get(url, params=params, headers=headers, timeout=10)
        if resp.status_code != 200:
            print("[錯誤] 查詢訂單詳情失敗")
            show_error(resp)
            return None
        
        detail = resp.json().get("data", {})
        if not detail:
            print("\n找不到該訂單")
            return None
        
        print(f"\n{'='*60}")
        print(f"訂單詳情 - ID: {detail['booking_id']}")
        print(f"{'='*60}")
        print(f"申請人: {detail.get('applicant_name', 'N/A')}")
        print(f"聯絡方式: {detail.get('applicant_email', 'N/A')} / {detail.get('applicant_phone', 'N/A')}")
        print(f"組織: {detail.get('org_name', 'N/A')}")
        print(f"角色: {', '.join(detail.get('user_roles', [])) if detail.get('user_roles') else 'N/A'}")
        print(f"場地: {detail.get('venue_name', 'N/A')} ({detail.get('venue_type', 'N/A')})")
        print(f"建築: {detail.get('building_name', 'N/A')}")
        print(f"用途: {detail.get('purpose', 'N/A')}")
        print(f"日期: {detail.get('date', 'N/A')}")
        print(f"時間: {detail.get('start_time', 'N/A')} - {detail.get('end_time', 'N/A')}")
        print(f"人數: {detail.get('people', 'N/A')}")
        print(f"狀態: {detail.get('status', 'N/A')}")
        print(f"預估金額: ${detail.get('amount_est', 0):.2f}")
        print(f"押金: ${detail.get('deposit', 0):.2f}")
        print(f"建立時間: {detail.get('booking_created_at', 'N/A')}")
        
        return detail
    except Exception as e:
        print(f"[錯誤] 查詢失敗: {e}")
        return None


def action_approve_booking(admin_id: int, operator: Optional[str] = None):
    """核准訂單"""
    booking_id = input_int("請輸入訂單 ID: ")
    if booking_id is None:
        return None
    
    url = f"{BASE_URL}/api/v1/admin/bookings/{booking_id}/approve"
    params = {
        "operator_id": admin_id,
    }
    if operator:
        params["operator"] = operator
    
    headers = {"User-Agent": "admin_cli"}
    body = {
        "step": 1,
        "comment": None,
        "final": True,
    }
    
    try:
        resp = requests.post(url, params=params, json=body, headers=headers, timeout=10)
        if resp.status_code != 200:
            print("[錯誤] 核准訂單失敗")
            show_error(resp)
            return None
        
        result = resp.json().get("result", {})
        if result.get("success"):
            print(f"\n✓ 訂單 {booking_id} 已核准")
            booking = result.get("booking", {})
            print(f"  狀態: {booking.get('status')}")
            return booking_id
        else:
            print(f"\n❌ 操作失敗: {result.get('error', '未知錯誤')}")
            return None
    except Exception as e:
        print(f"[錯誤] 操作失敗: {e}")
        return None


def action_reject_booking(admin_id: int, operator: Optional[str] = None):
    """駁回訂單"""
    booking_id = input_int("請輸入訂單 ID: ")
    if booking_id is None:
        return None
    
    reason = input_optional("請輸入駁回原因（可選，直接按 Enter 跳過）: ")
    
    url = f"{BASE_URL}/api/v1/admin/bookings/{booking_id}/reject"
    params = {
        "operator_id": admin_id,
    }
    if operator:
        params["operator"] = operator
    
    headers = {"User-Agent": "admin_cli"}
    body = {
        "step": 1,
        "comment": reason,
    }
    
    try:
        resp = requests.post(url, params=params, json=body, headers=headers, timeout=10)
        if resp.status_code != 200:
            print("[錯誤] 駁回訂單失敗")
            show_error(resp)
            return None
        
        result = resp.json().get("result", {})
        if result.get("success"):
            print(f"\n✓ 訂單 {booking_id} 已駁回")
            booking = result.get("booking", {})
            print(f"  狀態: {booking.get('status')}")
            return booking_id
        else:
            print(f"\n❌ 操作失敗: {result.get('error', '未知錯誤')}")
            return None
    except Exception as e:
        print(f"[錯誤] 操作失敗: {e}")
        return None


def action_request_changes(admin_id: int, operator: Optional[str] = None):
    """要求補件"""
    booking_id = input_int("請輸入訂單 ID: ")
    if booking_id is None:
        return None
    
    comment = input_nonempty("請輸入補件要求: ")
    
    url = f"{BASE_URL}/api/v1/admin/bookings/{booking_id}/request-changes"
    params = {
        "operator_id": admin_id,
    }
    if operator:
        params["operator"] = operator
    
    headers = {"User-Agent": "admin_cli"}
    body = {
        "step": 1,
        "comment": comment,
    }
    
    try:
        resp = requests.post(url, params=params, json=body, headers=headers, timeout=10)
        if resp.status_code != 200:
            print("[錯誤] 要求補件失敗")
            show_error(resp)
            return None
        
        result = resp.json().get("result", {})
        if result.get("success"):
            print(f"\n✓ 已要求訂單 {booking_id} 補件")
            booking = result.get("booking", {})
            print(f"  狀態: {booking.get('status')}")
            return booking_id
        else:
            print(f"\n❌ 操作失敗: {result.get('error', '未知錯誤')}")
            return None
    except Exception as e:
        print(f"[錯誤] 操作失敗: {e}")
        return None


def action_modify_booking(admin_id: int, operator: Optional[str] = None):
    """修改訂單"""
    booking_id = input_int("請輸入訂單 ID: ")
    if booking_id is None:
        return None
    
    print("\n請輸入要修改的欄位（直接按 Enter 跳過）：")
    new_date = input_date("日期 (YYYY-MM-DD): ", allow_cancel=False, allow_empty=True)
    new_start_time = input_time("開始時間 (HH:MM): ", allow_cancel=False, allow_empty=True)
    new_end_time = input_time("結束時間 (HH:MM): ", allow_cancel=False, allow_empty=True)
    new_people = input_int_optional("人數: ")
    new_venue_id = input_int_optional("場地 ID: ")
    
    if not any([new_date, new_start_time, new_end_time, new_people, new_venue_id]):
        print("[錯誤] 至少需要修改一個欄位")
        return None
    
    url = f"{BASE_URL}/api/v1/admin/bookings/{booking_id}/modify"
    params = {
        "operator_id": admin_id,
    }
    if operator:
        params["operator"] = operator
    
    headers = {"User-Agent": "admin_cli"}
    body = {
        "new_date": str(new_date) if new_date else None,
        "new_start_time": str(new_start_time) if new_start_time else None,
        "new_end_time": str(new_end_time) if new_end_time else None,
        "new_people": new_people,
        "new_venue_id": new_venue_id,
    }
    # 移除 None 值
    body = {k: v for k, v in body.items() if v is not None}
    
    try:
        resp = requests.post(url, params=params, json=body, headers=headers, timeout=10)
        if resp.status_code != 200:
            print("[錯誤] 修改訂單失敗")
            show_error(resp)
            return None
        
        result = resp.json().get("result", {})
        if result.get("success"):
            print(f"\n✓ 訂單 {booking_id} 已修改")
            booking = result.get("booking", {})
            print(f"  狀態: {booking.get('status')}")
            return booking_id
        else:
            print(f"\n❌ 操作失敗: {result.get('error', '未知錯誤')}")
            return None
    except Exception as e:
        print(f"[錯誤] 操作失敗: {e}")
        return None


# ===== Admin Fund 功能 =====

def action_list_pending_payments(admin_id: int, operator: Optional[str] = None):
    """列出待處理付款"""
    url = f"{BASE_URL}/api/v1/admin/fund/payments/pending"
    params = {
        "limit": 50,
        "offset": 0,
        "operator_id": admin_id,
    }
    if operator:
        params["operator"] = operator
    
    headers = {"User-Agent": "admin_cli"}
    
    try:
        resp = requests.get(url, params=params, headers=headers, timeout=10)
        if resp.status_code != 200:
            print("[錯誤] 查詢待處理付款失敗")
            show_error(resp)
            return None
        
        payments = resp.json().get("data", [])
        if not payments:
            print("\n目前沒有待處理的付款")
            return None
        
        print(f"\n{'='*60}")
        print("待處理付款清單")
        print(f"{'='*60}")
        for i, p in enumerate(payments, 1):
            print(f"\n[{i}] 付款 ID: {p['payment_id']}")
            print(f"    訂單 ID: {p['booking_id']}")
            print(f"    申請人: {p.get('applicant_name', 'N/A')}")
            print(f"    場地: {p.get('venue_name', 'N/A')}")
            print(f"    用途: {p.get('purpose', 'N/A')}")
            print(f"    日期: {p.get('date', 'N/A')} {p.get('start_time', 'N/A')}-{p.get('end_time', 'N/A')}")
            print(f"    金額: ${p.get('amount', 0):.2f}")
            print(f"    付款方式: {p.get('method', 'N/A')}")
            print(f"    類型: {p.get('type', 'N/A')}")
            print(f"    建立時間: {p.get('created_at', 'N/A')}")
        
        return payments
    except Exception as e:
        print(f"[錯誤] 查詢失敗: {e}")
        return None


def action_mark_payment_succeeded(admin_id: int, operator: Optional[str] = None):
    """標記付款成功"""
    payment_id = input_int("請輸入付款 ID: ")
    if payment_id is None:
        return None
    
    url = f"{BASE_URL}/api/v1/admin/fund/payments/{payment_id}/succeed"
    params = {
        "operator_id": admin_id,
    }
    if operator:
        params["operator"] = operator
    
    headers = {"User-Agent": "admin_cli"}
    
    try:
        resp = requests.post(url, params=params, headers=headers, timeout=10)
        if resp.status_code != 200:
            print("[錯誤] 標記付款成功失敗")
            show_error(resp)
            return None
        
        result = resp.json().get("result", {})
        if result.get("success"):
            print(f"\n✓ 付款 {payment_id} 已標記為成功")
            payment = result.get("payment", {})
            print(f"  狀態: {payment.get('status')}")
            return payment_id
        else:
            print(f"\n❌ 操作失敗: {result.get('error', '未知錯誤')}")
            return None
    except Exception as e:
        print(f"[錯誤] 操作失敗: {e}")
        return None


def action_create_refund(admin_id: int, operator: Optional[str] = None):
    """建立退款"""
    payment_id = input_int("請輸入付款 ID: ")
    if payment_id is None:
        return None
    
    amount = input_float("請輸入退款金額: ")
    if amount is None:
        return None
    
    reason = input_optional("請輸入退款原因（可選，直接按 Enter 跳過）: ")
    
    url = f"{BASE_URL}/api/v1/admin/fund/refunds"
    params = {
        "operator_id": admin_id,
    }
    if operator:
        params["operator"] = operator
    
    headers = {"User-Agent": "admin_cli"}
    body = {
        "payment_id": payment_id,
        "amount": amount,
        "reason": reason,
    }
    
    try:
        resp = requests.post(url, params=params, json=body, headers=headers, timeout=10)
        if resp.status_code != 200:
            print("[錯誤] 建立退款失敗")
            show_error(resp)
            return None
        
        result = resp.json().get("result", {})
        if result.get("success"):
            refund = result.get("refund", {})
            print(f"\n✓ 退款已建立")
            print(f"  退款 ID: {refund.get('refund_id')}")
            print(f"  付款 ID: {refund.get('payment_id')}")
            print(f"  金額: ${refund.get('amount', 0):.2f}")
            print(f"  原因: {refund.get('reason', '無')}")
            print(f"  狀態: {refund.get('status')}")
            return refund.get('refund_id')
        else:
            print(f"\n❌ 操作失敗: {result.get('error', '未知錯誤')}")
            return None
    except Exception as e:
        print(f"[錯誤] 操作失敗: {e}")
        return None


def action_mark_refund_succeeded(admin_id: int, operator: Optional[str] = None):
    """標記退款成功"""
    refund_id = input_int("請輸入退款 ID: ")
    if refund_id is None:
        return None
    
    url = f"{BASE_URL}/api/v1/admin/fund/refunds/{refund_id}/succeed"
    params = {
        "operator_id": admin_id,
    }
    if operator:
        params["operator"] = operator
    
    headers = {"User-Agent": "admin_cli"}
    
    try:
        resp = requests.post(url, params=params, headers=headers, timeout=10)
        if resp.status_code != 200:
            print("[錯誤] 標記退款成功失敗")
            show_error(resp)
            return None
        
        result = resp.json().get("result", {})
        if result.get("success"):
            print(f"\n✓ 退款 {refund_id} 已標記為成功")
            refund = result.get("refund", {})
            payment = result.get("payment", {})
            print(f"  退款狀態: {refund.get('status')}")
            print(f"  付款 ID: {refund.get('payment_id')}")
            print(f"  付款狀態: {payment.get('status')}")
            return refund_id
        else:
            print(f"\n❌ 操作失敗: {result.get('error', '未知錯誤')}")
            return None
    except Exception as e:
        print(f"[錯誤] 操作失敗: {e}")
        return None


# ===== Admin Logs 功能 =====

def action_list_logs(admin_id: int, operator: Optional[str] = None):
    """列出操作日誌"""
    print("\n請選擇查詢條件（直接按 Enter 跳過）：")
    action = input_optional("操作類型 (例如: ADMIN_APPROVE_BOOKING): ")
    operator_id = input_int_optional("操作者 ID: ")
    
    start_str = input_optional("開始時間 (YYYY-MM-DD HH:MM:SS，可選): ")
    end_str = input_optional("結束時間 (YYYY-MM-DD HH:MM:SS，可選): ")
    
    url = f"{BASE_URL}/api/v1/admin/logs"
    params = {
        "limit": 100,
    }
    if action:
        params["action"] = action
    if operator_id:
        params["operator_id"] = operator_id
    if start_str:
        params["start"] = start_str
    if end_str:
        params["end"] = end_str
    
    try:
        resp = requests.get(url, params=params, timeout=10)
        if resp.status_code != 200:
            print("[錯誤] 查詢操作日誌失敗")
            show_error(resp)
            return None
        
        logs = resp.json().get("data", [])
        if not logs:
            print("\n沒有找到符合條件的日誌")
            return None
        
        print(f"\n{'='*60}")
        print(f"操作日誌（共 {len(logs)} 筆）")
        print(f"{'='*60}")
        for i, log in enumerate(logs, 1):
            print(f"\n[{i}] 時間: {log.get('timestamp', 'N/A')}")
            print(f"    操作: {log.get('action', 'N/A')}")
            print(f"    操作者: {log.get('operator', 'N/A')} (ID: {log.get('operator_id', 'N/A')})")
            print(f"    詳情: {log.get('detail', {})}")
        
        return logs
    except Exception as e:
        print(f"[錯誤] 查詢失敗: {e}")
        return None


def action_list_logs_for_booking(admin_id: int, operator: Optional[str] = None):
    """查看訂單相關日誌"""
    booking_id = input_int("請輸入訂單 ID: ")
    if booking_id is None:
        return None
    
    url = f"{BASE_URL}/api/v1/admin/logs/booking/{booking_id}"
    params = {"limit": 100}
    
    try:
        resp = requests.get(url, params=params, timeout=10)
        if resp.status_code != 200:
            print("[錯誤] 查詢訂單相關日誌失敗")
            show_error(resp)
            return None
        
        logs = resp.json().get("data", [])
        if not logs:
            print(f"\n訂單 {booking_id} 沒有相關日誌")
            return None
        
        print(f"\n{'='*60}")
        print(f"訂單 {booking_id} 的操作日誌（共 {len(logs)} 筆）")
        print(f"{'='*60}")
        for i, log in enumerate(logs, 1):
            print(f"\n[{i}] 時間: {log.get('timestamp', 'N/A')}")
            print(f"    操作: {log.get('action', 'N/A')}")
            print(f"    操作者: {log.get('operator', 'N/A')}")
            print(f"    詳情: {log.get('detail', {})}")
        
        return logs
    except Exception as e:
        print(f"[錯誤] 查詢失敗: {e}")
        return None


def action_stats_logs(admin_id: int, operator: Optional[str] = None):
    """查看日誌統計"""
    days = input_int("請輸入查詢天數（預設 7）: ", min_value=1) or 7
    if days is None:
        days = 7
    
    url = f"{BASE_URL}/api/v1/admin/logs/stats"
    params = {"days": days}
    
    try:
        resp = requests.get(url, params=params, timeout=10)
        if resp.status_code != 200:
            print("[錯誤] 查詢日誌統計失敗")
            show_error(resp)
            return None
        
        stats = resp.json().get("data", {})
        if not stats:
            print(f"\n過去 {days} 天沒有日誌記錄")
            return None
        
        print(f"\n{'='*60}")
        print(f"過去 {days} 天的操作統計")
        print(f"{'='*60}")
        for action, count in stats.items():
            print(f"  {action}: {count} 次")
        
        return stats
    except Exception as e:
        print(f"[錯誤] 查詢失敗: {e}")
        return None


# ===== Admin Rules 功能 =====

def action_list_timeslot_rules(admin_id: int, operator: Optional[str] = None):
    """列出時段規則"""
    venue_id = input_int_optional("請輸入場地 ID（直接按 Enter 查看全部）: ")
    
    url = f"{BASE_URL}/api/v1/admin/rules/timeslot"
    params = {
        "operator_id": admin_id,
    }
    if operator:
        params["operator"] = operator
    if venue_id:
        params["venue_id"] = venue_id
    
    headers = {"User-Agent": "admin_cli"}
    
    try:
        resp = requests.get(url, params=params, headers=headers, timeout=10)
        if resp.status_code != 200:
            print("[錯誤] 查詢時段規則失敗")
            show_error(resp)
            return None
        
        rules = resp.json().get("data", [])
        if not rules:
            print("\n沒有找到時段規則")
            return None
        
        print(f"\n{'='*60}")
        print("時段規則清單")
        print(f"{'='*60}")
        for i, r in enumerate(rules, 1):
            print(f"\n[{i}] 規則 ID: {r['rule_id']}")
            print(f"    場地: {r.get('venue_name', 'N/A')} (ID: {r['venue_id']})")
            print(f"    星期: {r.get('weekday_name', 'N/A')}")
            print(f"    開放時間: {r.get('open_time', 'N/A')} - {r.get('close_time', 'N/A')}")
            print(f"    時段長度: {r.get('slot_minute', 'N/A')} 分鐘")
        
        return rules
    except Exception as e:
        print(f"[錯誤] 查詢失敗: {e}")
        return None


def action_list_rate_plans(admin_id: int, operator: Optional[str] = None):
    """列出費率方案"""
    url = f"{BASE_URL}/api/v1/admin/rules/rate-plans"
    params = {
        "operator_id": admin_id,
    }
    if operator:
        params["operator"] = operator
    
    headers = {"User-Agent": "admin_cli"}
    
    try:
        resp = requests.get(url, params=params, headers=headers, timeout=10)
        if resp.status_code != 200:
            print("[錯誤] 查詢費率方案失敗")
            show_error(resp)
            return None
        
        plans = resp.json().get("data", [])
        if not plans:
            print("\n沒有找到費率方案")
            return None
        
        print(f"\n{'='*60}")
        print("費率方案清單")
        print(f"{'='*60}")
        for i, p in enumerate(plans, 1):
            print(f"\n[{i}] 方案 ID: {p['plan_id']}")
            print(f"    場地: {p.get('venue_name', 'N/A')} (ID: {p['venue_id']})")
            print(f"    名稱: {p.get('name', 'N/A')}")
            print(f"    生效日期: {p.get('effective_date', 'N/A')}")
            print(f"    狀態: {p.get('status', 'N/A')}")
        
        return plans
    except Exception as e:
        print(f"[錯誤] 查詢失敗: {e}")
        return None


def action_list_price_rules(admin_id: int, operator: Optional[str] = None):
    """列出價格規則"""
    plan_id = input_int_optional("請輸入費率方案 ID（直接按 Enter 查看全部）: ")
    
    url = f"{BASE_URL}/api/v1/admin/rules/price"
    params = {
        "operator_id": admin_id,
    }
    if operator:
        params["operator"] = operator
    if plan_id:
        params["plan_id"] = plan_id
    
    headers = {"User-Agent": "admin_cli"}
    
    try:
        resp = requests.get(url, params=params, headers=headers, timeout=10)
        if resp.status_code != 200:
            print("[錯誤] 查詢價格規則失敗")
            show_error(resp)
            return None
        
        rules = resp.json().get("data", [])
        if not rules:
            print("\n沒有找到價格規則")
            return None
        
        print(f"\n{'='*60}")
        print("價格規則清單")
        print(f"{'='*60}")
        for i, r in enumerate(rules, 1):
            print(f"\n[{i}] 規則 ID: {r['rule_id']}")
            print(f"    方案: {r.get('plan_name', 'N/A')} (ID: {r['plan_id']})")
            print(f"    開始時間: {r.get('start_time', 'N/A')} - {r.get('end_time', 'N/A')}")
            print(f"    價格: ${r.get('price_per_hour', 0):.2f} / 小時")
        
        return rules
    except Exception as e:
        print(f"[錯誤] 查詢失敗: {e}")
        return None
