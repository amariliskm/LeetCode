WITH cte AS (
  SELECT name,sales_id
    FROM SalesPerson
    WHERE sales_id NOT IN(
        # cari sales yang pernah layanin company 'RED'
        SELECT o.sales_id
        FROM Orders o
        LEFT JOIN Company c
        ON o.com_id = c.com_id
        WHERE c.name = 'RED')
)
SELECT name
FROM cte