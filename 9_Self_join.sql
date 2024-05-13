-- 1
SELECT COUNT(*) as num_stops 
FROM stops;

-- 2
SELECT id 
FROM stops 
WHERE name = 'Craiglockhart';

-- 3
SELECT id, name
FROM stops
JOIN route
ON stops.id = route.stop
WHERE num = '4' AND company = 'LRT';

-- 4
SELECT company, num, COUNT(*)
FROM route
WHERE stop = 149 OR stop = 53
GROUP BY num
HAVING COUNT(*) = 2;

-- 5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = (SELECT id FROM stops WHERE name = 'London Road');

-- 6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road';

-- 7
SELECT DISTINCT a.company, a.num
FROM route a
JOIN route b
ON a.company = b.company AND a.num = b.num
WHERE a.stop = 115 AND b.stop = 137;

-- 8
SELECT DISTINCT a.company, a.num
FROM route a
JOIN route b
ON a.company = b.company AND a.num = b.num
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
WHERE stopa.name = 'Craiglockhart'
  AND stopb.name = 'Tollcross';

-- 9
SELECT DISTINCT stopb.name, a.company, a.num
FROM route a 
JOIN route b 
ON a.company = b.company AND a.num = b.num
JOIN stops stopa ON a.stop = stopa.id
JOIN stops stopb ON b.stop = stopb.id
WHERE stopa.name = 'Craiglockhart';

-- 10
SELECT r1.num, r1.company,
       s1.name,
       r2.num, r2.company
FROM route r1
JOIN route r2 ON r1.num != r2.num 
JOIN stops s1 ON r1.stop = s1.id 
JOIN stops s2 ON r2.stop = s2.id 
WHERE s1.name = 'Craiglockhart' AND s2.name = 'Lochend'
ORDER BY r1.num, r2.num;
