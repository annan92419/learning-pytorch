/* 
You need to make a recommendation about which players the
team should consider hiring. With the team’s dwindling
budget, the general manager wants to know which players
were paid the lowest salaries in 2001. In 4.sql, write a
SQL query to find the 50 players paid the least in 2001.
*/

SELECT first_name, last_name, salary
FROM players 
JOIN salaries
ON players.id = salaries.player_id
WHERE year = 2001
ORDER BY salaries.salary ASC,
         players.first_name ASC,
         players.last_name ASC,
         players.id ASC
LIMIT 50;
