-- write a query that counts the number of episodes released in the last 6 years, from 2018 to 2023;

select episode_in_season, title
from episodes 
where air_date between "2018-01-01" and "2023-12-31";


select count(episode_in_season) as episodes_last_6yrs
from episodes 
where air_date between "2018-01-01" and "2023-12-31";