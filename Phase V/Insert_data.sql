INSERT INTO wards (ward_name, total_beds)
SELECT 
    'Ward_' || LEVEL,
    MOD(LEVEL,20) + 10
FROM dual
CONNECT BY LEVEL <= 10;

INSERT INTO beds (ward_id, status)
SELECT
    MOD(LEVEL,10) + 1,
    CASE MOD(LEVEL,3)
        WHEN 0 THEN 'Available'
        ELSE 'Occupied'
    END
FROM dual
CONNECT BY LEVEL <= 300;

INSERT INTO patients (full_name, category)
SELECT
    'Patient_' || LEVEL,
    CASE MOD(LEVEL,4)
        WHEN 0 THEN 'Emergency'
        ELSE 'Regular'
    END
FROM dual
CONNECT BY LEVEL <= 200;

INSERT INTO admissions (patient_id, bed_id, admission_date)
SELECT
    MOD(LEVEL,200) + 1,
    MOD(LEVEL,300) + 1,
    SYSDATE - MOD(LEVEL,30)
FROM dual
CONNECT BY LEVEL <= 250;

COMMIT;


