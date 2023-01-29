#creating a base model using Codegen package 
{{ 
    codegen.generate_base_model(
    source_name='postgres',
    table_name='addresses',
    materialized = 'table'
) }}
