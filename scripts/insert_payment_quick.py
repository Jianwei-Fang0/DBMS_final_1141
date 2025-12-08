#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
快速插入 payment 記錄
"""
import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

from app.db.postgres import get_conn
from psycopg.rows import dict_row

def quick_insert():
    sql = """
    INSERT INTO payment (booking_id, method, amount, type, status, created_at)
    SELECT 
        b.booking_id,
        'Transfer' AS method,
        b.amount_est AS amount,
        'Rent' AS type,
        'Pending' AS status,
        NOW() AS created_at
    FROM booking b
    JOIN venue v ON v.venue_id = b.venue_id
    WHERE v.name = '博雅301'
      AND b.date = '2025-12-12'::date
      AND b.status = 'Approved'
      AND NOT EXISTS (
        SELECT 1 
        FROM payment p 
        WHERE p.booking_id = b.booking_id
      )
    ORDER BY b.created_at DESC
    LIMIT 1
    RETURNING payment_id, booking_id, amount, status, created_at;
    """
    
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql)
        result = cur.fetchone()
        conn.commit()
        
        if result:
            print("✅ 成功創建 payment 記錄：")
            print(f"  - payment_id: {result['payment_id']}")
            print(f"  - booking_id: {result['booking_id']}")
            print(f"  - 金額: ${result['amount']}")
            print(f"  - 狀態: {result['status']}")
            return True
        else:
            print("⚠️  沒有找到需要創建 payment 的訂單，或已存在 payment 記錄")
            return False

if __name__ == "__main__":
    print("=" * 60)
    print("快速插入 Payment 記錄")
    print("=" * 60)
    try:
        result = quick_insert()
        if result:
            print("\n🎉 完成！")
        else:
            print("\n⚠️  未創建記錄")
    except Exception as e:
        print(f"\n❌ 錯誤: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
