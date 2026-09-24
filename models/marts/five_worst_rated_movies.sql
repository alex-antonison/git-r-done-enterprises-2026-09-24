select RANK() OVER(order by rotten_tomatoes_rating) as rank
    , title
    , release_date
    , rotten_tomatoes_rating
    from {{ ref('stg_movies') }}
qualify rank <=5
order by rotten_tomatoes_rating asc

