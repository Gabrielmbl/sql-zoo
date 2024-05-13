-- 1
SELECT id, title
 FROM movie
 WHERE yr=1962;

-- 2
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

-- 3
SELECT id, title, yr
FROM movie
WHERE title LIKE ('%Star Trek%')
ORDER BY yr ASC;

-- 4
SELECT id
FROM actor
WHERE name LIKE ('Glenn Close');

-- 5
SELECT id
FROM movie
WHERE title LIKE 'Casablanca';

-- 6
SELECT actor.name
FROM actor 
JOIN casting ON actor.id = casting.actorid 
JOIN movie ON casting.movieID = movie.id
WHERE casting.movieid = (SELECT id FROM movie WHERE title = 'Casablanca');

-- 7
SELECT actor.name
FROM actor 
JOIN casting ON actor.id = casting.actorid 
JOIN movie ON casting.movieID = movie.id
WHERE casting.movieid = (SELECT id FROM movie WHERE title = 'Alien');

-- 8
SELECT movie.title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE actor.name like 'Harrison Ford';

-- 9
SELECT movie.title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE actor.name like 'Harrison Ford' AND casting.ord != 1;

-- 10
SELECT movie.title, actor.name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE movie.yr = 1962 AND casting.ord = 1;

-- 11
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

-- 12
SELECT movie.title, actor.name 
FROM casting 
JOIN movie ON casting.movieid = movie.id
JOIN actor ON casting.actorid = actor.id
WHERE casting.ord = 1
AND movie.id IN (
    SELECT movieid
    FROM casting
    WHERE actorid = (SELECT id FROM actor WHERE name = 'Julie Andrews')
);

-- 13
SELECT actor.name
FROM casting
JOIN actor ON casting.actorid = actor.id
WHERE casting.ord = 1
GROUP BY actor.id
HAVING COUNT(*) >= 15
ORDER BY actor.name;

-- 14
SELECT movie.title, COUNT(casting.actorid) AS num_actors
FROM movie
JOIN casting ON movie.id = casting.movieid
WHERE movie.yr = 1978
GROUP BY movie.id
ORDER BY num_actors DESC, movie.title;


-- 15
SELECT DISTINCT actor.name
FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON casting.movieid = movie.id
WHERE movie.id IN (
    SELECT DISTINCT movie.id
    FROM movie
    JOIN casting ON movie.id = casting.movieid
    JOIN actor ON casting.actorid = actor.id
    WHERE actor.name = 'Art Garfunkel'
);


