#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
使用者端 CLI
"""
import sys
from client import (
    action_search_availability,
    action_search_availability_by_building, 
    action_create_booking, 
    action_list_bookings,
    action_cancel_booking,
)
# 使用 app/db/mongo.py 中的 log 函數，它已經封裝好 MongoDB 連接
from app.db.mongo import log as log_to_mongo

BASE_URL = "http://127.0.0.1:8000"  # 後端 API 位址


def user_main_menu(user_id: int, user_name: str, login_info: dict = None):
    """使用者主選單"""
    while True:
        print(f"\n{'='*50}")
        print(f"使用者選單 - user_id: {user_id}")
        if login_info:
            print(f"姓名: {user_name}")
            print(f"Email: {login_info.get('email')}")
        print(f"{'='*50}")
        print("\n功能選單：")
        print("1. 查詢可借場地")
        print("2. 建立預約")
        print("3. 查詢我的訂單")
        print("4. 取消訂單")
        print("0. 登出")

        choice = input("\n請選擇功能：").strip()
        
        if choice == "1":
            # 查詢可借場地子選單
            while True:
                print("\n=== 查詢可借場地 ===")
                print("1. 根據日期查詢")
                print("2. 根據建築物查詢")
                print("0. 返回上一頁")
                choice2 = input("請選擇查詢方式：").strip()
                
                if choice2 == "1":
                    try:
                        result = action_search_availability(user_id)
                        # 如果查詢成功，記錄操作日誌到 MongoDB
                        if result is not None:
                            date, start, end = result
                            try:
                                log_to_mongo(
                                    action="USER_SEARCH_AVAILABILITY",
                                    operator_id=user_id,
                                    operator=user_name or f"user_{user_id}",
                                    detail={
                                        "query_type": "by_date",
                                        "date": date,
                                        "start": start,
                                        "end": end,
                                    },
                                    user_agent="user",
                                )
                            except Exception as log_error:
                                # 日誌記錄失敗不影響主流程
                                print(f"[警告] 日誌記錄失敗: {log_error}")
                    except ValueError as e:
                        print(f"[錯誤] {e}")
                    except Exception as e:
                        print(f"[錯誤] 發生錯誤: {e}")
                    print("\n" + "-"*50)
                    continue_choice = input("按 Enter 繼續，或輸入 0 返回主選單：").strip()
                    if continue_choice == "0":
                        break
                elif choice2 == "2":
                    try:
                        result = action_search_availability_by_building(user_id)
                        # 如果查詢成功，記錄操作日誌到 MongoDB
                        if result is not None:
                            date, building_id, people, venue_type = result
                            try:
                                log_to_mongo(
                                    action="USER_SEARCH_AVAILABILITY_BY_BUILDING",
                                    operator_id=user_id,
                                    operator=user_name or f"user_{user_id}",
                                    detail={
                                        "query_type": "by_building",
                                        "date": date,
                                        "building_id": building_id,
                                        "people": people,
                                        "venue_type": venue_type,
                                    },
                                    user_agent="user",
                                )
                            except Exception as log_error:
                                # 日誌記錄失敗不影響主流程
                                print(f"[警告] 日誌記錄失敗: {log_error}")
                    except ValueError as e:
                        print(f"[錯誤] {e}")
                    except Exception as e:
                        print(f"[錯誤] 發生錯誤: {e}")
                    print("\n" + "-"*50)
                    continue_choice = input("按 Enter 繼續，或輸入 0 返回主選單：").strip()
                    if continue_choice == "0":
                        break
                elif choice2 == "0":
                    break
                else:
                    print("[錯誤] 無效的選項，請重新選擇。")
                    
        elif choice == "2":
            try:
                result = action_create_booking(user_id)
                # 如果建立成功，記錄操作日誌到 MongoDB
                if result is not None:
                    try:
                        log_to_mongo(
                            action="USER_CREATE_BOOKING",
                            operator_id=user_id,
                            operator=user_name or f"user_{user_id}",
                            detail={
                                "booking_id": result.get("booking_id"),
                                "venue_id": result.get("venue_id"),
                                "date": result.get("date"),
                                "start": result.get("start"),
                                "end": result.get("end"),
                                "people": result.get("people"),
                                "affiliation": "Internal",
                            },
                            user_agent="user",
                        )
                    except Exception as log_error:
                        # 日誌記錄失敗不影響主流程
                        print(f"[警告] 日誌記錄失敗: {log_error}")
            except ValueError as e:
                # 記錄失敗日誌
                try:
                    log_to_mongo(
                        action="USER_CREATE_BOOKING_FAILED",
                        operator_id=user_id,
                        operator=user_name or f"user_{user_id}",
                        detail={"error": str(e)},
                        user_agent="user",
                    )
                except Exception:
                    pass
                print(f"[錯誤] {e}")
            except Exception as e:
                # 記錄失敗日誌
                try:
                    log_to_mongo(
                        action="USER_CREATE_BOOKING_FAILED",
                        operator_id=user_id,
                        operator=user_name or f"user_{user_id}",
                        detail={"error": str(e)},
                        user_agent="user",
                    )
                except Exception:
                    pass
                print(f"[錯誤] 發生錯誤: {e}")
            print("\n" + "-"*50)
            input("按 Enter 返回主選單...")
            
        elif choice == "3":
            try:
                result = action_list_bookings(user_id)
                # 如果查詢成功，記錄操作日誌到 MongoDB
                if result is not None:
                    query_user_id, status = result
                    try:
                        log_to_mongo(
                            action="USER_LIST_BOOKINGS",
                            operator_id=user_id,
                            operator=user_name or f"user_{user_id}",
                            detail={
                                "query_user_id": query_user_id,
                                "status_filter": status,
                            },
                            user_agent="user",
                        )
                    except Exception as log_error:
                        # 日誌記錄失敗不影響主流程
                        print(f"[警告] 日誌記錄失敗: {log_error}")
            except ValueError as e:
                print(f"[錯誤] {e}")
            except Exception as e:
                print(f"[錯誤] 發生錯誤: {e}")
            print("\n" + "-"*50)
            input("按 Enter 返回主選單...")
            
        elif choice == "4":
            try:
                result = action_cancel_booking(user_id)
                # 如果取消成功，記錄操作日誌到 MongoDB
                if result is not None:
                    booking_id = result
                    try:
                        log_to_mongo(
                            action="USER_CANCEL_BOOKING",
                            operator_id=user_id,
                            operator=user_name or f"user_{user_id}",
                            detail={
                                "booking_id": booking_id,
                            },
                            user_agent="user",
                        )
                    except Exception as log_error:
                        # 日誌記錄失敗不影響主流程
                        print(f"[警告] 日誌記錄失敗: {log_error}")
            except ValueError as e:
                print(f"[錯誤] {e}")
            except Exception as e:
                print(f"[錯誤] 發生錯誤: {e}")
            print("\n" + "-"*50)
            input("按 Enter 返回主選單...")
            
        elif choice == "0":
            print("\n登出成功！")
            break
        else:
            print("[錯誤] 無效的選項，請重新選擇。")
