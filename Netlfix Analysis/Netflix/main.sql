-- Netflix Project

DROP TABLE IF EXISTS netflix;

CREATE TABLE netflix
(
	show_id VARCHAR(6), 
	type 	VARCHAR(10), 
	title 	VARCHAR(150), 
	director 	VARCHAR(208), 
	casts	VARCHAR(1000), 
	country	VARCHAR(150), 
	date_added	VARCHAR(50), 
	release_year	INT, 
	rating	VARCHAR(10), 
	duration	VARCHAR(15), 
	listed_in	VARCHAR(100), 
	description	VARCHAR(250)
);


SELECT * FROM netflix;

-- Check there are 8807 records.
SELECT
	COUNT(*) as total_content
FROM netflix;

-- See what types of content there is.
SELECT
	DISTINCT type
FROM netflix;





-- 15 Business Problems


-- 1. Count the Number of Movies vs TV Shows

SELECT 
	type, 
	COUNT(*) as total_content
FROM netflix
GROUP BY type;


-- 2. Find the Most Common Rating for Movies and TV Shows

SELECT type, rating
FROM
(
	SELECT 
	   type, 
	   rating, 
	   COUNT(*), 
	   RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC) as ranking
	FROM netflix
	GROUP BY 1, 2
)
WHERE ranking = 1;


-- 3. List All Movies Released in a Specific Year (e.g., 2020)

SELECT *
FROM netflix
WHERE 
release_year = 2020 
AND 
type = 'Movie';


-- 4. Find the Top 5 Countries with the Most Content on Netflix.

SELECT
	UNNEST(STRING_TO_ARRAY(country, ',')) as new_country,
	COUNT(show_id) as total_content
FROM netflix
GROUP BY new_country
ORDER BY total_content DESC
LIMIT 5;


-- 5. Identify the Longest Movie.

SELECT title, duration
FROM netflix
WHERE 
	type = 'Movie' 
	AND 
	duration IS NOT NULL
ORDER BY CAST(split_part(duration, ' ', 1) AS INTEGER) DESC
LIMIT 1;


-- 6. Find Content Added in the Last 5 Years

SELECT 
	*
FROM netflix
WHERE
	TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years';
	-- TO_DATE is a PostgreSQL specific function.


-- 7. Find All Movies/TV Shows by Director 'Rajiv Chilaka'

SELECT *
FROM netflix
WHERE director LIKE '%Rajiv Chilaka%'


-- 8. List All TV Shows with More Than 5 Seasons

SELECT *
FROM netflix
WHERE 
	type = 'TV Show'
	AND
	CAST(split_part(duration, ' ', 1) AS INTEGER) > 5;


-- 9. Count the Number of Content Items in Each Genre

SELECT 
	UNNEST(STRING_TO_ARRAY(listed_in, ',')) as new_genre,
	COUNT(show_id) as total_content
FROM netflix
GROUP BY new_genre
ORDER BY total_content DESC;


-- 10.Find each year and the average numbers of content release in India on netflix.
-- Return top 5 year with highest avg content release.

SELECT
	EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYY')) as added_year, 
	UNNEST(STRING_TO_ARRAY(country, ',')) as new_country, 
	COUNT(show_id) as total_content
FROM netflix
WHERE new_country = 'India'
GROUP BY added_year;
















