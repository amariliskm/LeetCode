# Write your MySQL query statement below

SELECT product_id, year AS first_year, quantity, price
FROM (
    SELECT *, RANK() OVER(
        PARTITION BY product_id 
        ORDER BY year 
    ) AS n_year
    FROM Sales s) t
WHERE n_year = 1