#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
管理員端 CLI
"""
import sys

from app.db.mongo import log as log_to_mongo
from admin_client import (
    # Admin Booking
    action_list_pending_bookings,
    action_get_booking_preview,
    action_get_booking_preview_by_date,
    action_get_booking_detail,
    action_approve_booking,
    action_reject_booking,
    action_request_changes,
    action_modify_booking,
    # Admin Fund
    action_list_pending_payments,
    action_mark_payment_succeeded,
    action_create_refund,
    action_mark_refund_succeeded,
    # Admin Logs
    action_list_logs,
    action_list_logs_for_booking,
    action_stats_logs,
    # Admin Rules
    action_list_timeslot_rules,
    action_list_rate_plans,
    action_list_price_rules,
)
from client import (
    action_search_availability,
    action_search_availability_by_building, 
)
BASE_URL = "http://127.0.0.1:8000"  # 後端 API 位址


def admin_main_menu(admin_id: int, login_info: dict = None):
    """管理員主選單"""
    operator_name = login_info.get('name', f"admin_{admin_id}") if login_info else f"admin_{admin_id}"
    
    while True:
        print(f"\n{'='*50}")
        print(f"管理員選單 - admin_id: {admin_id}")
        if login_info:
            print(f"姓名: {login_info.get('name')}")
            print(f"Email: {login_info.get('email')}")
            print(f"角色: {', '.join(login_info.get('roles', []))}")
        print(f"{'='*50}")
        print("\n【管理員選單】")
        print("1. 查詢可借場地相關")
        print("2. 查詢訂單相關")
        print("3. 待處理訂單")
        print("4. 付款及退款檢查")
        print("5. 查看目前規則")
        print("6. 查看操作日誌")
        print("0. 登出")
       
        
        choice = input("\n請選擇功能：").strip()
        result = None

        if choice ==    "1":
            while True:
                print("\n=== 查詢可借場地 ===")
                print("1. 根據日期查詢")
                print("2. 根據建築物查詢")
                print("0. 返回上一頁")
                choice2 = input("請選擇查詢方式：").strip()
                
                if choice2 == "1":
                    try:
                        result = action_search_availability(admin_id)
                        # 如果查詢成功，記錄操作日誌到 MongoDB
                        if result is not None:
                            date, start, end = result
                            try:
                                log_to_mongo(
                                    action="USER_SEARCH_AVAILABILITY",
                                    operator_id=admin_id,
                                    operator=operator_name or f"admin_{admin_id}",
                                    detail={
                                        "query_type": "by_date",
                                        "date": date,
                                        "start": start,
                                        "end": end,
                                    },
                                    user_agent="Admin",
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
                        result = action_search_availability_by_building(admin_id)
                        # 如果查詢成功，記錄操作日誌到 MongoDB
                        if result is not None:
                            date, building_id, people, venue_type = result
                            try:
                                log_to_mongo(
                                    action="USER_SEARCH_AVAILABILITY_BY_BUILDING",
                                    operator_id=admin_id,
                                    operator=operator_name or f"admin_{admin_id}",
                                    detail={
                                        "query_type": "by_building",
                                        "date": date,
                                        "building_id": building_id,
                                        "people": people,
                                        "venue_type": venue_type,
                                    },
                                    user_agent="Admin",
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
            # 2. 查詢訂單相關
            while True:
                print("\n=== 查詢訂單相關 ===")
                print("1. 查看訂單預覽20則")
                print("2. 查看訂單預覽（從今天開始算指定天數內）")
                print("3. 查看訂單詳情（用booking id）")
                print("0. 返回上一頁")
                choice2 = input("請選擇功能：").strip()
                
                if choice2 == "1":
                    # 查看訂單預覽20則（支持分頁導航）
                    page = 1
                    while True:
                        result = action_get_booking_preview(admin_id, operator=operator_name, page=page)
                        if result is not None:
                            try:
                                pagination = result.get("pagination", {})
                                log_to_mongo(
                                    action="SEARCH_BOOKING_PREVIEW",
                                    operator_id=admin_id,
                                    operator=operator_name,
                                    detail={
                                        "page": pagination.get("page"),
                                        "result_count": len(result.get("data", [])),
                                    },
                                    user_agent="admin_cli",
                                )
                            except Exception as e:
                                print(f"[警告] 日誌記錄失敗: {e}")
                            
                            # 分頁導航選單
                            total_pages = pagination.get("total_pages", 1)
                            current_page = pagination.get("page", 1)
                            
                            print("\n" + "-"*50)
                            print("分頁導航：")
                            if current_page > 1:
                                print("1. 上一頁")
                            if current_page < total_pages:
                                print("2. 下一頁")
                            print("0. 返回")
                            
                            nav_choice = input("請選擇：").strip()
                            
                            if nav_choice == "1" and current_page > 1:
                                page = current_page - 1
                            elif nav_choice == "2" and current_page < total_pages:
                                page = current_page + 1
                            elif nav_choice == "0":
                                break
                            else:
                                print("[錯誤] 無效的選項，請重新選擇。")
                        else:
                            break
                elif choice2 == "2":
                    # 查看訂單預覽（從今天開始算指定天數內，支持分頁導航）
                    # 先獲取天數（只在第一次詢問）
                    days = None
                    page = 1
                    while True:
                        result = action_get_booking_preview_by_date(admin_id, operator=operator_name, days=days, page=page)
                        if result is not None:
                            # 如果這是第一次查詢，從函數內部已經獲取了天數，這裡不需要再處理
                            try:
                                pagination = result.get("pagination", {})
                                log_to_mongo(
                                    action="SEARCH_BOOKING_PREVIEW_BY_DATE",
                                    operator_id=admin_id,
                                    operator=operator_name,
                                    detail={
                                        "page": pagination.get("page"),
                                        "result_count": len(result.get("data", [])),
                                    },
                                    user_agent="admin_cli",
                                )
                            except Exception as e:
                                print(f"[警告] 日誌記錄失敗: {e}")
                            
                            # 分頁導航選單
                            total_pages = pagination.get("total_pages", 1)
                            current_page = pagination.get("page", 1)
                            
                            print("\n" + "-"*50)
                            print("分頁導航：")
                            if current_page > 1:
                                print("1. 上一頁")
                            if current_page < total_pages:
                                print("2. 下一頁")
                            print("0. 返回")
                            
                            nav_choice = input("請選擇：").strip()
                            
                            if nav_choice == "1" and current_page > 1:
                                page = current_page - 1
                                days = result.get("days", 7)  # 保存天數以便後續分頁使用（避免重複詢問）
                            elif nav_choice == "2" and current_page < total_pages:
                                page = current_page + 1
                                days = result.get("days", 7)  # 保存天數以便後續分頁使用（避免重複詢問）
                            elif nav_choice == "0":
                                break
                            else:
                                print("[錯誤] 無效的選項，請重新選擇。")
                        else:
                            break
                elif choice2 == "3":
                    # 查看訂單詳情 用booking id
                    result = action_get_booking_detail(admin_id, operator=operator_name)
                    if result is not None:
                        try:
                            log_to_mongo(
                                action="SEARCH_PENDING_DETAIL",
                                operator_id=admin_id,
                                operator=operator_name,
                                detail={"booking_id": result.get('booking_id')},
                                user_agent="admin_cli",
                            )
                        except Exception as e:
                            print(f"[警告] 日誌記錄失敗: {e}")
                    input("\n按 Enter 繼續...")
                elif choice2 == "0":
                    break
                else:
                    print("[錯誤] 無效的選項，請重新選擇。")
        elif choice == "3":
            # 3. 待處理訂單
            while True:
                print("\n=== 待處理訂單 ===")
                print("1. 待審清單")
                print("2. 修改訂單")
                print("0. 返回上一頁")
                choice3 = input("請選擇功能：").strip()
                
                if choice3 == "1":
                    # 待審清單
                    while True:
                        result = action_list_pending_bookings(admin_id, operator=operator_name)
                        if result is not None:
                            try:
                                log_to_mongo(
                                    action="SEARCH_PENDING",
                                    operator_id=admin_id,
                                    operator=operator_name,
                                    detail={"result_count": len(result)},
                                    user_agent="admin_cli",
                                )
                            except Exception as e:
                                print(f"[警告] 日誌記錄失敗: {e}")
                            
                            if result:
                                print("\n" + "-"*50)
                                print("請選擇要查看詳情的訂單 ID，或輸入 0 返回")
                                booking_id_input = input("訂單 ID: ").strip()
                                
                                if booking_id_input == "0":
                                    break
                                
                                try:
                                    booking_id = int(booking_id_input)
                                    # 查看訂單詳情
                                    detail_result = action_get_booking_detail(admin_id, operator=operator_name, booking_id=booking_id)
                                    if detail_result is not None:
                                        try:
                                            log_to_mongo(
                                                action="SEARCH_PENDING_DETAIL",
                                                operator_id=admin_id,
                                                operator=operator_name,
                                                detail={"booking_id": detail_result.get('booking_id')},
                                                user_agent="admin_cli",
                                            )
                                        except Exception as e:
                                            print(f"[警告] 日誌記錄失敗: {e}")
                                        
                                        # 訂單詳情操作選單
                                        while True:
                                            print("\n" + "-"*50)
                                            print("訂單操作：")
                                            print("1. 核准訂單")
                                            print("2. 駁回訂單")
                                            print("3. 要求補件")
                                            print("0. 返回")
                                            
                                            action_choice = input("請選擇操作：").strip()
                                            
                                            if action_choice == "1":
                                                result = action_approve_booking(admin_id, operator=operator_name, booking_id=booking_id)
                                                if result is not None:
                                                    try:
                                                        log_to_mongo(
                                                            action="APPROVE_PENDING",
                                                            operator_id=admin_id,
                                                            operator=operator_name,
                                                            detail={"booking_id": result},
                                                            user_agent="admin_cli",
                                                        )
                                                    except Exception as e:
                                                        print(f"[警告] 日誌記錄失敗: {e}")
                                                input("\n按 Enter 繼續...")
                                                break
                                            elif action_choice == "2":
                                                result = action_reject_booking(admin_id, operator=operator_name, booking_id=booking_id)
                                                if result is not None:
                                                    try:
                                                        log_to_mongo(
                                                            action="REJECT_PENDING",
                                                            operator_id=admin_id,
                                                            operator=operator_name,
                                                            detail={"booking_id": result},
                                                            user_agent="admin_cli",
                                                        )
                                                    except Exception as e:
                                                        print(f"[警告] 日誌記錄失敗: {e}")
                                                input("\n按 Enter 繼續...")
                                                break
                                            elif action_choice == "3":
                                                result = action_request_changes(admin_id, operator=operator_name, booking_id=booking_id)
                                                if result is not None:
                                                    try:
                                                        log_to_mongo(
                                                            action="REQUEST_CHANGES",
                                                            operator_id=admin_id,
                                                            operator=operator_name,
                                                            detail={"booking_id": result},
                                                            user_agent="admin_cli",
                                                        )
                                                    except Exception as e:
                                                        print(f"[警告] 日誌記錄失敗: {e}")
                                                input("\n按 Enter 繼續...")
                                                break
                                            elif action_choice == "0":
                                                break
                                            else:
                                                print("[錯誤] 無效的選項，請重新選擇。")
                                    else:
                                        input("\n按 Enter 繼續...")
                                except ValueError:
                                    print("[錯誤] 請輸入有效的訂單 ID")
                                    input("\n按 Enter 繼續...")
                            else:
                                print("\n目前沒有待審訂單")
                                input("\n按 Enter 繼續...")
                                break
                        else:
                            break
                elif choice3 == "2":
                    # action_modify_booking
                    result = action_modify_booking(admin_id, operator=operator_name)
                    if result is not None:
                        try:
                            log_to_mongo(
                                action="BOOKING_MODIFY_FULL_FLOW",
                                operator_id=admin_id,
                                operator=operator_name,
                                detail={"booking_id": result},
                                user_agent="admin_cli",
                            )
                        except Exception as e:
                            print(f"[警告] 日誌記錄失敗: {e}")
                    input("\n按 Enter 繼續...")
                elif choice3 == "0":
                    break
                else:
                    print("[錯誤] 無效的選項，請重新選擇。")
        elif choice == "4":
            # 4. 付款及退款檢查
            while True:
                print("\n=== 付款及退款檢查 ===")
                print("1. 待付款清單")
                print("2. 標記付款成功")
                print("3. 建立退款")
                print("4. 標記退款成功")
                print("0. 返回上一頁")
                choice4 = input("請選擇功能：").strip()
                
                if choice4 == "1":
                    result = action_list_pending_payments(admin_id, operator=operator_name)
                    if result is not None:
                        try:
                            log_to_mongo(
                                action="SEARCH_PENDING_PAYMENT",
                                operator_id=admin_id,
                                operator=operator_name,
                                detail={"result_count": len(result)},
                                user_agent="admin_cli",
                            )
                        except Exception as e:
                            print(f"[警告] 日誌記錄失敗: {e}")
                    input("\n按 Enter 繼續...")
                elif choice4 == "2":
                    result = action_mark_payment_succeeded(admin_id, operator=operator_name)
                    if result is not None:
                        try:
                            log_to_mongo(
                                action="UPDATE_PAYMENT_STATUS_TO_SUCCEEDED",
                                operator_id=admin_id,
                                operator=operator_name,
                                detail={"payment_id": result},
                                user_agent="admin_cli",
                            )
                        except Exception as e:
                            print(f"[警告] 日誌記錄失敗: {e}")
                    input("\n按 Enter 繼續...")
                elif choice4 == "3":
                    result = action_create_refund(admin_id, operator=operator_name)
                    if result is not None:
                        try:
                            log_to_mongo(
                                action="ADD_REFUND",
                                operator_id=admin_id,
                                operator=operator_name,
                                detail={"refund_id": result},
                                user_agent="admin_cli",
                            )
                        except Exception as e:
                            print(f"[警告] 日誌記錄失敗: {e}")
                    input("\n按 Enter 繼續...")
                elif choice4 == "4":
                    result = action_mark_refund_succeeded(admin_id, operator=operator_name)
                    if result is not None:
                        try:
                            log_to_mongo(
                                action="UPDATE_PAYMENT_STATUS_BY_REFUND",
                                operator_id=admin_id,
                                operator=operator_name,
                                detail={"refund_id": result},
                                user_agent="admin_cli",
                            )
                        except Exception as e:
                            print(f"[警告] 日誌記錄失敗: {e}")
                    input("\n按 Enter 繼續...")
                elif choice4 == "0":
                    break
                else:
                    print("[錯誤] 無效的選項，請重新選擇。")
        elif choice == "5":
            # 5. 查看目前規則
            while True:
                print("\n=== 查看目前規則 ===")
                print("1. 列出時段規則")
                print("2. 列出費率方案")
                print("3. 列出價格規則")
                print("0. 返回上一頁")
                choice5 = input("請選擇功能：").strip()
                
                if choice5 == "1":
                    result = action_list_timeslot_rules(admin_id, operator=operator_name)
                    if result is not None:
                        try:
                            log_to_mongo(
                                action="SEARCH_TIMESLOT_RULE",
                                operator_id=admin_id,
                                operator=operator_name,
                                detail={"result_count": len(result)},
                                user_agent="admin_cli",
                            )
                        except Exception as e:
                            print(f"[警告] 日誌記錄失敗: {e}")
                    input("\n按 Enter 繼續...")
                elif choice5 == "2":
                    result = action_list_rate_plans(admin_id, operator=operator_name)
                    if result is not None:
                        try:
                            log_to_mongo(
                                action="SEARCH_RATE_PLAN",
                                operator_id=admin_id,
                                operator=operator_name,
                                detail={"result_count": len(result)},
                                user_agent="admin_cli",
                            )
                        except Exception as e:
                            print(f"[警告] 日誌記錄失敗: {e}")
                    input("\n按 Enter 繼續...")
                elif choice5 == "3":
                    result = action_list_price_rules(admin_id, operator=operator_name)
                    if result is not None:
                        try:
                            log_to_mongo(
                                action="SEARCH_PRICE_RULE",
                                operator_id=admin_id,
                                operator=operator_name,
                                detail={"result_count": len(result)},
                                user_agent="admin_cli",
                            )
                        except Exception as e:
                            print(f"[警告] 日誌記錄失敗: {e}")
                    input("\n按 Enter 繼續...")
                elif choice5 == "0":
                    break
                else:
                    print("[錯誤] 無效的選項，請重新選擇。")
        elif choice == "6":
            # 6. 查看操作日誌
            action_list_logs(admin_id, operator=operator_name)
            input("\n按 Enter 繼續...")
        elif choice == "0":
            print("\n登出中...")
            break
        else:
            print("\n[錯誤] 無效的選項，請重新選擇")
            input("\n按 Enter 繼續...")
