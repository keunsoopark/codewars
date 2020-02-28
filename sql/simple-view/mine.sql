CREATE VIEW members_approved_for_voucher AS
  SELECT m.id AS id, m.name AS name, m.email AS email, SUM(p.price) AS total_spending
  FROM sales AS s
  JOIN members AS m
  ON s.member_id = m.id
  JOIN products as p
  ON s.product_id = p.id
  JOIN (
    SELECT d.id, SUM(p.price)
    FROM sales AS s
    JOIN departments AS d
    ON d.id = s.department_id
    JOIN products AS p
    ON p.id = s.product_id
    GROUP BY d.id
    HAVING SUM(p.price) > 10000
  ) AS dd
  ON s.department_id = dd.id
  GROUP BY m.id
  HAVING SUM(p.price) > 1000;

SELECT * FROM members_approved_for_voucher ORDER BY id;