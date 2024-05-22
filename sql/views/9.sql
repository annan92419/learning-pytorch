-- write a SQL query to find the English title and artist of the print with the highest brightness.

select english_title, artist 
from views 
where brightness = (select max(brightness)
                    from views);
