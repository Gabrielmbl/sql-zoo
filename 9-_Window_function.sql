-- 1
SELECT lastName, party, votes
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY votes DESC;


-- 2
SELECT party, votes,
       RANK() OVER (ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency = 'S14000024 ' AND yr = 2017
ORDER BY party;

-- 3
SELECT yr,party, votes,
      RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency = 'S14000021'
GROUP BY party,yr
ORDER BY party,yr;

-- 4
SELECT constituency,party, votes,RANK() over (PARTITION BY constituency ORDER BY votes DESC) as rank
  FROM ge
 WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
   AND yr  = 2017
ORDER BY rank , constituency;

-- 5
SELECT constituency, party
FROM (
    SELECT constituency, party, RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) AS rank
    FROM ge
    WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
        AND yr = 2017
) AS ranked
WHERE rank = 1;

-- 6

SELECT party, COUNT(1)
FROM (
    SELECT constituency, party
    FROM (
        SELECT constituency, party, votes, RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) AS r
        FROM ge
        WHERE CONSTITUENCY LIKE 's%'
        AND yr = 2017
        ORDER BY r, constituency
    ) x
    WHERE x.r = 1
) y
GROUP BY party;

