/* 
Your general manager (i.e., the person who makes decisions
about player contracts) asks you whether the team should
trade a current player for Cal Ripken Jr., a star player
who’s likely nearing his retirement. In 2.sql, write a
SQL query to find Cal Ripken Jr.’s salary history.
*/

SELECT year, salary 
FROM salaries
WHERE player_id = (
    SELECT id 
    FROM players 
    WHERE first_name = 'Cal' AND last_name LIKE 'Ripken%'
)
ORDER BY year DESC;