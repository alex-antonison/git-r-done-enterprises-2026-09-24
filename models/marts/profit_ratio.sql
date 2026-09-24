select
    title,
    production_budget,
    worldwide_gross,
    worldwide_gross/production_budget as profit_ratio,
    rank() over (order by profit_ratio desc)
from {{ ref('stg_movies')}}