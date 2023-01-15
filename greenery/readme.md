# Week 1 project 

#How many users do we have?

select

    count(distinct user_id) as total_users
    
from

    dev_db.dbt_spatelcarguruscom.stg_postgres_users;
    
# Answer: 

TOTAL_USERS:
130
    

#On average, how many orders do we receive per hour?

 with orders_per_hour as(
 
        select 
        
            date_trunc(hour,created_at) as hours
            
            , count(order_id) as orders_unique
            
        from dev_db.dbt_spatelcarguruscom.stg_postgres_orders
        
        group by 1
    )
    
    select 
    
        round(avg(orders_unique),2) as avg_orders_per_hour 
        
    from orders_per_hour;

# Answer:

AVG_ORDERS_PER_HOUR:
7.52
