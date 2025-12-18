//Testing
SET SERVEROUTPUT ON
EXEC pr_daily_report;

SELECT fn_emergency_count FROM dual;

BEGIN
  pkg_emergency_management.admit_patient(1,1);
END;
/
