🚨 Phase VII – Advanced Programming & Auditing

Emergency Response and Bed Availability Tracker

👩‍🎓 Student Information

Name: Igiraneza Irene

Student ID: 27328

Database: Oracle 21c Express Edition (XE)

Schema: PDB_ADMIN

📌 Phase Overview

Phase VII focuses on advanced PL/SQL programming and auditing mechanisms to enforce strict business rules within the Emergency Response and Bed Availability Tracker system.

This phase introduces time-based transaction control, comprehensive audit logging, and trigger-driven enforcement to ensure data integrity, security, and accountability in a real-world hospital environment.

🎯 Objective

The main objectives of this phase are to:

Enforce critical business rules using PL/SQL triggers

Restrict database modifications based on time conditions

Log all user actions (allowed and denied)

Demonstrate advanced PL/SQL concepts such as:

Simple triggers

Compound triggers

Boolean logic

Custom exceptions

Auditing procedures

🚫 Critical Business Rule (Mandatory Requirement)

Employees are NOT allowed to INSERT, UPDATE, or DELETE records when:

The current day is a weekday (Monday–Friday)

The current day is a public holiday

✅ Allowed Operations

Transactions performed on weekends (Saturday and Sunday)

❌ Blocked Operations

All data modification operations on weekdays

All data modification operations on public holidays

Every attempt—successful or blocked—is recorded in the audit log.

🧩 System Components Implemented
1️⃣ Public Holiday Management

Table: PUBLIC_HOLIDAYS

Stores official public holidays used to determine restricted transaction days.

Purpose:

Enables dynamic holiday management

Supports business rule enforcement without code changes

2️⃣ Audit Logging System

Table: AUDIT_LOG

Captures detailed information about every database modification attempt.

Logged Information:

Database username

Operation type (INSERT, UPDATE, DELETE)

Affected table name

Operation status (ALLOWED / DENIED)

Descriptive message

Timestamp of the action

This ensures full traceability and accountability.

3️⃣ Centralized Audit Procedure

Procedure: LOG_AUDIT

A reusable PL/SQL procedure that records audit entries from all triggers, ensuring:

Consistent logging

Reduced code duplication

Easier maintenance

4️⃣ Restriction Logic Functions
🔹 IS_RESTRICTED_DAY

Returns BOOLEAN

Used internally by triggers

Determines whether a transaction should be blocked based on:

Day of the week

Public holiday check

🔹 IS_RESTRICTED_DAY_SQL

Returns NUMBER (1 = Restricted, 0 = Allowed)

Created specifically for SQL-based testing

Allows validation without altering server system dates

This dual-function approach demonstrates advanced PL/SQL design.

5️⃣ Simple Trigger

Trigger: TRG_RESTRICT_ADMISSIONS

Applied to the ADMISSIONS table

Executes before INSERT, UPDATE, or DELETE

Enforces restriction rules

Logs every attempt

Raises clear, user-friendly error messages

6️⃣ Compound Trigger

Trigger: TRG_COMPOUND_AUDIT

Applied to the PATIENTS table

Uses compound trigger structure

Performs row-level restriction checks

Ensures centralized auditing and rule enforcement

Demonstrates advanced trigger programming

🧪 Testing & Validation

✔ Test Scenarios Executed

Test Case	Expected Outcome	Result

Insert on weekday	Blocked	✅

Insert on weekend	Allowed	✅

Insert on public holiday	Blocked	✅

Audit record creation	Logged	✅

Error message clarity	Clear & descriptive	✅

🔍 Sample Error Message

ORA-20011: Transaction blocked due to business rule


This confirms that restrictions are correctly enforced.

🔎 Audit Verification Query

SELECT username, action_type, table_name, status, message, action_date
FROM audit_log
ORDER BY action_date DESC;


Result confirms:

Correct user identification

Accurate action tracking

Both ALLOWED and DENIED attempts recorded

Reliable timestamps

🛡️ Advanced Concepts Demonstrated

Time-based business rule enforcement

Simple and compound triggers

Custom exceptions

Boolean logic in PL/SQL

SQL-compatible testing functions

Centralized audit logging

Secure transaction control

🏁 Conclusion

Phase VII successfully implements enterprise-level control and auditing mechanisms for the Emergency Response and Bed Availability Tracker.

The system ensures:

Strict enforcement of hospital operational policies

Prevention of unauthorized data manipulation

Full visibility and accountability of user actions

This phase completes the project’s advanced PL/SQL requirements and reflects real-world database governance practices.
