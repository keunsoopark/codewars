SELECT f.title
FROM film AS f
JOIN (
  SELECT fa1.film_id
  FROM film_actor AS fa1
  JOIN (
    SELECT fa2.film_id
    FROM film_actor AS fa2
    WHERE fa2.actor_id = 105
  ) AS fa2
  ON fa1.film_id = fa2.film_id
  WHERE fa1.actor_id = 122
) AS fa
ON f.film_id = fa.film_id;
