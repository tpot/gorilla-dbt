{% macro grain_columns() %}
    -- Grain for Gorilla metrics                   example
    experiment_id,                              -- 75435
    experiment_version,                         -- 7
    tree_node_key,                              -- task-bgps
    task_version,                               -- 19
    schedule_id,                                -- 37230253
    CAST(event_index AS BIGINT) AS event_index, -- 1
    -- Timestamps
    epoch_ms (CAST(utc_timestamp AS BIGINT)) AS utc_timestamp,
    epoch_ms (CAST(local_timestamp AS BIGINT)) AS local_timestamp,
    -- Everything else
    * EXCLUDE (
        -- Grain
        experiment_id,
        experiment_version,
        tree_node_key,
        task_version,
        schedule_id,
        event_index,
        -- Timestamps
        utc_timestamp,
        local_timestamp,
        -- Drop duplicate date columns
        utc_date,
        local_date
    )
{% endmacro %}
