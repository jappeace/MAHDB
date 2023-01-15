BEGIN;
INSERT INTO event (payload, type, created)
    VALUES ('{"email":"hi@jappie.me"}',
        /* whatever event source data*/
        'create-user', now());
INSERT INTO event_last_applied (id, event_id)
SELECT
    1,
    max(id)
FROM
    event
ON CONFLICT (id)
    DO UPDATE SET
        event_id = lastval();
;
COMMIT;
