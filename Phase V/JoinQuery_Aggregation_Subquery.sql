SELECT p.full_name, w.ward_name, b.status
FROM admissions a
JOIN patients p ON a.patient_id = p.patient_id
JOIN beds b ON a.bed_id = b.bed_id
JOIN wards w ON b.ward_id = w.ward_id;

SELECT w.ward_name, COUNT(a.admission_id) AS total_admissions
FROM admissions a
JOIN beds b ON a.bed_id = b.bed_id
JOIN wards w ON b.ward_id = w.ward_id
GROUP BY w.ward_name;

SELECT ward_name
FROM wards
WHERE ward_id IN (
    SELECT ward_id
    FROM beds
    WHERE status = 'Available'
);

