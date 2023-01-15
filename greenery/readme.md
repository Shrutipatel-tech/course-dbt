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

#On average, how long does an order take from being placed to being delivered?

       select 
       
        round(sum(datediff(DAYS, created_at, delivered_at)) / 
        
        count(case when status = 'delivered' then order_id end),2) as average_delivery_time
        
    from dev_db.dbt_spatelcarguruscom.stg_postgres_orders
    
    where status = 'delivered';
    
   # Answer:
   
   AVERAGE_DELIVERY_TIME:
   3.89


#How many users have only made one purchase? Two purchases? Three+ purchases?




with unique_purchases as (

        select 
        
        user_id as users
        
        , count( distinct order_id ) as no_of_orders
        
    from dev_db.dbt_spatelcarguruscom.stg_postgres_orders
    
    group by 1
    
    )
    
    select
    
        case when no_of_orders = 1 then '1 Purchase'
        
            when no_of_orders = 2 then '2 Purchases'
            
            when no_of_orders > 2 then '3 or more Purchases'
            
        end as no_of_purchases
        
        , count(users) as no_of_users
        
    from unique_purchases
    
    group by 1
    
    order by 1;
    
   # Answer:
   NO_OF_PURCHASES	       NO_OF_USERS
   
   1 Purchase	           25
   
   2 Purchases	           28
   
   3 or more Purchases	   71
   
