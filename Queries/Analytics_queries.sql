-- 1. Bed occupancy per ward
SELECT w.ward_name,
       COUNT(b.bed_id) AS total_beds,
       SUM(CASE WHEN b.status = 'Occupied' THEN 1 ELSE 0 END) AS occupied_beds,
       ROUND(
           (SUM(CASE WHEN b.status = 'Occupied' THEN 1 ELSE 0 END) /
           COUNT(b.bed_id)) * 100, 2
       ) AS occupancy_rate
FROM wards w
JOIN beds b ON w.ward_id = b.ward_id
GROUP BY w.ward_name;

-- 2. Available beds per ward
SELECT w.ward_name,
       COUNT(*) AS available_beds
FROM wards w
JOIN beds b ON w.ward_id = b.ward_id
WHERE b.status = 'Available'
GROUP BY w.ward_name;

-- 3. Emergency admissions per day
SELECT TRUNC(a.admission_date) AS admission_day,
       COUNT(*) AS emergency_count
FROM admissions a
JOIN patients p ON a.patient_id = p.patient_id
WHERE p.category = 'Emergency'
GROUP BY TRUNC(a.admission_date)
ORDER BY admission_day;

-- 4. Average length of stay
SELECT ROUND(AVG(discharge_date - admission_date), 2) AS avg_length_of_stay
FROM admissions
WHERE discharge_date IS NOT NULL;

-- 5. Audit violations by user
SELECT username,
       COUNT(*) AS violation_count
FROM audit_log
WHERE status = 'DENIED'
GROUP BY username
ORDER BY violation_count DESC;

-- 6. Ranking wards by occupancy (WINDOW FUNCTION)
SELECT ward_name,
       occupancy_rate,
       RANK() OVER (ORDER BY occupancy_rate DESC) AS occupancy_rank
FROM (
    SELECT w.ward_name,
           ROUND(
             (SUM(CASE WHEN b.status = 'Occupied' THEN 1 ELSE 0 END) /
             COUNT(b.bed_id)) * 100, 2
           ) AS occupancy_rate
    FROM wards w
    JOIN beds b ON w.ward_id = b.ward_id
    GROUP BY w.ward_name
);

-- 7. Admission trend comparison (LAG function)
SELECT admission_day,
       total_admissions,
       total_admissions -
       LAG(total_admissions) OVER (ORDER BY admission_day) AS daily_change
FROM (
    SELECT TRUNC(admission_date) AS admission_day,
           COUNT(*) AS total_admissions
    FROM admissions
    GROUP BY TRUNC(admission_date)
);
