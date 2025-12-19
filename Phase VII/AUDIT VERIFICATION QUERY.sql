//AUDIT VERIFICATION QUERY

SELECT username, action_type, table_name, status, message, action_date
FROM audit_log
ORDER BY action_date DESC;


