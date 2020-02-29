SELECT 
  MIN(score), 
  percentile_cont(0.5) within group (order by score) AS median,
  MAX(score)
FROM result;