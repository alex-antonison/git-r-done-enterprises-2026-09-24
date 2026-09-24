WITH drama_films AS (
        SELECT 
        title,
        SUM(worldwide_gross) as total_gross,
        major_genres,
        release_date
    FROM {{ ref('stg_movies') }}
    WHERE major_genres LIKE 'Drama'
    GROUP BY 1,3,4
    ORDER BY total_gross desc
)
, ranks AS (
SELECT 
    title,
    total_gross,
    major_genres,
    release_date,
    RANK() OVER(ORDER BY total_gross desc) as ranks
FROM drama_films
WHERE release_date >= '2000-01-01'
ORDER BY total_gross desc 
)

SELECT 
    *
FROM ranks 
WHERE ranks <= 100