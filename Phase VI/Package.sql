//package specification
CREATE OR REPLACE PACKAGE pkg_emergency_management IS
    PROCEDURE admit_patient(p_patient_id NUMBER, p_bed_id NUMBER);
    PROCEDURE discharge_patient(p_admission_id NUMBER);
    FUNCTION available_beds(p_ward_id NUMBER) RETURN NUMBER;
END pkg_emergency_management;
/

//package body
CREATE OR REPLACE PACKAGE BODY pkg_emergency_management IS

PROCEDURE admit_patient(p_patient_id NUMBER, p_bed_id NUMBER) IS
    v_id NUMBER;
BEGIN
    pr_admit_patient(p_patient_id, p_bed_id, v_id);
END;

PROCEDURE discharge_patient(p_admission_id NUMBER) IS
BEGIN
    pr_discharge_patient(p_admission_id);
END;

FUNCTION available_beds(p_ward_id NUMBER) RETURN NUMBER IS
BEGIN
    RETURN fn_available_beds(p_ward_id);
END;

END pkg_emergency_management;
/

