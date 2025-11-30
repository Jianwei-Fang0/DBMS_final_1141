# 🏫 NTU Venue Booking System  
**台大場地借用管理系統 – Database Final Project**  
Group G30 ｜ PostgreSQL ｜ SQL + Python Data Generator

---

## Overview

重現「台大場地借用流程」，包含：

- 21 張資料表（含 FK, constraints）
- 真實場地資料：綜合 / 新生 / 普通 / 共同 / 博雅
- 真實設備清單（投影機、冷氣空調、推播系統…）
- 自動化生成費率（早 / 午 / 日 / 夜）
- 全館時段規則（平日 / 假日）
- 200 位使用者（含 Applicant / VenueManager / Admin / Finance）
- 500 筆 Booking（含 booking_slot）
- 所有資料皆由 CSV + Python script 自動生成

本專案可 100% 重建完整 DB，並保證：

- 無外鍵錯誤  
- 無重複 booking slot  
- 無孤兒資料  
- 定價完全一致（price_rule fully matched）

---

## 📂 Folder Structure
ntu-venue-booking/
│
├── db/
│   ├── create_tables.sql
│   ├── 01_insert_org_clubs.sql
│   ├── 02_insert_buildings.sql
│   ├── 03_insert_venues.sql
│   ├── 04_insert_users.sql
│   ├── 05_insert_equipment.sql
│   ├── 06_insert_venue_equip.sql
│   ├── 07_insert_rate_plan.sql
│   ├── 08_insert_rate_version.sql
│   ├── 09_insert_price_rule.sql
│   ├── 10_insert_timeslot_rule.sql
│   ├── 11_insert_booking.sql
│
├── scripts/
│   ├── generate_04_fake_users.py
│   ├── generate_56_equipment_and_venue_equip.py
│   ├── generate_789_rate_plans.py
│   ├── generate_10_timeslot_rule.py
│   ├── generate_11_fake_booking.py
│   ├── generate_org_inserts.py
│
├── data/
│   ├── ntu_rooms_all_buildings.csv
│   ├── ntu_clubs_full.csv
│
└── README.md


---

## 🧱 Database Schema Summary

本系統共 21 張資料表，分成四大區：

### 🎓 使用者與組織
- `org`
- `"user"`
- `user_role`
- `org_member`

### 🏫 場地資訊
- `building`
- `venue`
- `equipment`
- `venue_equip`

### 🕒 時段與費率
- `timeslot_rule`
- `blocked_slot`
- `rate_plan`
- `rate_version`
- `price_rule`
- `equip_price_rule`
- `holiday`

### 🧾 訂單與付款
- `booking`
- `booking_slot`
- `booking_equip`
- `approval`
- `payment`
- `refund`
