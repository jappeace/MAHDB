SELECT
    array_agg(type) AS types,
    array_agg(payload) AS payloads
FROM
    event AS e
WHERE
    NOT EXISTS (
        SELECT 1 FROM event_applied WHERE event_id = e.id)
GROUP BY
    transaction_id
ORDER BY
    max(id) ASC;
