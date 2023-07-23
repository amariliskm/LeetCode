# Write your MySQL query statement below
SELECT t.name
FROM (
    SELECT name,sales_id
    FROM SalesPerson
    HAVING sales_id NOT IN(
#         # cari sales yang pernah layanin company 'RED'
        SELECT o.sales_id
        FROM Orders o
        LEFT JOIN Company c
        ON o.com_id = c.com_id
        WHERE c.name = 'RED'
    )
) t;