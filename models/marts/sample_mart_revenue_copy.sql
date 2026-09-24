select 
imdb_rating,
rotten_tomatoes_rating,
round((rotten_tomatoes_rating/imdb_rating),2) as rating_ratio
 from {{ ref('stg_movies')}}
