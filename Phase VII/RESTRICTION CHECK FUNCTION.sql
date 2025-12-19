//RESTRICTION CHECK FUNCTION
-- Used internally by triggers
CREATE OR REPLACE FUNCTION is_restricted_day (
    p_test_date DATE DEFAULT SYSDATE
)
RETURN BOOLEAN
AS
    v_day   VARCHAR2(10);
    v_count NUMBER;
BEGIN
    v_day := TO_CHAR(p_test_date, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH');

    IF v_day IN ('MON','TUE','WED','THU','FRI') THEN
        RETURN TRUE;
    END IF;

    SELECT COUNT(*)
    INTO v_count
    FROM public_holidays
    WHERE holiday_date = TRUNC(p_test_date);

    IF v_count > 0 THEN
        RETURN TRUE;
    END IF;

    RETURN FALSE;
END;
/



