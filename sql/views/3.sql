-- write a SQL query to count how many prints by Hokusai include “Fuji” in the English title. Though all of Hokusai’s prints focused on Mt. Fuji, in how many did “Fuji” make it into the title?

select count(english_title) as num_fuji_appeared
from views 
where (artist = "Hokusai") and (english_title like "%fuji%");