//Testing

//TEST 1: INSERT ON WEEKDAY (DENIED)
INSERT INTO patients VALUES (201, 'Weekday Test', 'Regular');


//TEST 2: INSERT ON WEEKEND (ALLOWED)
//Run on Saturday or Sunday
-- Saturday example
SELECT is_restricted_day_sql(DATE '2025-12-20') AS result
FROM dual;

//TEST 3: INSERT ON PUBLIC HOLIDAY (DENIED)
INSERT INTO public_holidays (holiday_date, description)
VALUES (DATE '2025-11-16', 'Test Holiday');

SELECT is_restricted_day_sql(DATE '2025-11-16') FROM dual;





