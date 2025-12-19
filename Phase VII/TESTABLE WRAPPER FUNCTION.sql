//TESTABLE WRAPPER FUNCTION
CREATE OR REPLACE FUNCTION is_restricted_day_sql (
    p_test_date DATE
)
RETURN NUMBER
AS
BEGIN
    IF is_restricted_day(p_test_date) THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;
END;
/
