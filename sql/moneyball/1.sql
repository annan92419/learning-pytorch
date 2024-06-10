/* 
You should start by getting a sense for how average player
salaries have changed over time. In 1.sql, write a SQL
query to find the average player salary by year.
*/

SELECT year, ROUND(AVG(salary), 2) AS "average salary"
FROM salaries
GROUP BY year
ORDER BY year DESC;