SELECT
    type,
    payload
FROM
    event AS e
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            event_applied
        WHERE
            event_id = e.id)
ORDER BY
    id ASC;
