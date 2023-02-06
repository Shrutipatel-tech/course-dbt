{{
  config(
    materialized='table'
  )
}}

with session_event_agg as (
    select distinct 
        session_guid,
        user_guid,
        SUM(case when event_type = 'page_view' then 1 else 0 end) as page_view,
        SUM(case when event_type = 'add_to_cart' then 1 else 0 end ) as add_to_cart,
        SUM(case when event_type = 'checkout' then 1 else 0 end) as checkout
    from {{ref('stg_postgres_events')}}
    group by 1,2)

select 
    session_guid,
    user_guid,
    case when page_view > 0 then 1 else 0 end as page_view,
    case when add_to_cart > 0 then 1 else 0 end as add_to_cart,
    case when checkout > 0 then 1 else 0 end as checkout
from session_event_agg