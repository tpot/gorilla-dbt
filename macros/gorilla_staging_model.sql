-- noqa: disable=ambiguous.column_count

{% macro gorilla_staging_model(tree_node_key) %}

SELECT
    * EXCLUDE (
        utc_date,
        local_timestamp,
        local_timezone,
        local_date
    )

    REPLACE (
        event_index::BIGINT AS event_index,
        epoch_ms(utc_timestamp::BIGINT) AT TIME ZONE 'UTC' AS utc_timestamp
    )

FROM
    read_csv(
        'data/data_exp_*_{{ tree_node_key }}.csv',
        normalize_names = True,
        null_padding = True,
        parallel = False,
        types = { 'event_index': 'VARCHAR' }
    )
WHERE
    event_index != 'END OF FILE'
{% endmacro %}
