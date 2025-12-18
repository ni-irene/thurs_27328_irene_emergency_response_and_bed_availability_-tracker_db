SELECT COUNT(*) 
FROM admissions
WHERE patient_id NOT IN (SELECT patient_id FROM patients);

SELECT status, COUNT(*) 
FROM beds
GROUP BY status;

SELECT w.ward_name, COUNT(b.bed_id) AS beds_in_use
FROM wards w
JOIN beds b ON w.ward_id = b.ward_id
WHERE b.status = 'Occupied'
GROUP BY w.ward_name;


