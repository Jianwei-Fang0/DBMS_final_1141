#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
直接插入 payment 記錄（偷吃步）
為已批准的訂單創建待付款記錄
"""
import sys
import os

# 添加項目根目錄到路徑
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

from app.db.postgres import get_conn
from psycopg.rows import dict_row

def insert_payment_for_booking(booking_id: int = None, venue_name: str = None, date: str = None):
    """
    為指定的訂單插入 payment 記錄
    
    參數：
        booking_id: 訂單 ID（優先使用）
        或
        venue_name: 場地名稱（例如 "博雅301"）
        date: 日期（例如 "2025-12-12"）
    """
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        # 1. 找到訂單
        if booking_id:
            cur.execute("""
                SELECT booking_id, venue_id, amount_est, status, date, start_time, end_time
                FROM booking
                WHERE booking_id = %s
            """, (booking_id,))
        elif venue_name and date:
            cur.execute("""
                SELECT b.booking_id, b.venue_id, b.amount_est, b.status, b.date, b.start_time, b.end_time
                FROM booking b
                JOIN venue v ON v.venue_id = b.venue_id
                WHERE v.name = %s
                  AND b.date = %s::date
                  AND b.status = 'Approved'
                ORDER BY b.created_at DESC
                LIMIT 1
            """, (venue_name, date))
        else:
            print("❌ 請提供 booking_id 或 (venue_name, date)")
            return False
        
        booking = cur.fetchone()
        if not booking:
            print("❌ 找不到符合條件的訂單")
            return False
        
        booking_id = booking['booking_id']
        amount_est = booking['amount_est']
        
        print(f"📋 找到訂單：")
        print(f"  - booking_id: {booking_id}")
        print(f"  - 日期: {booking['date']}")
        print(f"  - 時間: {booking['start_time']} - {booking['end_time']}")
        print(f"  - 狀態: {booking['status']}")
        print(f"  - 金額: ${amount_est}")
        
        # 2. 檢查是否已有 payment 記錄
        cur.execute("""
            SELECT payment_id, status, amount
            FROM payment
            WHERE booking_id = %s
        """, (booking_id,))
        existing = cur.fetchone()
        
        if existing:
            print(f"\n⚠️  已存在 payment 記錄：")
            print(f"  - payment_id: {existing['payment_id']}")
            print(f"  - 狀態: {existing['status']}")
            print(f"  - 金額: ${existing['amount']}")
            print("跳過創建（已存在）")
            return False
        
        # 3. 插入 payment 記錄
        if amount_est <= 0:
            print(f"\n⚠️  訂單金額為 ${amount_est}，跳過創建 payment")
            return False
        
        cur.execute("""
            INSERT INTO payment (booking_id, method, amount, type, status, created_at)
            VALUES (%s, 'Transfer', %s, 'Rent', 'Pending', NOW())
            RETURNING payment_id, booking_id, amount, status, created_at
        """, (booking_id, amount_est))
        
        payment = cur.fetchone()
        conn.commit()
        
        print(f"\n✅ 成功創建 payment 記錄：")
        print(f"  - payment_id: {payment['payment_id']}")
        print(f"  - booking_id: {payment['booking_id']}")
        print(f"  - 金額: ${payment['amount']}")
        print(f"  - 狀態: {payment['status']}")
        print(f"  - 創建時間: {payment['created_at']}")
        
        return True

if __name__ == "__main__":
    # 根據用戶提供的信息：博雅301, 2025-12-12
    try:
        print("=" * 60)
        print("直接插入 Payment 記錄")
        print("=" * 60)
        
        # 方法1：使用場地名稱和日期
        success = insert_payment_for_booking(
            venue_name="博雅301",
            date="2025-12-12"
        )
        
        if success:
            print("\n" + "=" * 60)
            print("🎉 完成！現在可以在待付款清單中看到這筆記錄了。")
        else:
            print("\n❌ 操作失敗")
            sys.exit(1)
            
    except Exception as e:
        print(f"\n❌ 錯誤: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
