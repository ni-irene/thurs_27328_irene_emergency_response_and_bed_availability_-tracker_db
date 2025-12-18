//Function one: Check Available Beds in a Ward

CREATE OR REPLACE FUNCTION fn_available_beds (
    p_ward_id IN NUMBER
) RETURN NUMBER IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM beds
    WHERE ward_id = p_ward_id
      AND status = 'Available';

    RETURN v_count;
END;
/

//Function 2: Validate Bed Availability
CREATE OR REPLACE FUNCTION fn_is_bed_available (
    p_bed_id IN NUMBER
) RETURN BOOLEAN IS
    v_status beds.status%TYPE;
BEGIN
    SELECT status INTO v_status
    FROM beds
    WHERE bed_id = p_bed_id;

    RETURN (v_status = 'Available');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END;
/

//Function 3: Get Ward Name (Lookup) 

CREATE OR REPLACE FUNCTION fn_get_ward_name (
    p_ward_id IN NUMBER
) RETURN VARCHAR2 IS
    v_name wards.ward_name%TYPE;
BEGIN
    SELECT ward_name INTO v_name
    FROM wards
    WHERE ward_id = p_ward_id;

    RETURN v_name;
END;
/

//Function 4: Count Emergency Patients
CREATE OR REPLACE FUNCTION fn_emergency_count
RETURN NUMBER IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM patients
    WHERE category = 'Emergency';

    RETURN v_count;
END;
/

//Function 5: Check Bed Occupancy Percentage
CREATE OR REPLACE FUNCTION fn_bed_occupancy_rate (
    p_ward_id IN NUMBER
) RETURN NUMBER IS
    v_total NUMBER;
    v_used  NUMBER;
BEGIN
    SELECT total_beds INTO v_total FROM wards WHERE ward_id = p_ward_id;
    SELECT COUNT(*) INTO v_used FROM beds WHERE ward_id = p_ward_id AND status = 'Occupied';

    RETURN (v_used / v_total) * 100;
END;
/

