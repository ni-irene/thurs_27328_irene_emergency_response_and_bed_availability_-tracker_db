//COMPOUND TRIGGER (CENTRALIZED CONTROL)
CREATE OR REPLACE TRIGGER trg_compound_audit
FOR INSERT OR UPDATE OR DELETE ON patients
COMPOUND TRIGGER

    BEFORE STATEMENT IS
    BEGIN
        NULL;
    END BEFORE STATEMENT;

    BEFORE EACH ROW IS
    BEGIN
        IF is_restricted_day THEN
            log_audit(
                ORA_SYSEVENT,
                'PATIENTS',
                'DENIED',
                'Blocked by compound trigger rule'
            );
            RAISE_APPLICATION_ERROR(
                -20011,
                'Transaction blocked due to business rule'
            );
        END IF;
    END BEFORE EACH ROW;
    
END trg_compound_audit;
/

