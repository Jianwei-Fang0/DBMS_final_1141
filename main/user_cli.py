#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
使用者端 CLI
"""
import sys


def user_main_menu(user_id: int, login_info: dict = None):
    """使用者主選單"""
    print(f"\n{'='*50}")
    print(f"使用者選單 - user_id: {user_id}")
    if login_info:
        print(f"姓名: {login_info.get('name')}")
        print(f"Email: {login_info.get('email')}")
    print(f"{'='*50}")
    print("\n功能開發中...")
    print("1. 查詢可借場地")
    print("2. 建立預約")
    print("3. 查詢我的訂單")
    print("4. 取消訂單")
    print("0. 登出")
    
    # TODO: 實作使用者功能
    input("\n按 Enter 返回...")
