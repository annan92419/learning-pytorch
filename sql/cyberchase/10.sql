-- write an sql query to list the ids, titles, and production codes of all episodes. order the results by production code, from earliest to latest;

select id, title, production_code
from episodes 
order by production_code asc;