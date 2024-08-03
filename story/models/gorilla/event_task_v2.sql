-- Task Builder v2 event
SELECT
    *
FROM
    {{ ref('stg_event_task') }}
WHERE
    trial_number IS NULL -- column not present
