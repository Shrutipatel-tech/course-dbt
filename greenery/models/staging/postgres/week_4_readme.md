## Which orders changed from week 3 to week 4? 


SELECT order_id
from orders_snapshot
where dbt_valid_to < '2023-02-01'
    


  ##   ORDER_ID

265f9aae-561a-4232-a78a-7052466e46b7

e42ba9a9-986a-4f00-8dd2-5cf8462c74ea

b4eec587-6bca-4b2a-b3d3-ef2db72c4a4f

29d20dcd-d0c4-4bca-a52d-fc9363b5d7c6

c0873253-7827-4831-aa92-19c38372e58d

e2729b7d-e313-4a6f-9444-f7f65ae8db9a

## Product funnel 

select 

SUM(page_view) as sessions_with_view, 

sum(add_to_cart) as sessions_with_cart, 

sum(checkout) as sessions_with_checkout

from {{ref('int_session_events')}}