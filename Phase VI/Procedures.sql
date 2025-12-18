//Procedure 1: Admit Patient (IN, OUT + DML + Exception)
CREATE OR REPLACE PROCEDURE pr_admit_patient (
    p_patient_id IN NUMBER,
    p_bed_id     IN NUMBER,
    p_adm_id     OUT NUMBER
) IS
    e_bed_occupied EXCEPTION;
BEGIN
    IF NOT fn_is_bed_available(p_bed_id) THEN
        RAISE e_bed_occupied;
    END IF;

    INSERT INTO admissions (patient_id, bed_id)
    VALUES (p_patient_id, p_bed_id)
    RETURNING admission_id INTO p_adm_id;

    UPDATE beds
    SET status = 'Occupied'
    WHERE bed_id = p_bed_id;

EXCEPTION
    WHEN e_bed_occupied THEN
        INSERT INTO system_alerts (message)
        VALUES ('Attempt to assign occupied bed: ' || p_bed_id);
        RAISE_APPLICATION_ERROR(-20001, 'Bed already occupied');
END;
/

//Procedure 2: Discharge Patient
CREATE OR REPLACE PROCEDURE pr_discharge_patient (
    p_admission_id IN NUMBER
) IS
    v_bed_id NUMBER;
BEGIN
    SELECT bed_id INTO v_bed_id
    FROM admissions
    WHERE admission_id = p_admission_id;

    UPDATE admissions
    SET discharge_date = SYSDATE
    WHERE admission_id = p_admission_id;

    UPDATE beds
    SET status = 'Available'
    WHERE bed_id = v_bed_id;
END;
/

//Procedure 3: Daily Bed Report (Cursor)
CREATE OR REPLACE PROCEDURE pr_daily_report IS
    CURSOR c_wards IS
        SELECT ward_id, ward_name FROM wards;
    v_available NUMBER;
BEGIN
    FOR rec IN c_wards LOOP
        v_available := fn_available_beds(rec.ward_id);
        DBMS_OUTPUT.PUT_LINE(
            rec.ward_name || ' - Available beds: ' || v_available
        );
    END LOOP;
END;
/

//Procedure 4: Emergency Priority Allocation
CREATE OR REPLACE PROCEDURE pr_emergency_priority IS
BEGIN
    INSERT INTO system_alerts (message)
    VALUES ('Emergency priority check executed at ' || SYSDATE);
END;
/

//Procedure 5: Cleanup Old Admissions
CREATE OR REPLACE PROCEDURE pr_cleanup IS
BEGIN
    DELETE FROM admissions
    WHERE discharge_date < SYSDATE - 365;
END;
/


