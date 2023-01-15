BEGIN;
INSERT INTO event (payload, type, created, transaction_id)
    VALUES ('{"email":"hi@jappie.me"}'
           , 'create-user'
           , now()
           , txid_current());
INSERT INTO event_applied (event_id, created)
SELECT
    last_value,
    now()
FROM
    event_id_seq;
COMMIT;
