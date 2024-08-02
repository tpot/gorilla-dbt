-- Task Builder v1 event
SELECT
    *
FROM
    {{ ref('stg_event') }}
WHERE
    trial_number IS NOT NULL -- column present
