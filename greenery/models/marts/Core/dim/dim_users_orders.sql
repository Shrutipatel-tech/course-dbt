{{
  config(
    materialized='table'
  )
}}

    
    select 
        user_id
        ,count(distinct(order_id)) as cnt_orders
        ,sum(order_cost) as  total_order_value
        ,avg(order_cost) as avg_order_value
        ,sum(order_cost+shipping_cost) as total_order_value_shipping_incl
    from {{ ref('int_user_orders') }}
    group by 1