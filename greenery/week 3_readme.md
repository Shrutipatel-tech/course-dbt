 1: What is our overall conversion rate?

  select 
  count(distinct case when order_id is not null then session_id end) as unique_sessions_per_purchase
  , count(distinct session_id) as total_unique_sessions
  , (unique_sessions_per_purchase/total_unique_sessions)*100 as Conversion_Rate
    from fct_events_orders


CONVERSION_RATE
62.4567



2: What is our conversion rate by product?

 with unique_sessions_per_product_purchase  as (
        select 
            product_id 
            , count(distinct case when ORDER_ID_Events is not null then session_id end) as unique_sessions_per_product_purchase
        from fct_events_orders
        where product_id is not null
        group by 1
        order by 1
    )
    
, unique_sessions_per_product_viewed as (
        select 
        PRODUCT_ID_EVENTS
        , count(distinct case when event_type = 'page_view'  then session_id end) as unique_sessions_per_product_viewed
        from fct_events_orders
        where PRODUCT_ID_EVENTS is not null
        group by 1
        order by 1
    )
    
    select
    coalesce(usp.product_id, usv.PRODUCT_ID_EVENTS) as product__id
    ,p.name as product_name
    , unique_sessions_per_product_purchase
    , unique_sessions_per_product_viewed
  , unique_sessions_per_product_purchase / unique_sessions_per_product_viewed as conversion_rate_by_product
    
    
    
     from unique_sessions_per_product_purchase usp
    left join unique_sessions_per_product_viewed usv
    on usp.product_id=usv.PRODUCT_ID_EVENTS
    left join stg_postgres_products P
    on p.product_id = coalesce(usp.product_id, usv.PRODUCT_ID_EVENTS)


PRODUCT__ID	PRODUCT_NAME	   UNIQUE_SESSIONS_PER_PRODUCT_PURCHASE	UNIQUE_SESSIONS_PER_PRODUCT_VIEWED	CONVERSION_RATE_BY_PRODUCT
4cda01b9-62e2-46c5-830f-b7f262a58fb1	Pothos	21	61	0.344262
689fb64e-a4a2-45c5-b9f2-480c2155624d	Bamboo	36	67	0.537313
55c6a062-5f4a-4a8b-a8e5-05ea5e6715a3	Philodendron	30	62	0.483871
be49171b-9f72-4fc9-bf7a-9a52e259836b	Monstera	25	49	0.510204
fb0e8be7-5ac4-4a76-a1fa-2cc4bf0b2d80	String of pearls	39	64	0.609375
b66a7143-c18a-43bb-b5dc-06bb5d1d3160	ZZ Plant	34	63	0.539683
e8b6528e-a830-4d03-a027-473b411c7f02	Snake Plant	29	73	0.39726
c7050c3b-a898-424d-8d98-ab0aaad7bef4	Orchid	34	75	0.453333
bb19d194-e1bd-4358-819e-cd1f1b401c0c	Birds Nest Fern	33	78	0.423077
b86ae24b-6f59-47e8-8adc-b17d88cbd367	Calathea Makoyana	27	53	0.509434
e5ee99b6-519f-4218-8b41-62f48f59f700	Peace Lily	27	66	0.409091
05df0866-1a66-41d8-9ed7-e2bbcddd6a3d	Bird of Paradise	27	60	0.45
e706ab70-b396-4d30-a6b2-a1ccf3625b52	Fiddle Leaf Fig	28	56	0.5
843b6553-dc6a-4fc4-bceb-02cd39af0168	Ficus	29	68	0.426471
5b50b820-1d0a-4231-9422-75e7f6b0cecf	Pilea Peperomioides	28	59	0.474576
58b575f2-2192-4a53-9d21-df9a0c14fc25	Angel Wings Begonia	24	61	0.393443
a88a23ef-679c-4743-b151-dc7722040d8c	Jade Plant	22	46	0.478261
74aeb414-e3dd-4e8a-beef-0fa45225214d	Arrow Head	35	63	0.555556
5ceddd13-cf00-481f-9285-8340ab95d06d	Majesty Palm	33	67	0.492537
64d39754-03e4-4fa0-b1ea-5f4293315f67	Spider Plant	28	59	0.474576
d3e228db-8ca5-42ad-bb0a-2148e876cc59	Money Tree	26	56	0.464286
c17e63f7-0d28-4a95-8248-b01ea354840e	Cactus	30	55	0.545455
35550082-a52d-4301-8f06-05b30f6f3616	Devil's Ivy	22	45	0.488889
6f3a3072-a24d-4d11-9cef-25b0b5f8a4af	Alocasia Polly	21	51	0.411765
80eda933-749d-4fc6-91d5-613d29eb126f	Pink Anthurium	31	74	0.418919
37e0062f-bd15-4c3e-b272-558a86d90598	Dragon Tree	29	62	0.467742
615695d3-8ffd-4850-bcf7-944cf6d3685b	Aloe Vera	32	65	0.492308
579f4cd0-1f45-49d2-af55-9ab2b72c3b35	Rubber Plant	28	54	0.518519
e18f33a6-b89a-4fbc-82ad-ccba5bb261cc	Ponytail Palm	28	70	0.4
e2e78dfc-f25c-4fec-a002-8e280d61a2f2	Boston Fern	26	63	0.412698


Which orders changed from week 2 to week 3? 

SELECT order_id
from orders_snapshot
where dbt_valid_to < '2023-01-28'

ORDER_ID:

265f9aae-561a-4232-a78a-7052466e46b7

e42ba9a9-986a-4f00-8dd2-5cf8462c74ea

b4eec587-6bca-4b2a-b3d3-ef2db72c4a4f