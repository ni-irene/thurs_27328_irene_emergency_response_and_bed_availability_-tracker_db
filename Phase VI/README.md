# Emergency Response and Bed Availability Tracker

## Student Information
- **Name:** Igiraneza Irene  
- **ID:** 27328  
- **Course:** PL/SQL database 

---

## Project Overview
Hospitals often face delays in emergency care due to poor visibility of available beds across wards.  
This project implements a **PL/SQL-based Emergency Response and Bed Availability Tracker** that automates bed allocation, prioritizes emergency patients, and prevents double-booking.

---

## Database Schema
- **WARDS** – Stores ward information and capacity
- **BEDS** – Tracks bed availability per ward
- **PATIENTS** – Stores patient demographics and priority category
- **ADMISSIONS** – Records patient admissions and discharges
- **SYSTEM_ALERTS** – Logs alerts and exception messages

---

## Key Features
- Automatic bed status updates using triggers
- Emergency patient prioritization
- Prevention of bed double-booking
- Daily ward availability reports
- Real-time alerts when wards are fully occupied
- Exception handling and logging

---

## PL/SQL Components Implemented

### Procedures
- Admit patient
- Discharge patient
- Generate daily bed report
- Emergency priority check
- Cleanup old admissions

### Functions
- Available bed count per ward
- Bed availability validation
- Ward lookup
- Emergency patient count
- Ward occupancy rate calculation

### Advanced Concepts
- Explicit cursors
- Window functions (ROW_NUMBER, RANK, LAG)
- Packages (Specification & Body)
- Custom exceptions (ORA-20001)
- Triggers for automation

---

## Testing & Validation
- Verified foreign key constraints
- Tested edge cases (double booking)
- Validated emergency priority logic
- Confirmed alert logging functionality

---

## Sample Output
Ward_1 - Available beds: 10
Ward_2 - Available beds: 10
...

Attempting to assign an occupied bed correctly raises:
ORA-20001: Bed already occupied

## Conclusion
This system demonstrates a real-world hospital emergency management solution using Oracle PL/SQL, ensuring data integrity, automation, and fast decision-making during critical situations.
