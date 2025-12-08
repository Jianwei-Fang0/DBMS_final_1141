# client.py
import sys
import requests
from typing import Optional
from collections import defaultdict
from datetime import datetime

BASE_URL = "http://127.0.0.1:8000"  # 如果你用別的 port/host 再改


def input_nonempty(prompt: str) -> str:
    while True:
        s = input(prompt).strip()
        if s:
            return s


def input_date(prompt: str = "日期 (YYYY-MM-DD): ") -> str:
    # 這裡先不做嚴格驗證，錯了就讓後端報錯
    return input_nonempty(prompt)


def input_time(prompt: str = "時間 (HH:MM): ") -> str:
    return input_nonempty(prompt)


def validate_date(date_str: str, format_str: str = "%Y-%m-%d") -> str:
    """
    驗證日期格式是否正確，必須是 YYYY-MM-DD 格式
    
    參數:
        date_str: 日期字串
        format_str: 日期格式，預設為 %Y-%m-%d (YYYY-MM-DD)
    
    返回:
        如果格式正確，返回原始字串
    
    拋出:
        ValueError: 如果日期格式不正確
    """
    try:
        datetime.strptime(date_str, format_str)
        return date_str
    except ValueError:
        raise ValueError(f"日期格式必須是 YYYY-MM-DD，例如：{datetime.now().strftime('%Y-%m-%d')}")


def validate_time(time_str: str, format_str: str = "%H:%M") -> str:
    """
    驗證時間格式是否正確
    
    參數:
        time_str: 時間字串
        format_str: 時間格式，預設為 %H:%M (HH:MM)
    
    返回:
        如果格式正確，返回原始字串
    
    拋出:
        ValueError: 如果時間格式不正確
    """
    try:
        datetime.strptime(time_str, format_str)
        return time_str
    except ValueError:
        raise ValueError(f"時間格式必須是 HH:MM，例如：14:30")


def press_enter():
    input("\n按 Enter 繼續...")




def show_error(resp: requests.Response):
    print(f"[HTTP {resp.status_code}]")
    try:
        print(resp.json())
    except Exception:
        print(resp.text)


# === 功能 1：查詢可借場地 ===
def action_search_availability(user_id: int):
    """
    查詢可借場地
    
    返回:
        tuple: (date, start, end) 如果成功，None 如果失敗
    """
    print("\n=== 查詢可借場地 ===")
    try:
        date = validate_date(input_date("請輸入日期 (YYYY-MM-DD): "))
        start = validate_time(input_time("請輸入開始時間 (HH:MM): "))
        end = validate_time(input_time("請輸入結束時間 (HH:MM): "))
    except ValueError as e:
        print(f"[錯誤] {e}")
        return None

    params = {
        "date": date,
        "start": start,
        "end": end,
    }

    url = f"{BASE_URL}/api/v1/venues/availability"
    try:
        resp = requests.get(url, params=params, timeout=10)
    except Exception as e:
        print(f"[錯誤] 連線失敗: {e}")
        return None

    if resp.status_code != 200:
        print("[錯誤] 查詢可借場地失敗")
        show_error(resp)
        return None

    data = resp.json().get("data", [])
    if not data:
        print("此時段沒有可借場地。")
        # 即使沒有結果，也返回查詢參數用於記錄
        return (date, start, end)

    print(f"\n查詢結果（共 {len(data)} 筆）：")   ## 讀
    for row in data:
        venue_id = row.get("venue_id")
        name = row.get("name") or row.get("venue_name")
        capacity = row.get("capacity")
        building = row.get("building_name") or row.get("building")
        print(f"- 場地ID: {venue_id}, 名稱: {name}, 大樓: {building}, 容納人數: {capacity}")
    print()
    
    # 返回查詢參數，用於記錄日誌
    return (date, start, end)


# === 功能 1-2：根據大樓查詢後7天可用場地 ===
def action_search_availability_by_building(user_id: int):
    """
    根據大樓查詢後7天可用場地
    
    返回:
        tuple: (date, building_id, people, venue_type) 如果成功，None 如果失敗
    """
    print("\n=== 根據大樓查詢後7天可用場地 ===")
    print("====請輸入想查詢的大樓ID:====\n")
    print("1. 新生教學館 (XSH)")
    print("2. 綜合教學館 (ZJG)")
    print("3. 共同教學館 (GTLB)")
    print("4. 博雅教學館 (BYH)")
    print("5. 普通教學館 (PTLB)")
    print("6. 第一學生活動中心 (SAC1)")
    print("7. 第二學生活動中心 (SAC2)")

    try:
        building_id_str = input_nonempty("請輸入大樓 ID: ")
        building_id = int(building_id_str)
    except ValueError:
        print("[錯誤] 大樓 ID 必須是整數")
        return None

    try:
        date = validate_date(input_date("請輸入起始日期 (YYYY-MM-DD): "))
    except ValueError as e:
        print(f"[錯誤] {e}")
        return None

    # 可選參數
    people = None
    
    venue_type =None

    params = {
        "date": date,
        "building_id": building_id,
    }
    if people is not None:
        params["people"] = people
    if venue_type:
        params["venue_type"] = venue_type

    url = f"{BASE_URL}/api/v1/venues/availability/by-building"
    try:
        resp = requests.get(url, params=params, timeout=10)
    except Exception as e:
        print(f"[錯誤] 連線失敗: {e}")
        return None

    if resp.status_code != 200:
        print("[錯誤] 查詢可借場地失敗")
        show_error(resp)
        return None

    data = resp.json().get("data", [])
    if not data:
        print("該大樓在後7天內沒有可借場地。")
        # 即使沒有結果，也返回查詢參數用於記錄
        return (date, building_id, people, venue_type)

    print(f"\n查詢結果（共 {len(data)} 筆）：")
    # 按日期分組顯示
    by_date = defaultdict(list)
    for row in data:
        available_date = row.get("available_date")
        by_date[available_date].append(row)

    for date_key in sorted(by_date.keys()):
        print(f"\n【日期: {date_key}】")
        for row in by_date[date_key]:
            venue_id = row.get("venue_id")
            name = row.get("name")
            venue_type_display = row.get("type")
            capacity = row.get("capacity")
            start_time = row.get("available_start_time")
            end_time = row.get("available_end_time")
            min_fee = row.get("min_fee_per_hour")
            max_fee = row.get("max_fee_per_hour")
            equipments = row.get("equipments", [])
            
            print(f"  - 場地ID: {venue_id}, 名稱: {name}, 類型: {venue_type_display}, 容納人數: {capacity}")
            print(f"    可用時間: {start_time} ~ {end_time}")
            if min_fee is not None or max_fee is not None:
                if min_fee == max_fee:
                    print(f"    費率: {min_fee} 元/小時")
                else:
                    print(f"    費率: {min_fee} ~ {max_fee} 元/小時")
            if equipments:
                print(f"    設備: {', '.join(equipments)}")
    print()
    
    # 返回查詢參數，用於記錄日誌
    return (date, building_id, people, venue_type)


# === 功能 2：建立 booking ===
def action_create_booking(user_id: int):
    """
    建立預約
    
    返回:
        dict: {"booking_id": int, "venue_id": int, "date": str, "start": str, "end": str, "people": int} 如果成功，None 如果失敗
    """
    print("\n=== 建立預約 ===")
    print("====以下為大樓ID(1-7)及名稱:====\n")
    print("1. 新生教學館 (XSH)")
    print("2. 綜合教學館 (ZJG)")
    print("3. 共同教學館 (GTLB)")
    print("4. 博雅教學館 (BYH)")
    print("5. 普通教學館 (PTLB)")
    print("6. 第一學生活動中心 (SAC1)")
    print("7. 第二學生活動中心 (SAC2)")

    # 1. 選擇大樓
    try:
        building_id_str = input_nonempty("請輸入大樓 ID (1-7): ")
        building_id = int(building_id_str)
        if building_id < 1 or building_id > 7:
            print("[錯誤] 大樓 ID 必須在 1-7 之間")
            return None
    except ValueError:
        print("[錯誤] 大樓 ID 必須是整數")
        return None

    # 2. 輸入日期和時間
    try:
        date = validate_date(input_date("請輸入日期 (YYYY-MM-DD): "))
        start = validate_time(input_time("請輸入開始時間 (HH:MM): "))
        end = validate_time(input_time("請輸入結束時間 (HH:MM): "))
    except ValueError as e:
        print(f"[錯誤] {e}")
        return None

    # 3. 輸入人數
    try:
        people_str = input_nonempty("請輸入人數: ")
        people = int(people_str)
    except ValueError:
        print("[錯誤] 人數必須是整數")
        return None

    # 4. 查詢該大樓在指定日期時間的可用場地（排除教室）
    print(f"\n正在查詢大樓 {building_id} 在 {date} {start}-{end} 的可用場地（排除教室）...")
    url = f"{BASE_URL}/api/v1/venues/availability"
    # 不傳 venue_type 參數，讓後端返回所有類型，然後在客戶端過濾掉 Classroom
    params = {
        "date": date,
        "start": start,
        "end": end,
        "people": people,
        "building_id": building_id,
    }
    
    try:
        resp = requests.get(url, params=params, timeout=10)
        if resp.status_code != 200:
            print("[錯誤] 查詢可用場地失敗")
            show_error(resp)
            return None
        
        all_venues = resp.json().get("data", [])
        # 過濾掉 Classroom 類型的場地
        available_venues = [v for v in all_venues]
        
        if not available_venues:
            print(f"\n❌ 大樓 {building_id} 在 {date} {start}-{end} 沒有可用的非教室場地")
            print("💡 提示：教室類型場地不可預約，請選擇其他大樓或時段")
            return None
        
        # 5. 顯示可用場地列表
        print(f"\n{'='*60}")
        print(f"可用場地列表（共 {len(available_venues)} 個）")
        print(f"{'='*60}")
        for i, v in enumerate(available_venues, 1):
            venue_id = v.get('venue_id')
            name = v.get('name', 'N/A')
            venue_type = v.get('type', 'N/A')
            capacity = v.get('capacity', 0)
            min_fee = v.get('min_fee_per_hour', 0)
            max_fee = v.get('max_fee_per_hour', 0)
            
            print(f"\n[{i}] 場地 ID: {venue_id}")
            print(f"    名稱: {name}")
            print(f"    類型: {venue_type}")
            print(f"    容納人數: {capacity}")
            if min_fee == max_fee:
                print(f"    費率: ${min_fee:.0f} 元/小時")
            else:
                print(f"    費率: ${min_fee:.0f} ~ ${max_fee:.0f} 元/小時")
        
        # 6. 讓用戶選擇場地
        print(f"\n{'='*60}")
        try:
            choice_str = input_nonempty(f"請選擇場地編號 (1-{len(available_venues)}): ")
            choice = int(choice_str)
            if choice < 1 or choice > len(available_venues):
                print(f"[錯誤] 請輸入 1-{len(available_venues)} 之間的數字")
                return None
            selected_venue = available_venues[choice - 1]
            venue_id = selected_venue.get('venue_id')
        except ValueError:
            print("[錯誤] 請輸入有效的數字")
            return None
        
    except Exception as e:
        print(f"[錯誤] 查詢失敗: {e}")
        return None

    # 7. 建立預約
    params = {
        "venue_id": venue_id,
        "date": date,
        "start": start,
        "end": end,
        "people": people,
        "user_id": user_id,
    }

    url = f"{BASE_URL}/api/v1/bookings"
    try:
        resp = requests.post(url, params=params, timeout=10)
    except Exception as e:
        print(f"[錯誤] 連線失敗: {e}")
        return None

    if resp.status_code != 200:
        print("[錯誤] 建立預約失敗")
        show_error(resp)
        return None

    try:
        body = resp.json()
    except Exception as e:
        print(f"[錯誤] 無法解析回應: {e}")
        return None

    print("\n建立成功：")
    booking_id = body.get('booking_id')
    amount_est = body.get('amount_est')
    print(f"- booking_id : {booking_id}")
    print(f"- amount_est : {amount_est}")
    print()
    
    # 返回參數，用於記錄日誌
    return {
        "booking_id": booking_id,
        "venue_id": venue_id,
        "date": date,
        "start": start,
        "end": end,
        "people": people,
    }


# === 功能 3：查詢自己的訂單 ===
def action_list_bookings(user_id: int):
    """
    查詢自己的訂單
    
    返回:
        tuple: (user_id, status) 如果成功，None 如果失敗
    """
    print("\n=== 查詢我的訂單 ===")
    try:
        status = input("想過濾某種狀態嗎？(直接 Enter 跳過，例如填 Pending/Approved/Cancelled): ").strip() or None
    except (KeyboardInterrupt, EOFError):
        print("\n操作已取消")
        return None

    params = {
        "user_id": user_id,
    }
    if status:
        params["status"] = status

    url = f"{BASE_URL}/api/v1/bookings"
    try:
        resp = requests.get(url, params=params, timeout=10)
    except Exception as e:
        print(f"[錯誤] 連線失敗: {e}")
        return None

    if resp.status_code != 200:
        print("[錯誤] 查詢我的訂單失敗")
        show_error(resp)
        return None

    try:
        rows = resp.json().get("data", [])
    except Exception as e:
        print(f"[錯誤] 無法解析回應: {e}")
        return None

    if not rows:
        print("目前沒有符合條件的訂單。")
        # 即使沒有結果，也返回查詢參數用於記錄
        return (user_id, status)

    print(f"\n找到 {len(rows)} 筆訂單：")
    for row in rows:
        bid = row.get("booking_id")
        venue_id = row.get("venue_id")
        venue_name = row.get("venue_name")
        date = row.get("date")
        start = row.get("start_time")
        end = row.get("end_time")
        status_display = row.get("status")
        amount = row.get("amount_est")
        print(f"- booking_id={bid}, 場地: {venue_id} {venue_name}, 日期: {date} {start}~{end}, 狀態: {status_display}, 預估金額: {amount}")
    print()
    
    # 返回查詢參數，用於記錄日誌
    return (user_id, status)


# === 功能 4：取消自己的訂單 ===
def action_cancel_booking(user_id: int):
    """
    取消自己的訂單
    
    返回:
        int: booking_id 如果成功，None 如果失敗
    """
    print("\n=== 取消我的訂單 ===")
    try:
        bid_str = input_nonempty("請輸入要取消的 booking_id: ")
        booking_id = int(bid_str)
    except ValueError:
        print("[錯誤] booking_id 必須是整數")
        return None
    except (KeyboardInterrupt, EOFError):
        print("\n操作已取消")
        return None

    url = f"{BASE_URL}/api/v1/bookings/{booking_id}/cancel"
    params = {
        "user_id": user_id,
    }

    try:
        resp = requests.post(url, params=params, timeout=10)
    except Exception as e:
        print(f"[錯誤] 連線失敗: {e}")
        return None

    if resp.status_code != 200:
        print("[錯誤] 取消訂單失敗")
        show_error(resp)
        return None

    try:
        body = resp.json()
    except Exception as e:
        print(f"[錯誤] 無法解析回應: {e}")
        return None

    print("\n取消成功：")
    print(f"- booking_id : {body.get('booking_id')}")
    print(f"- status     : {body.get('status')}")
    print()
    
    # 返回 booking_id，用於記錄日誌
    return booking_id


def main():
    print("=== NTU Venue Booking CLI ===")
    print("（這個 CLI 是專門用來打我們的 FastAPI 後端）\n")

    # 模擬登入：輸入 user_id
    while True:
        user_str = input_nonempty("請輸入你的 user_id（例如 1）：")
        try:
            user_id = int(user_str)
            break
        except ValueError:
            print("user_id 必須是整數，請重新輸入。")

    print(f"\n歡迎，user_id = {user_id}")
    print(f"後端伺服器: {BASE_URL}\n")

    while True:
        print("==== 主選單 ====")
        print("1. 查詢可借場地（指定時間段）")
        print("2. 根據大樓查詢後7天可用場地")
        print("3. 建立預約")
        print("4. 查詢我的訂單")
        print("5. 取消我的訂單")
        print("0. 離開")
        choice = input("請選擇功能：").strip()

        if choice == "1":
            action_search_availability(user_id)
            press_enter()
        elif choice == "2":
            action_search_availability_by_building(user_id)
            press_enter()
        elif choice == "3":
            action_create_booking(user_id)
            press_enter()
        elif choice == "4":
            action_list_bookings(user_id)
            press_enter()
        elif choice == "5":
            action_cancel_booking(user_id)
            press_enter()
        elif choice == "0":
            print("再見！")
            break
        else:
            print("無效的選項，請重新選擇。\n")


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n中斷程式。")
        sys.exit(0)
