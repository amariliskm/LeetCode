# Write your MySQL query statement below
SELECT user_id AS buyer_id, join_date, IFNULL(COUNT(buyer_id),0) AS orders_in_2019 
FROM Users u
LEFT JOIN Orders o
    ON  u.user_id = o.buyer_id AND YEAR(o.order_date) = 2019 #If you use 'where' then those who doesn't have 2019 sale won't be joined at all
GROUP BY user_id 
