#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
修復缺失的 payment 記錄
為所有 Approved 狀態且金額 > 0 但沒有 payment 記錄的訂單創建 payment
"""
import sys
import os

# 添加項目根目錄到路徑
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

from app.db.postgres import get_conn
from psycopg.rows import dict_row

def fix_missing_payments():
    """為已批准的訂單創建缺失的 payment 記錄"""
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
    WHERE b.status = 'Approved'
      AND b.amount_est > 0
      AND NOT EXISTS (
        SELECT 1 
        FROM payment p 
        WHERE p.booking_id = b.booking_id
      )
    ORDER BY b.booking_id
    RETURNING payment_id, booking_id, amount;
    """
    
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql)
        rows = cur.fetchall()
        conn.commit()
        
        if rows:
            print(f"\n✅ 成功創建 {len(rows)} 筆 payment 記錄：")
            total = 0
            for row in rows:
                print(f"  - payment_id={row['payment_id']}, booking_id={row['booking_id']}, amount={row['amount']}")
                total += float(row['amount'])
            print(f"\n💰 總金額: ${total:.2f}")
        else:
            print("\n✅ 沒有需要修復的訂單（所有 Approved 訂單都已有多應的 payment 記錄）")
    
    # 顯示待付款清單
    print("\n📋 當前待付款清單：")
    list_sql = """
    SELECT
        p.payment_id,
        p.booking_id,
        p.amount,
        b.date,
        b.start_time,
        b.end_time,
        u.name AS applicant_name,
        v.name AS venue_name
    FROM payment p
    JOIN booking b ON p.booking_id = b.booking_id
    JOIN "user" u ON b.user_id = u.user_id
    JOIN venue v ON b.venue_id = v.venue_id
    WHERE p.status = 'Pending'
    ORDER BY p.created_at ASC;
    """
    
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(list_sql)
        rows = cur.fetchall()
        
        if rows:
            for row in rows:
                print(f"  - payment_id={row['payment_id']}, booking_id={row['booking_id']}, "
                      f"金額=${row['amount']:.2f}, 申請人={row['applicant_name']}, "
                      f"場地={row['venue_name']}, 日期={row['date']} {row['start_time']}-{row['end_time']}")
        else:
            print("  （目前沒有待付款記錄）")

if __name__ == "__main__":
    try:
        fix_missing_payments()
    except Exception as e:
        print(f"\n❌ 錯誤: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
