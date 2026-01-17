/*
    Custom Test: Assert Positive Views
    
    This test ensures that view counts and forward counts are non-negative.
    Negative engagement metrics would indicate data corruption.
    
    Test passes when query returns 0 rows.
*/

SELECT
    message_id,
    channel_name,
    view_count,
    forward_count,
    message_timestamp
FROM {{ ref('fct_messages') }}
WHERE 
    view_count < 0 
    OR forward_count < 0
    OR forward_count > view_count  -- Can't have more forwards than views