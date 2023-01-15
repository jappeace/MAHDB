SELECT type, payload FROM event
WHERE
    id > (
        SELECT event_id FROM event_last_applied
        WHERE id = 1)
ORDER BY
    id ASC;
