-- REPLACE group
SET hivevar:group=YourGroup;
SET hivevar:director='Quentin Tarantino';

USE ${group};

SELECT nconst
FROM imdb_name_basics
WHERE primaryname = ${director}

-- Which will return nm0000233

SELECT
  t.tconst AS tconst,
  t.primarytitle AS title,
  r.averagerating AS avg_rating, directors
FROM imdb_title_crew c
JOIN imdb_title_ratings r ON c.tconst = r.tconst
JOIN imdb_title_basics t ON c.tconst = t.tconst
where directors like '%nm0000233%'
ORDER BY r.averagerating DESC
LIMIT 5;

--------------------

SELECT b.primaryTitle, r.averageRating
FROM (
  SELECT tconst
  FROM esgf_2025_bd1.imdb_title_crew
  LATERAL VIEW explode(split(directors, ',')) d AS director_id
  WHERE director_id = 'nm0000233'
) c
JOIN esgf_2025_bd1.imdb_title_basics b ON c.tconst = b.tconst
JOIN esgf_2025_bd1.imdb_title_ratings r ON b.tconst = r.tconst
ORDER BY r.averageRating DESC
LIMIT 5;
