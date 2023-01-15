BEGIN;

/* projection code, insert user into tables here */
INSERT INTO event (payload, type, created)
    VALUES (
        /* whatever event source data*/
        '{"email":"hi@jappie.me"}', 'create-user', now());
INSERT INTO event_last_applied (id, event_id)
SELECT
    1,
    max(id)
FROM
    event
ON CONFLICT (id)
    DO UPDATE SET
        event_id = lastval();

/* projection code, connect user to company */
INSERT INTO event (payload, type, created)
    VALUES (
        /* whatever event source data*/
        '{"company-id":2, "user-id": 1}', 'connect-company', now());
INSERT INTO event_last_applied (id, event_id)
SELECT
    1,
    max(id)
FROM
    event
ON CONFLICT (id)
    DO UPDATE SET
        event_id = lastval();
COMMIT;
