/* 
You need a player that can get hits. Who might be the most
underrated? In 11.sql, write a SQL query to find the 10 least
expensive players per hit in 2001.
*/

SELECT first_name, last_name,
       salaries.salary / performances.H AS "dollars per hit"
FROM players
JOIN performances
ON players.id = performances.player_id
JOIN salaries
ON performances.player_id = salaries.player_id
WHERE performances.H > 0
      AND performances.year = 2001
      AND salaries.year = 2001
ORDER BY "dollars per hit" ASC,
         first_name ASC,
         last_name ASC
LIMIT 10;