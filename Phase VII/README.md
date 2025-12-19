📘 Phase VII – Advanced Programming & Auditing
Project: Emergency Response and Bed Availability Tracker

Student Name: Igiraneza Irene
Student ID: 27328
Database: Oracle 21c XE
Schema: PDB_ADMIN

📌 Phase Objective

The objective of Phase VII is to implement advanced PL/SQL programming concepts, including:

Business rule enforcement using triggers

Restriction of database operations based on time rules

Comprehensive auditing of all user actions

Use of simple triggers, compound triggers, functions, and procedures

Clear testing and validation of all rules

This phase ensures the system enforces real-world operational policies while maintaining accountability.

🚨 Critical Business Rule Implemented

Employees CANNOT INSERT, UPDATE, or DELETE records when:

It is a weekday (Monday–Friday)

It is a public holiday (on the holiday date)

✅ Allowed:

Weekends (Saturday & Sunday)

❌ Denied:

Weekdays

Public holidays

All allowed and denied attempts are logged.

🧩 Components Implemented
1️⃣ Holiday Management

Table: PUBLIC_HOLIDAYS
Stores official public holidays used to enforce transaction restrictions.

public_holidays(holiday_date, description)

2️⃣ Audit Log

Table: AUDIT_LOG
Captures all database modification attempts.

Logged details:

Username

Action type (INSERT / UPDATE / DELETE)

Table name

Status (ALLOWED / DENIED)

Message

Timestamp

3️⃣ Audit Logging Procedure

Procedure: LOG_AUDIT
Centralized procedure used by triggers to record all actions consistently.

4️⃣ Restriction Logic

Function: IS_RESTRICTED_DAY

Returns BOOLEAN

Used internally by triggers

Enforces weekday and holiday restrictions

Wrapper Function: IS_RESTRICTED_DAY_SQL

Returns NUMBER

Enables SQL-based testing (SELECT)

Used for validation and reporting

5️⃣ Simple Trigger

Trigger: TRG_RESTRICT_ADMISSIONS

Enforces business rules on the ADMISSIONS table

Blocks invalid operations

Logs both allowed and denied attempts

6️⃣ Compound Trigger

Trigger: TRG_COMPOUND_AUDIT

Implemented on the PATIENTS table

Uses compound trigger structure

Enforces restriction rules at row level

Logs detailed audit records

🧪 Testing & Validation
✔ Test Scenarios Covered

Test Case	Expected Result	Status
Insert on weekday	DENIED	✅
Insert on weekend	ALLOWED	✅
Insert on public holiday	DENIED	✅
Audit logging	Recorded	✅
Error messaging	Clear & user-friendly	✅
🔍 Sample Error Message
ORA-20011: Transaction blocked due to business rule


This confirms correct enforcement of restrictions.

🔎 Audit Verification Query
SELECT username, action_type, table_name, status, message, action_date
FROM audit_log
ORDER BY action_date DESC;


Confirms:

User identity captured

Both ALLOWED and DENIED actions logged

Accurate timestamps

🛡️ Key Concepts Demonstrated

Business rule enforcement

Simple & compound triggers

PL/SQL Boolean logic

SQL-compatible wrapper functions

Custom exceptions

Centralized auditing

Secure transaction control

🏁 Conclusion

Phase VII successfully implements enterprise-level control and auditing within the Emergency Response and Bed Availability Tracker.
The system ensures operational safety, compliance with hospital policies, and full traceability of user actions.

This phase completes the project’s advanced PL/SQL requirements and demonstrates real-world database governance.
