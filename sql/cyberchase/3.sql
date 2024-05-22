-- find the production code for the episode "Hackerized!:

select production_code
from episodes 
where title="Hackerized!";

-- that or this!
select season, episode_in_season, production_code
from episodes 
where title = "Hackerized!";