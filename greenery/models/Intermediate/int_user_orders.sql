{{
  config(
    materialized='table'
  )
}}
select 

U.USER_ID,
U.FIRST_NAME,
U.LAST_NAME,
U.EMAIL,
U.PHONE_NUMBER,
U.CREATED_AT,
U.UPDATED_AT,
O.ORDER_ID,
O.USER_ID as Order_user_ID,
O.PROMO_ID,
O.ADDRESS_ID as Order_address_ID,
O.CREATED_AT as Order_created_at,
O.ORDER_COST,
O.SHIPPING_COST,
O.ORDER_TOTAL,
O.SHIPPING_SERVICE,
O.ESTIMATED_DELIVERY_AT,
O.DELIVERED_AT,
O.STATUS,
A.ADDRESS_ID,
A.ADDRESS,
A.ZIPCODE,
A.STATE,
A.COUNTRY

from {{ ref('stg_postgres_users') }} U
left join {{ ref('stg_postgres_orders') }} O
on U.user_id=O.USER_ID
left join {{ ref('stg_postgres_addresses') }} A
on U.ADDRESS_ID=A.ADDRESS_ID

