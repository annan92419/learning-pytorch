/* 
The general manager has asked you for a report which details
each player’s name, their salary for each year they’ve been
playing, and their number of home runs for each year they’ve
been playing. To be precise, the table should include:

    - All player’s first names
    - All player’s last names
    - All player’s salaries
    - All player’s home runs
    - The year in which the player was paid that salary and
      hit those home runs
In 10.sql, write a query to return just such a table.
*/

SELECT players.first_name,
       players.last_name,
       salaries.salary,
       performances.HR,
       performances.year
FROM players
JOIN performances
ON players.id = performances.player_id
JOIN salaries
ON players.id = salaries.player_id
WHERE salaries.year = performances.year
ORDER BY performances.player_id ASC,
         performances.year DESC,
         performances.HR DESC,
         salaries.salary DESC; 
