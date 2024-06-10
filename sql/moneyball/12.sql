/* 
Hits are great, but so are RBIs! In 12.sql, write a SQL query
to find the players among the 10 least expensive players per
hit and among the 10 least expensive players per RBI in 2001.
-- */

SELECT last_name, first_name
FROM players
WHERE id IN (       
    SELECT performances.player_id       -- least expensive players per hit 
    FROM performances
    JOIN salaries
    ON performances.player_id = salaries.player_id
    WHERE performances.year = 2001 AND salaries.year = 2001 AND performances.H > 0
    ORDER BY salaries.salary / performances.H ASC 
    LIMIT 10
)
INTERSECT
SELECT last_name, first_name
FROM players 
WHERE id IN (
    SELECT performances.player_id       -- least expensive players per rbi
    FROM performances
    JOIN salaries
    ON performances.player_id = salaries.player_id
    WHERE performances.year = 2001 AND salaries.year = 2001 AND performances.RBI > 0
    ORDER BY salaries.salary / performances.RBI ASC 
    LIMIT 10
);




