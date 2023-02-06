{% macro event_types(column_name) %}
    
    CASE 
       WHEN {{column_name}} in ('checkout', 'package_shipped') then 'purchased'
       else 'pre-purchase'
    end as event_type_group
    
{% endmacro %}

