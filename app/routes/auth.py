#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
認證相關路由
"""
from fastapi import APIRouter, HTTPException, status
from pydantic import BaseModel

from app.services.auth import (
    login,
    UserNotFoundError,
    InvalidPasswordError,
    UserFrozenError,
)

router = APIRouter(prefix="/api/v1/auth", tags=["auth"])


class LoginRequest(BaseModel):
    user_email: str
    password: str


class LoginResponse(BaseModel):
    success: bool
    user_id: int
    email: str
    name: str
    status: str
    roles: list[str]
    is_admin: bool
    affiliation: str
    org_id: int | None = None
    org_name: str | None = None


@router.post("/login", response_model=LoginResponse)
def login_endpoint(body: LoginRequest):
    """
    使用者登入
    
    驗證 user_id 和 password，返回使用者資訊和角色。
    根據 roles 判斷是否為管理員。
    """
    try:
        result = login(user_email=body.user_email, password=body.password)
        
        return LoginResponse(
            success=True,
            user_id=result["user_id"],
            email=result["email"],
            name=result["name"],
            status=result["status"],
            roles=result["roles"],
            is_admin=result["is_admin"],
            affiliation=result["affiliation"],
            org_id=result.get("org_id"),
            org_name=result.get("org_name"),
        )
    
    except UserNotFoundError as e:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail={
                "code": "USER_NOT_FOUND",
                "error": str(e),
            },
        )
    
    except InvalidPasswordError as e:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail={
                "code": "INVALID_PASSWORD",
                "error": str(e),
            },
        )
    
    except UserFrozenError as e:
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail={
                "code": "USER_FROZEN",
                "error": str(e),
            },
        )
    
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail={
                "code": "LOGIN_FAILED",
                "error": str(e),
            },
        )
