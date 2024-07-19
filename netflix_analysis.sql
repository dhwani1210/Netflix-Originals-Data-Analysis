--Task 2: Counting Cinematic Uniqueness: Distinct Titles in the Netflix Collection.
SELECT COUNT(DISTINCT title) AS distinct_titles
FROM netflix_originals;

-- Task 3: Netflix Gems with IMDb Scores Above 7.
SELECT title, imdb_score FROM netflix_originals where imdb_score > 7;

-- Task 4: Counting Netflix Movies by Language.
SELECT language, count(*) from netflix_originals group by language;

-- Task 5: Unveiling the Average IMDb Scores in Netflix Originals.
SELECT genre, round(AVG(imdb_score),1) as "Average imdb" FROM netflix_originals GROUP BY genre;

-- Task 6: Netflix Genres with the Highest Average IMDb Scores.
SELECT genre, round(AVG(imdb_score),1) as avg_score
FROM netflix_originals
GROUP BY genre
ORDER BY avg_score DESC
LIMIT 5;

-- Task 7: Netflix Movies Surpassing Genre IMDb Score Averages.
Select n.title, n.genre, n.imdb_score, round(avg_genre.avg_imdb, 1) as "Average imdb" 
from netflix_originals n
Join (
	select avg(imdb_score) as avg_imdb, genre
	from netflix_originals 
	group by genre
) avg_genre
ON n.genre = avg_genre.genre
where n.imdb_score > avg_genre.avg_imdb
order by genre;



-- Task 8: Counting Netflix Movies by Genre Before 2020.
select genre, count(*), year
from netflix_originals
where year < 2020
group by genre, year
order by year;


-- Task 9: The Highest Rated Netflix Movie.
select title as "Highest Rated Movie", round(imdb_score,1) as imdb_score
from netflix_originals
where imdb_score = (select max(imdb_score) from netflix_originals);

-- Task 10: Netflix Movies with Similar Premieres.
select n1.title, n1.genre, n2.title, n2.genre, n1.premiere
FROM netflix_originals n1
JOIN netflix_originals n2
ON n1.genre = n2.genre
where n1.premiere = n2.premiere and n1.title < n2.title
order by n1.premiere;

-- Task 11: Genre Dominance Through the Years: Unveiling Top-Ranked Genres.

-- SELECT genre, avg(imdb_score) as imdb_score, year, dense_RANK() OVER (partition by year ORDER BY avg(imdb_score) DESC) rank
-- FROM netflix_originals
-- group by genre, year
-- order by year, imdb_score DESC, genre;

SELECT genre, round(imdb_score, 1) as imdb_score, year
FROM (
    SELECT genre, avg(imdb_score) as imdb_score, year, 
           DENSE_RANK() OVER (partition by year ORDER BY avg(imdb_score) DESC) as rank
    FROM netflix_originals
    GROUP BY genre, year
) RankedGenres
WHERE rank = 1
ORDER BY year, imdb_score DESC, genre;


-- Task 12: Cinematic Excellence in Extended Narratives: Genre and Language Dynamics.

SELECT n.genre, n.language, round(AVG(n.imdb_score), 1) AS average_imdb_score, AVG(n.runtime) AS avg_runtime_by_language
FROM netflix_originals n
JOIN (
    SELECT genre, AVG(runtime) AS avgRuntime
    FROM netflix_originals
    GROUP BY genre
) avg
ON n.genre = avg.genre
WHERE n.runtime > avg.avgRuntime
GROUP BY n.genre, n.language, avg.avgRuntime
ORDER BY n.genre;
