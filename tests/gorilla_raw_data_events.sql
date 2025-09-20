-- Test for duplicate events across tasks

WITH

    raw_data AS (
        SELECT
            event_index,
            participant_private_id,
            tree_node_key
        FROM {{ ref('gorilla__task_lwe7') }}
        UNION ALL
        SELECT
            event_index,
            participant_private_id,
            tree_node_key
        FROM {{ ref('gorilla__task_y5i7') }}
        UNION ALL
        SELECT
            event_index,
            participant_private_id,
            tree_node_key
        FROM {{ ref('gorilla__task_z5kw') }}
    )

SELECT
    *,
    COUNT(*) AS count
FROM raw_data
GROUP BY ALL
HAVING count > 1
