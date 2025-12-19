//AUDIT LOG TABLE
CREATE TABLE audit_log (
    audit_id      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username      VARCHAR2(50),
    action_type   VARCHAR2(10),
    table_name    VARCHAR2(30),
    action_date   DATE DEFAULT SYSDATE,
    status        VARCHAR2(10),
    message       VARCHAR2(200)
);
