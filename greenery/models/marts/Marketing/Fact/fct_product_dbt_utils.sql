select
{{ dbt_utils.star(from=ref('stg_postgres_products'), except=["inventory"]) }}
from {{ ref('stg_postgres_products') }}
