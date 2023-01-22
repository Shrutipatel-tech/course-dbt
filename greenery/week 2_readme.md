**What is our user repeat rate?**

**0.798**




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




**Which orders changed from week 1 to week 2? **



 select dbt_valid_to
 
    from dev_db.dbt_spatelcarguruscom.orders_snapshot
    
    where dbt_valid_to IS not null;




**DBT_VALID_TO**

2023-01-19 20:56:59.266

2023-01-19 20:56:59.266

2023-01-19 20:56:59.266


