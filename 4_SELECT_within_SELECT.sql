-- 1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

-- 2
SELECT name FROM world
 WHERE (gdp/population) > (SELECT (gdp/population) FROM world WHERE name = 'United Kingdom') AND continent = 'Europe';

--  3
SELECT name, continent FROM world
 WHERE continent IN (SELECT continent FROM world WHERE name = 'Argentina' OR name = 'Australia');

-- 4
SELECT name, population FROM world
 WHERE population > (SELECT population FROM world WHERE name = 'United Kingdom') and 
 population < (SELECT population FROM world WHERE name = 'Germany');

-- 5
SELECT name, CONCAT((ROUND((population/(SELECT population FROM world WHERE name = 'Germany'))*100)), '%') AS percentage FROM world 
WHERE continent = 'Europe';

-- 6
SELECT name
 FROM world
 WHERE gdp > ALL (SELECT gdp FROM world WHERE continent = 'Europe');

-- 7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND population>0);

-- 8
SELECT continent, MIN(name) as name
FROM world
GROUP BY continent;

-- 9
SELECT name, continent, population
FROM world
WHERE continent IN (
    SELECT continent
    FROM world
    GROUP BY continent
    HAVING MAX(population) <= 25000000
);

-- 10
SELECT
    name,
    continent
FROM
    world w1
WHERE
    population > 3 * (
        SELECT
            SUM(population)
        FROM
            world w2
        WHERE
            w2.continent = w1.continent
            AND w2.name != w1.name
    );

