**What is our user repeat rate?**




with No_orders as (

select user_id,

count(distinct order_id) as total_orders

from dev_db.dbt_spatelcarguruscom.stg_postgres_orders

group by 1

),    

repeats as(

select* from No_orders where total_orders>=2

)

select 

round (count(distinct R.user_id)/count(distinct T.user_id),3)

from No_orders T left join repeats R

on R.user_id = T.user_id
