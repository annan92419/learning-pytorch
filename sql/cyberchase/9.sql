-- write a query that counts the number of episodes released in cyberchase's first 6 years, from 2022 to 2007, inclusive;

select episode_in_season, title 
from episodes 
where air_date between "2002-01-01" and "2007-12-31";

select count(episode_in_season) as episodes_first_6yrs
from episodes 
where air_date between "2002-01-01" and "2007-12-31";