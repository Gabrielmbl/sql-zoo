-- 1
SELECT name, continent, population FROM world

-- 2
SELECT name FROM world
WHERE population >= 200000000

-- 3
SELECT name, (gdp/population) AS per_capita_gdp
FROM world
WHERE population >= 200000000

-- 4
SELECT name, (population/1000000) as population_in_millions
FROM world
WHERE continent = 'South America';

-- 5
SELECT name, population 
FROM world
WHERE name IN ('France', 'Germany', 'Italy');

-- 6
SELECT name
FROM world
WHERE name like ('%United%');

-- 7
SELECT name, population, area
FROM world
WHERE area > 3000000 or population > 250000000;

-- 8
SELECT name, population, area
FROM world
WHERE (area > 3000000 OR population > 250000000)
      AND NOT (area > 3000000 AND population > 250000000);

-- 9
SELECT name, ROUND(population/1000000, 2) as population_in_millions, ROUND(gdp/1000000000, 2) as gdp_in_billions
FROM world
WHERE continent = 'South America';

-- 10
 SELECT name, ROUND(gdp/population,-3) as per_capita_gdp
FROM world
WHERE gdp >= 1000000000000;

-- 11
SELECT name, capital
FROM world
WHERE LENGTH(name) == LENGTH(capital);

-- 12
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) AND name != capital;

-- 13
SELECT name
FROM world
WHERE name NOT LIKE '% %'
AND name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%';