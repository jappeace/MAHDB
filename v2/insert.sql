BEGIN;
INSERT INTO event (payload, type, created)
    VALUES ('{"email":"hi@jappie.me"}',
        /* whatever event source data*/
        'create-user', now());
INSERT INTO event_applied (event_id, created)
SELECT
    last_value,
    now()
FROM
    event_id_seq;
COMMIT;
