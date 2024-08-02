SELECT
    -- Keep nearly all columns except ones we transform
    * EXCLUDE (
        event_index,
        utc_timestamp,
        local_timestamp,
        utc_date,
        local_date,
        local_timezone
    ),
    -- Schema auto
    CAST(event_index AS BIGINT) AS event_index,
    epoch_ms (CAST(utc_timestamp AS BIGINT)) AS utc_timestamp,
    epoch_ms (CAST(local_timestamp AS BIGINT)) AS local_timestamp,
FROM
    {{ source('event_csv', 'stg_event') }}
WHERE
    event_index != 'END OF FILE'
