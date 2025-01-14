-- 1
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER';

-- 2
SELECT id,stadium,team1,team2
  FROM game
  WHERE id = 1012;

-- 3
SELECT player,teamid, stadium, mdate
  FROM game JOIN goal ON (game.id=goal.matchid)
  WHERE teamid = 'GER';

-- 4
SELECT team1, team2, player
  FROM game JOIN goal ON (game.id=goal.matchid)
  WHERE player LIKE 'Mario%';

-- 5
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on goal.teamid = eteam.id
 WHERE gtime<=10;

-- 6
SELECT mdate, teamname
FROM game JOIN eteam ON (game.team1 = eteam.id)
WHERE eteam.coach = 'Fernando Santos';

-- 7
SELECT player
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE stadium = 'National Stadium, Warsaw';

-- 8
SELECT UNIQUE(player)
  FROM game JOIN goal ON matchid = id 
    WHERE teamid != 'GER' AND (team1='GER' OR team2='GER');

-- 9
SELECT teamname, COUNT(*) as num_goals
  FROM eteam JOIN goal ON eteam.id = goal.teamid
  GROUP BY eteam.teamname;
  
-- 10
SELECT stadium, COUNT(*) as num_goals
 FROM game JOIN goal ON game.id = goal.matchid
 GROUP BY stadium;

-- 11
SELECT matchid, mdate, COUNT(*) as num_goals
 FROM game JOIN goal ON game.id  = goal.matchid
 WHERE (team1 = 'POL' OR team2 = 'POL') GROUP BY matchid;

-- 12
SELECT matchid, mdate, count(*) as num_goals
 FROM goal JOIN game ON goal.matchid = game.id
 WHERE teamid = 'GER'
 GROUP BY matchid;

-- 13
SELECT
 game.mdate,
 game.team1,
 SUM(CASE WHEN game.team1 = goal.teamid THEN 1 ELSE 0 END) AS score1,
 game.team2,
 SUM(CASE WHEN game.team2 = goal.teamid THEN 1 ELSE 0 END) AS score2
FROM
 game
 JOIN goal ON game.id = goal.matchid
GROUP BY
 game.id, game.mdate, game.team1, game.team2
ORDER BY
 game.mdate, game.id, game.team1, game.team2;


