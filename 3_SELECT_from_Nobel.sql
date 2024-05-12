-- 1
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950;

-- 2
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'literature';

-- 3
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

-- 4
SELECT winner
  FROM nobel
WHERE yr >= 2000 
  AND subject = 'peace';

-- 5
SELECT yr, subject, winner
  FROM nobel
WHERE subject = 'Literature'
  AND yr >= 1980 and yr <= 1989;

-- 6
SELECT * FROM nobel
WHERE winner IN ('Theodore Roosevelt', 'Thomas Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

-- 7
SELECT winner
FROM nobel 
WHERE winner LIKE 'John %';

-- 8
SELECT yr, subject, winner
  FROM nobel
WHERE (yr = 1980 AND subject = 'physics')
  OR (yr = 1984 AND subject = 'chemistry');

-- 9
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1980 AND subject not in ('Chemistry', 'Medicine');

-- 10
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910)
  OR (subject = 'Literature' AND yr >= 2004);

-- 11
SELECT *
FROM nobel
WHERE winner = 'PETER GRUNBERG';

-- 12
SELECT *
FROM nobel
WHERE winner = 'EUGENE ONEILL';

-- 13
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner ASC;

-- 14
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY 
 CASE WHEN subject IN ('physics','chemistry') THEN 1 ELSE 0 END,
  subject, winner;


