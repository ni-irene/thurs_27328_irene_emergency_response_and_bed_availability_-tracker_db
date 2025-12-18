//Window functions
SELECT ward_id, bed_id,
       ROW_NUMBER() OVER (PARTITION BY ward_id ORDER BY bed_id) AS rn,
       RANK() OVER (PARTITION BY ward_id ORDER BY bed_id) AS rk,
       LAG(status) OVER (PARTITION BY ward_id ORDER BY bed_id) AS prev_status
FROM beds;
