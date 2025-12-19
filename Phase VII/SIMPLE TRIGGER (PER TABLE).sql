//SIMPLE TRIGGER (PER TABLE)
//Example: ADMISSIONS table
CREATE OR REPLACE TRIGGER trg_restrict_admissions
BEFORE INSERT OR UPDATE OR DELETE ON admissions
FOR EACH ROW
BEGIN
    IF is_restricted_day THEN
        log_audit(
            ORA_SYSEVENT,
            'ADMISSIONS',
            'DENIED',
            'Operation blocked due to weekday or public holiday'
        );
        RAISE_APPLICATION_ERROR(
            -20010,
            'Operation not allowed on weekdays or public holidays'
        );
    ELSE
        log_audit(
            ORA_SYSEVENT,
            'ADMISSIONS',
            'ALLOWED',
            'Operation permitted'
        );
    END IF;
END;
/
