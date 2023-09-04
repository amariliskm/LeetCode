# Write your MySQL query statement below
WITH cte AS (
  SELECT id, visit_date, people, ROW_NUMBER() OVER(ORDER BY id) AS rn
  FROM Stadium 
  WHERE people >= 100
)

SELECT id, visit_date, people
FROM cte
WHERE id- rn IN (
  SELECT id-rn AS grup
  FROM cte
  GROUP BY grup
  having COUNT(grup) >= 3
  
)
