//AUDIT LOGGING PROCEDURE
CREATE OR REPLACE PROCEDURE log_audit (
    p_action   VARCHAR2,
    p_table    VARCHAR2,
    p_status   VARCHAR2,
    p_message  VARCHAR2
) AS
BEGIN
    INSERT INTO audit_log (username, action_type, table_name, status, message)
    VALUES (USER, p_action, p_table, p_status, p_message);
END;
/
