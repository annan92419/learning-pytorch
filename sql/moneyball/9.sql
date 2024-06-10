/* 
What salaries are other teams paying? In 9.sql, write a SQL
query to find the 5 lowest paying teams (by average salary)
in 2001.
*/

SELECT teams.name, ROUND(AVG(salaries.salary), 2) AS "average salary"
FROM teams 
JOIN salaries
ON teams.id = salaries.team_id
WHERE salaries.year = 2001
GROUP BY teams.name
ORDER BY "average salary" ASC
LIMIT 5;