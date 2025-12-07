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
        print("\n【場地管理】")
        print("1. 查詢可借場地")
        print("2. 訂單管理 ")
        print("3. 待審清單 ")
        print("4. 付款及退款檢查 ")
        print("5. 查看目前規則 ")
        print("6. 查看操作日誌 ")
        print("0. 登出 ")
       
        
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
            while True:
                print("\n=== 訂單管理 ===")
                print("1. 待審清單")
                print("2. 訂單預覽（分頁）")
                print("3. 查看訂單詳情")
                print("4. 核准訂單")
                print("5. 駁回訂單")
                print("6. 要求補件")
                print("7. 修改訂單")
                print("0. 返回上一頁")
                choice3 = input("請選擇功能：").strip()
                
                if choice3 == "1":
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
                elif choice3 == "2":
                    result = action_get_booking_preview(admin_id, operator=operator_name)
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
                elif choice3 == "3":
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
                elif choice3 == "4":
                    result = action_approve_booking(admin_id, operator=operator_name)
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
                elif choice3 == "5":
                    result = action_reject_booking(admin_id, operator=operator_name)
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
                elif choice3 == "6":
                    result = action_request_changes(admin_id, operator=operator_name)
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
                elif choice3 == "7":
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
                elif choice3 == "0":
                    break
                else:
                    print("[錯誤] 無效的選項，請重新選擇。")
                
                if choice3 != "0":
                    input("\n按 Enter 繼續...")
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
        elif choice == "2":
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
        elif choice == "3":
            result = action_approve_booking(admin_id, operator=operator_name)
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
        elif choice == "4":
            result = action_reject_booking(admin_id, operator=operator_name)
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
        elif choice == "5":
            result = action_request_changes(admin_id, operator=operator_name)
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
        elif choice == "6":
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
        elif choice == "7":
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
            elif choice == "8":
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
            elif choice == "9":
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
            elif choice == "10":
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
            elif choice == "11":
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
            elif choice == "12":
                action_list_logs(admin_id, operator=operator_name)
            elif choice == "13":
                action_list_logs_for_booking(admin_id, operator=operator_name)
            elif choice == "14":
                action_stats_logs(admin_id, operator=operator_name)
            elif choice == "15":
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
            elif choice == "16":
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
            elif choice == "17":
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
        elif choice == "0":
            print("\n登出中...")
            break
        else:
            print("\n[錯誤] 無效的選項，請重新選擇")

        
        if choice != "0":
            input("\n按 Enter 返回...")
