select 
      PRODUCT_ID
    , name
    , price
    , inventory 
    , count(distinct event_id) as cnt_events
    , count(distinct session_id) as cnt_sessions
    , count(distinct page_url) as cnt_pages
from  {{ ref('int_product_orders') }}
group by 1,2,3,4