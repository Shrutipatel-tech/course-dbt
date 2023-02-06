{{
  config(
    materialized='table'
  )
}}


SELECT
    event_id 
    ,session_id as session_guid
    ,user_id as user_guid
    ,page_url
    ,created_at::timestampntz as created_at_utc
    ,event_type
    ,order_id 
    ,product_id 
FROM {{ source('postgres', 'events') }}