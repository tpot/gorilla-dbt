SELECT
    {{ grain_columns() }}
FROM
    {{ source('event_quest_csv', 'stg_event_quest') }}
WHERE
    event_index != 'END OF FILE'
