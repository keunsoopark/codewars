SELECT ll.left_title, rr.right_title
FROM (
  SELECT * 
  FROM (
    SELECT (page_no / 2) AS side_no,
      CASE WHEN (page_no % 2) = 0 THEN title END AS left_title
    FROM recipes
  ) AS l
  WHERE l.left_title is not null
) AS ll
FULL OUTER JOIN (
  SELECT * 
  FROM (
    SELECT (page_no / 2) AS side_no,
      CASE WHEN (page_no % 2) = 1 THEN title END AS right_title
    FROM recipes
  ) AS r
  WHERE r.right_title is not null
) AS rr
ON ll.side_no = rr.side_no;