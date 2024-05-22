-- count the number of unique episode titles;

select count(distinct(title)) as num_unique_title
from episodes;