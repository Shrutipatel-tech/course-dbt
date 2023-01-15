# Week 1 project 

#How many users do we have?

select
    count(distinct user_id) as total_users
from
    dev_db.dbt_spatelcarguruscom.stg_postgres_users;
    
# Answere: 
TOTAL_USERS
130
    
    
