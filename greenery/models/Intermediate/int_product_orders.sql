{{
  config(
    materialized='table'
  )
}}

select 
P.PRODUCT_ID,
P.NAME,
P.PRICE,
P.INVENTORY,
OT.ORDER_ID as OT_ORDER_ID,
OT.PRODUCT_ID as OT_PRODUCT_ID,
OT.QUANTITY,
O.ORDER_ID,
O.USER_ID,
O.PROMO_ID,
O.ADDRESS_ID,
O.CREATED_AT,
O.ORDER_COST,
O.SHIPPING_COST,
O.ORDER_TOTAL,
O.TRACKING_ID,
O.SHIPPING_SERVICE,
O.ESTIMATED_DELIVERY_AT,
O.DELIVERED_AT,
E.event_id,
E.session_id,
E.user_id as event_user_id,
E.event_type,
E.page_url,
E.created_at as event_created_at,
E.order_id as event_order_id,
E.product_id as event_product_id

from  {{ ref('stg_postgres_orders') }} O
left join {{ ref('stg_postgres_order_items') }} OT 
on O.ORDER_ID=OT.ORDER_ID
left join {{ ref('stg_postgres_products') }} P  
on P.product_id=OT.PRODUCT_ID
left join {{ref('stg_postgres_events')}} E
on P.product_id= E.product_id