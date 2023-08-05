
SELECT customer_id
FROM (
    SELECT customer_id, COUNT(DISTINCT product_key) AS n_product_key, (SELECT COUNT(DISTINCT product_key) FROM Product) AS all_cnt
    FROM Customer c
    GROUP BY customer_id 
    HAVING n_product_key = all_cnt
    ) t