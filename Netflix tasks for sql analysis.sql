1.'Average Imdb score by Type'

SELECT 
    type, ROUND(AVG(imdb_score), 1) AS Average_Score
FROM
    `netflix-419212.netflix_project.titles_cleaned`
GROUP BY type;

2.'Top 20 high rated movies(8.0+) on Netflix '
SELECT
  title,
  CASE
    WHEN score>= 8 THEN 'High rated'
    ELSE 'ok'
  END AS Rating,
  score,
  release_year
FROM
  `netflix-419212.netflix_project.best_movies`
ORDER BY score desc
LIMIT 20;


3.'Top 10 Movies and Shows'
SELECT
  title AS Top_10,
  imdb_score
FROM
  `netflix-419212.netflix_project.titles_cleaned`
WHERE 
  imdb_votes>100000
ORDER BY 2 DESC
LIMIT 20;


4.'Analysis of Actor Participations in Highly Voted Movies '
SELECT 
    name AS Actor, COUNT(title) AS Participations
FROM
    `netflix-419212.netflix_project.titles_cleaned` AS t
        JOIN
    `netflix-419212.netflix_project.credits_netflix` AS c ON t.id = c.id
WHERE
    imdb_votes > 100000 AND type = 'MOVIE'
        AND role = 'ACTOR'
GROUP BY 1
ORDER BY 2 DESC;


5.'Analysis of Movie Cast Sizes and IMDb Scores'
SELECT 
    t.title, COUNT(c.name) AS Total_Actors, t.imdb_score
FROM
    `netflix-419212.netflix_project.titles_cleaned` t
        JOIN
    `netflix-419212.netflix_project.credits_netflix` c ON t.id = c.id
WHERE
    t.imdb_votes > 100000 AND type = 'MOVIE'
GROUP BY t.title , t.imdb_score
ORDER BY 3  DESC
LIMIT 50;


6.'Analysis of Title Distribution by Genre and Type (Movies vs. Shows)'
SELECT
  main_genre,
  COUNTIF(type = 'MOVIE') AS Movie_titles,
  COUNTIF(type = 'SHOW') AS Show_titles,
  COUNT(*) AS Total_titles
FROM
  netflix-419212.netflix_project.titles_cleaned
GROUP BY main_genre
ORDER BY 4 DESC;


7.'Comparison of Total Votes for Movies and Shows by Production Country'
SELECT
  bm.production_country,
  SUM(bm.number_of_votes) AS Total_Movie_Votes,
  SUM(bs.number_of_votes) AS Total_Show_Votes
FROM
  `coursera-389608.netflix_project.best_movies` bm
     JOIN
  `coursera-389608.netflix_project.best_shows` bs ON bm.production_country = bs.production_country
GROUP BY
  bm.production_country
ORDER BY
 2 DESC;

8.'Comparison of Total Votes and Ratings for Movies and Shows by Production Country'
SELECT
  bm.production_country,
  SUM(bm.number_of_votes) AS Total_Movie_Votes,
  SUM(bs.number_of_votes) AS Total_Show_Votes,
  round(AVG(bm.score),1) AS Avg_Movies_Rating,
  round(AVG(bs.score),1) AS Avg_Shows_Rating
FROM
  `coursera-389608.netflix_project.best_movies` bm
     JOIN
  `coursera-389608.netflix_project.best_shows` bs ON bm.production_country = bs.production_country
GROUP BY
  bm.production_country
ORDER BY
 2 DESC;



