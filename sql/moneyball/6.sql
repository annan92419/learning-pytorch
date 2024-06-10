/* 
Which teams might be the biggest competition for the A’s this
year? In 6.sql, write a SQL query to return the top 5 teams,
sorted by the total number of hits by players in 2001.
*/

SELECT teams.name, SUM(performances.H) AS "total hits"
FROM teams 
JOIN performances
ON teams.id = performances.team_id
JOIN players
ON performances.player_id = players.id
WHERE performances.year = 2001
GROUP BY teams.name
ORDER BY "total hits" DESC
LIMIT 5;