# Write your MySQL query statement below
(SELECT product_id,  new_price AS price 
FROM (
  SELECT *, RANK() OVER(
    PARTITION BY product_id
    ORDER BY change_date DESC
  ) AS n_date
  FROM Products 
  WHERE change_date <= '2019-08-16' 
) t
WHERE n_date =1)
UNION (
  SELECT product_id, CASE 
    WHEN change_date > '2019-08-16' THEN 10
    ELSE new_price 
    END AS price
  FROM Products
  WHERE change_date > '2019-08-16' and product_id not in (
    SELECT product_id FROM Products WHERE change_date <= '2019-08-16' 
  )
)
ORDER BY product_id 
