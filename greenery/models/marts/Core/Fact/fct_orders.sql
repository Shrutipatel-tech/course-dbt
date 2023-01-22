with orders as (
    select *
    from {{ ref ('stg_postgres_orders') }}
)
, addresses as (
    select *
    from {{ ref ('stg_postgres_addresses') }}
)
, promos as (
    select *
    from {{ ref ('stg_postgres_promos') }}
)

select
	
	 P.promo_id as promo_id_P
	, p.discount
	, p.status
	, a.address
	, a.zipcode
	, a.state
	, a.country
	,O.ORDER_ID
   ,O.USER_ID
   , O.PROMO_ID
,O.ADDRESS_ID
,O.CREATED_AT
,O.ORDER_COST
,O.SHIPPING_COST
,O.ORDER_TOTAL
,O.TRACKING_ID
,O.SHIPPING_SERVICE
,O.ESTIMATED_DELIVERY_AT
,O.DELIVERED_AT
from orders o
left join addresses a
    on a.address_id = o.address_id
left join promos p
    on p.promo_id = o.promo_id