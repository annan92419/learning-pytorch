-- write a SQL query to list the average colors of prints by Hokusai that include “river” in the English title.

select average_color
from views
where (artist = "Hokusai") and (english_title like "%river%");