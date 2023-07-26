
SELECT t1.month, t1.country, trans_count, IFNULL(approved_count,0) AS approved_count, trans_total_amount, IFNULL(approved_total_amount,0) AS approved_total_amount
FROM (
  SELECT DATE_FORMAT( `trans_date`,'%Y-%m') AS month, country, count(state) AS trans_count, SUM(amount) AS trans_total_amount 
  FROM Transactions 
  GROUP BY month, country
) t1
LEFT JOIN (
  SELECT DATE_FORMAT( `trans_date`,'%Y-%m') AS month, country, COUNT(state) AS approved_count, SUM(amount) AS approved_total_amount 
  FROM Transactions
  WHERE state = 'approved'
  GROUP BY month, country
) t2
ON t1.country = t2.country AND t1.month = t2.month