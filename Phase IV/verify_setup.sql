SELECT name, open_mode FROM v$pdbs WHERE name = 'THURS_27328_IRENE_EMERGENCYTRACKER_DB';
/
SELECT tablespace_name, file_name, bytes/1024/1024 AS size_mb, autoextensible
FROM dba_data_files
WHERE tablespace_name LIKE 'EMERGENCY%%'
UNION
SELECT tablespace_name, file_name, bytes/1024/1024 AS size_mb, autoextensible
FROM dba_temp_files;
/
SELECT name, value FROM v$parameter
WHERE name IN ('sga_target', 'pga_aggregate_target');
/
SELECT log_mode FROM v$database;
/
