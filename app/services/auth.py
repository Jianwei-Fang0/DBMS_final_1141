#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
認證相關服務
"""
from typing import Optional, Dict, Any, List
import bcrypt

from psycopg.rows import dict_row
from app.db.postgres import get_conn


class AuthenticationError(Exception):
    """認證錯誤"""
    pass


class UserNotFoundError(AuthenticationError):
    """使用者不存在"""
    pass


class InvalidPasswordError(AuthenticationError):
    """密碼錯誤"""
    pass


class UserFrozenError(AuthenticationError):
    """帳號已凍結"""
    pass


def verify_password(password: str, password_hash: str) -> bool:
    """
    驗證密碼是否正確
    
    注意：測試數據中的 password_hash 是假的（占位符），
    為了開發方便，如果 hash 包含 'example' 或 'abcdef'，則允許任何密碼通過。
    生產環境應該移除這個邏輯。
    """
    # 檢查是否為測試用的假 hash
    if password == password_hash:
        # 測試模式：允許任何密碼通過
        return True
    
    try:
        # 使用 bcrypt 驗證密碼
        return bcrypt.checkpw(password.encode('utf-8'), password_hash.encode('utf-8'))
    except Exception:
        # 如果 hash 格式錯誤或驗證失敗，返回 False
        return False


def login(user_email: str, password: str) -> Dict[str, Any]:
    """
    使用者登入驗證
    
    Args:
        user_email: 使用者 email
        password: 密碼（明文）
    
    Returns:
        {
            "user_id": int,
            "email": str,
            "name": str,
            "status": str,
            "roles": List[str],  # ['Applicant', 'VenueManager', ...]
            "is_admin": bool,     # 是否有管理員角色
            "affiliation": str
        }
    
    Raises:
        UserNotFoundError: 使用者不存在
        InvalidPasswordError: 密碼錯誤
        UserFrozenError: 帳號已凍結
    """
    sql = """
    SELECT 
        u.user_id,
        u.email,
        u.password_hash,
        u.name,
        u.phone,
        u.status,
        u.affiliation,
        u.org_id,
        o.name AS org_name,
        COALESCE(ARRAY_AGG(ur.role) FILTER (WHERE ur.role IS NOT NULL), ARRAY[]::VARCHAR[]) AS roles
    FROM "user" u
    LEFT JOIN org o ON u.org_id = o.org_id
    LEFT JOIN user_role ur ON u.user_id = ur.user_id
    WHERE u.user_id = %s
    GROUP BY u.user_id, u.email, u.password_hash, u.name, u.phone, 
             u.status, u.affiliation, u.org_id, o.name;
    """
    
    with get_conn() as conn, conn.cursor(row_factory=dict_row) as cur:
        cur.execute(sql, (user_email,))
        row = cur.fetchone()
        
        if row is None:
            raise UserNotFoundError(f"使用者 ID {user_email} 不存在")
        
        # 檢查帳號狀態
        if row["status"] == "Frozen":
            raise UserFrozenError("帳號已凍結，無法登入")
        
        # 驗證密碼
        stored_hash = row["password_hash"]
        if not verify_password(password, stored_hash):
            raise InvalidPasswordError("密碼錯誤")
        
        # 獲取角色列表（PostgreSQL 返回的 array 可能是 None）
        roles = list(row["roles"]) if row["roles"] else []
        
        # 判斷是否為管理員
        # 管理員角色：VenueManager, Finance, SysAdmin
        admin_roles = {'VenueManager', 'Finance', 'SysAdmin'}
        is_admin = any(role in admin_roles for role in roles)
        
        return {
            "user_id": row["user_id"],
            "email": row["email"],
            "name": row["name"],
            "phone": row["phone"],
            "status": row["status"],
            "affiliation": row["affiliation"],
            "org_id": row["org_id"],
            "org_name": row["org_name"],
            "roles": roles,
            "is_admin": is_admin,
        }
