-- Questionnaire Builder v1 event
SELECT
    *
FROM
    {{ ref('stg_event_quest') }}
WHERE
    end_questionnaire IS NOT NULL -- column present
