//TRIGGER (AUTOMATIC BED STATUS + ALERT)
CREATE OR REPLACE TRIGGER trg_ward_full_alert
AFTER UPDATE OF status ON beds
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM beds
    WHERE ward_id = :NEW.ward_id
      AND status = 'Available';

    IF v_count = 0 THEN
        INSERT INTO system_alerts (message)
        VALUES ('Ward ' || :NEW.ward_id || ' is fully occupied');
    END IF;
END;
/
