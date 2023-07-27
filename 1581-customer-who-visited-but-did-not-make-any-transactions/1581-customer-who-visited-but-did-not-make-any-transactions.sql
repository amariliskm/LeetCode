SELECT customer_id, COUNT(customer_id) AS count_no_trans
FROM Visits t1
LEFT JOIN Transactions t2
ON t1.visit_id = t2.visit_id 
WHERE IFNULL(transaction_id ,0) = 0
GROUP BY customer_id
