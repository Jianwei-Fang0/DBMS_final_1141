#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
管理員端 CLI
"""
import sys


def admin_main_menu(admin_id: int, login_info: dict = None):
    """管理員主選單"""
    print(f"\n{'='*50}")
    print(f"管理員選單 - admin_id: {admin_id}")
    if login_info:
        print(f"姓名: {login_info.get('name')}")
        print(f"Email: {login_info.get('email')}")
        print(f"角色: {', '.join(login_info.get('roles', []))}")
    print(f"{'='*50}")
    print("\n功能開發中...")
    print("1. 待審清單")
    print("2. 查看訂單詳情")
    print("3. 核准訂單")
    print("4. 駁回訂單")
    print("5. 要求補件")
    print("6. 修改訂單")
    print("0. 登出")
    
    # TODO: 實作管理員功能
    input("\n按 Enter 返回...")
