# Write your MySQL query statement below
SELECT user_id, max(time_stamp) AS last_stamp          
FROM Logins 
WHERE year(time_stamp) = '2020'
GROUP BY user_id
# ORDER BY last_stamp DESC