-- write a SQL query to find the side (e.g., right or left) Babe Ruth hit.

select throws
from players 
where (first_name = "Babe") and  
      (last_name = "Ruth");