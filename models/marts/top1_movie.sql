with

movie_ratings as (
    select
        title,
        rotten_tomatoes_rating,
        imdb_rating
    from {{ ref('stg_movies') }}
)

select
    title,
    rotten_tomatoes_rating,
    imdb_rating,
from movie_ratings
where rotten_tomatoes_rating = 100
order by rotten_tomatoes_rating desc, imdb_rating desc

