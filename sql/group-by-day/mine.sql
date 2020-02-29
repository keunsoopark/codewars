select 
    date_trunc('day', created_at) as day, 
    count(*) filter (where name = 'trained'), 
    description
from events
group by day, description
order by day, description;
