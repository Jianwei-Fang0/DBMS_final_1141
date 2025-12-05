# client.py
import sys
import requests
from typing import Optional


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
    print("\n=== 查詢可借場地 ===")
    date = input_date("請輸入日期 (YYYY-MM-DD): ")
    start = input_time("請輸入開始時間 (HH:MM): ")
    end = input_time("請輸入結束時間 (HH:MM): ")

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
        return

    if resp.status_code != 200:
        print("[錯誤] 查詢可借場地失敗")
        show_error(resp)
        return

    data = resp.json().get("data", [])
    if not data:
        print("此時段沒有可借場地。")
        return

    print(f"\n查詢結果（共 {len(data)} 筆）：")
    for row in data:
        venue_id = row.get("venue_id")
        name = row.get("name") or row.get("venue_name")
        capacity = row.get("capacity")
        building = row.get("building_name") or row.get("building")
        print(f"- 場地ID: {venue_id}, 名稱: {name}, 大樓: {building}, 容納人數: {capacity}")
    print()


# === 功能 2：建立 booking ===
def action_create_booking(user_id: int):
    print("\n=== 建立預約 ===")
    venue_id = int(input_nonempty("請輸入場地 ID: "))
    date = input_date("請輸入日期 (YYYY-MM-DD): ")
    start = input_time("請輸入開始時間 (HH:MM): ")
    end = input_time("請輸入結束時間 (HH:MM): ")
    people_str = input_nonempty("請輸入人數: ")
    try:
        people = int(people_str)
    except ValueError:
        print("[錯誤] 人數必須是整數")
        return

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
        return

    if resp.status_code != 200:
        print("[錯誤] 建立預約失敗")
        show_error(resp)
        return

    body = resp.json()
    print("\n建立成功：")
    print(f"- booking_id : {body.get('booking_id')}")
    print(f"- amount_est : {body.get('amount_est')}")
    print()


# === 功能 3：查詢自己的訂單 ===
def action_list_bookings(user_id: int):
    print("\n=== 查詢我的訂單 ===")
    status = input("想過濾某種狀態嗎？(直接 Enter 跳過，例如填 Pending/Approved/Cancelled): ").strip() or None

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
        return

    if resp.status_code != 200:
        print("[錯誤] 查詢我的訂單失敗")
        show_error(resp)
        return

    rows = resp.json().get("data", [])
    if not rows:
        print("目前沒有符合條件的訂單。")
        return

    print(f"\n找到 {len(rows)} 筆訂單：")
    for row in rows:
        bid = row.get("booking_id")
        venue_id = row.get("venue_id")
        venue_name = row.get("venue_name")
        date = row.get("date")
        start = row.get("start_time")
        end = row.get("end_time")
        status = row.get("status")
        amount = row.get("amount_est")
        print(f"- booking_id={bid}, 場地: {venue_id} {venue_name}, 日期: {date} {start}~{end}, 狀態: {status}, 預估金額: {amount}")
    print()


# === 功能 4：取消自己的訂單 ===
def action_cancel_booking(user_id: int):
    print("\n=== 取消我的訂單 ===")
    bid_str = input_nonempty("請輸入要取消的 booking_id: ")
    try:
        booking_id = int(bid_str)
    except ValueError:
        print("[錯誤] booking_id 必須是整數")
        return

    url = f"{BASE_URL}/api/v1/bookings/{booking_id}/cancel"
    params = {
        "user_id": user_id,
    }

    try:
        resp = requests.post(url, params=params, timeout=10)
    except Exception as e:
        print(f"[錯誤] 連線失敗: {e}")
        return

    if resp.status_code != 200:
        print("[錯誤] 取消訂單失敗")
        show_error(resp)
        return

    body = resp.json()
    print("\n取消成功：")
    print(f"- booking_id : {body.get('booking_id')}")
    print(f"- status     : {body.get('status')}")
    print()


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
        print("1. 查詢可借場地")
        print("2. 建立預約")
        print("3. 查詢我的訂單")
        print("4. 取消我的訂單")
        print("0. 離開")
        choice = input("請選擇功能：").strip()

        if choice == "1":
            action_search_availability(user_id)
            press_enter()
        elif choice == "2":
            action_create_booking(user_id)
            press_enter()
        elif choice == "3":
            action_list_bookings(user_id)
            press_enter()
        elif choice == "4":
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
