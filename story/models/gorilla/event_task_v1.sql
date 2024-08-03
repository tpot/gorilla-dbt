-- Task Builder v1 event
SELECT
    *
FROM
    {{ ref('stg_event_task') }}
WHERE
    trial_number IS NOT NULL -- column present
