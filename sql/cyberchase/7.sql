-- write an sql query to list the titles and topics of all episodes teaching fractions;

select title, topic
from episodes 
where topic like "%fractions%";