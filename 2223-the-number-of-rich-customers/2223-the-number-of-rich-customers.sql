# Write your MySQL query statement below
SELECT COUNT(*) AS rich_count 
FROM (
  SELECT customer_id 
  FROM Store 
  WHERE amount > 500
  GROUP BY customer_id 
) t
