with

all_releases as (
    select
        date_part('year', release_date) as release_year,
        major_genres,
        rotten_tomatoes_rating,
        imdb_rating,
        title

    from {{ ref('stg_movies') }}
)

select
    release_year,
    major_genres,
    avg(coalesce(rotten_tomatoes_rating, 0)) as avg_rotten_tomatoes_rating,
    avg(coalesce(imdb_rating)) as avg_imdb_rating,
    count(distinct title) as n_movies
from
    all_releases
where major_genres <> ''
    and release_year <= 2026
group by
    release_year,
    major_genres
order by major_genres, release_year asc