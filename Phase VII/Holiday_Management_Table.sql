//Holiday management table
CREATE TABLE public_holidays (
    holiday_id   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    holiday_date DATE NOT NULL UNIQUE,
    description  VARCHAR2(100)
);

//Sample Data (Upcoming Month)
INSERT INTO public_holidays (holiday_date, description)
VALUES (TRUNC(SYSDATE) + 5, 'National Holiday');

INSERT INTO public_holidays (holiday_date, description)
VALUES (TRUNC(SYSDATE) + 12, 'Public Health Day');

COMMIT;
