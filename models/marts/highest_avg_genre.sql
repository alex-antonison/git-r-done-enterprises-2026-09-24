 select
    major_genres,
    avg(imdb_rating)
from {{ ref('stg_movies') }}
group by major_genres
order by avg(imdb_rating) desc


