{{
  config(
    materialized='table'
  )
}}

select
product_id,
NAME as Product_Name,
price as unit_price,
count(distinct OT_ORDER_ID) as total_orders,
sum(QUANTITY) total_quantity
from {{ ref('int_product_orders') }}  
group by 1,2,3