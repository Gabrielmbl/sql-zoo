-- 1
SELECT population FROM world
  WHERE name = 'Germany'

-- 2
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

-- SELECT Quiz

-- 1
SELECT name, population
  FROM world
 WHERE population BETWEEN 1000000 AND 1250000

-- 2
-- E

-- 3
-- E

-- 4
-- C

-- 5
-- C

-- 6
-- C

-- 7
-- C