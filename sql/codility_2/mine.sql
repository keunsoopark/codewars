-- write your code in PostgreSQL 9.4
select p.id as id, p.title as title, COALESCE(SUM(r.number_of_tickets), 0) as reserved_tickets
from plays p
left join reservations as r on r.play_id = p.id
group by p.id, p.title
order by reserved_tickets desc, id;