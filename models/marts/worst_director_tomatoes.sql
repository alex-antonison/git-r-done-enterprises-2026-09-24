with films_per_director as (
    select
        director
        , COUNT(movie_id) as movie_no
    from {{ ref('stg_movies') }}
    group by 1
    having movie_no >= 10
)

select
    f.director
    , AVG(rotten_tomatoes_rating) as avg_tomato_rating
from {{ ref('stg_movies') }}
join films_per_director f on f.director = stg_movies.director
group by 1
qualify RANK() OVER (ORDER BY f.director ASC) < 11
order by avg_tomato_rating asc