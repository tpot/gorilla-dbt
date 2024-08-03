SELECT
    {{ grain_columns() }}
FROM
    {{ source('event_task_csv', 'stg_event_task') }}
WHERE
    event_index != 'END OF FILE'
