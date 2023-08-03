
SELECT ROUND((COUNT(customer_id) / (SELECT COUNT(DISTINCT customer_id) FROM Delivery) * 100), 2)  AS immediate_percentage 
# SELECT *, COUNT(customer_id), (SELECT COUNT(DISTINCT customer_id) FROM Delivery) AS jumlah_semua
FROM (
  SELECT *, RANK() OVER(
    PARTITION BY customer_id 
    ORDER BY order_date ASC
  ) AS n_order
  FROM Delivery
) t
WHERE n_order = 1 AND order_date = customer_pref_delivery_date 

