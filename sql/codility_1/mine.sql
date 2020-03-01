-- write your code in PostgreSQL 9.4
SELECT name
FROM (
 SELECT name, weight, turn, SUM(weight) OVER (ORDER BY turn ASC) AS sum_weight
 FROM line
) t
WHERE t.sum_weight <= 1000
ORDER BY turn DESC
LIMIT 1;