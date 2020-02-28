SELECT c.customer_id, c.email, 
  COUNT(p.rental_id) as payments_count, CAST(SUM(p.amount) AS FLOAT) as total_amount
FROM customer as c
JOIN payment as p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY total_amount DESC
LIMIT 10;
