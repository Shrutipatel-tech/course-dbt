{% snapshot orders_snapshot %}
{{
  config(
    target_database = target.database,  
    target_schema = target.schema,      
    strategy='check',                   
                                        
    check_cols=['status'],              

    unique_key='order_id',              
   )
}}


  SELECT * FROM {{ source('postgres', 'orders') }}

{% endsnapshot %}