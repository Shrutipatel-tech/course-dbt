select
    count(distinct user_id) as total_users
from
    dev_db.dbt_spatelcarguruscom.stg_orders