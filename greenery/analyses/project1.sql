#How many users do we have?
select
    count(distinct user_id) as total_users
from
    stg_orders