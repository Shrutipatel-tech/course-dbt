{{
  config(
    materialized='table'
  )
}}
with Events as (
    select *
    from {{ ref ('stg_postgres_events') }}
),
order_items as (
    select *
    from {{ ref ('stg_postgres_order_items') }}
)
select 
E.event_id,
E.session_id,
E.user_id,
E.event_type,
E.order_id as ORDER_ID_Events,
E.PRODUCT_ID as PRODUCT_ID_Events,
oi.order_id,
oi.product_id,
oi.quantity
from  Events E
left join order_items oi
on E.order_id =  oi.order_id
