SELECT id_sign AS user_id , ROUND(SUM(cnt)/COUNT(id_sign),2) AS confirmation_rate
FROM (
  SELECT s.user_id AS id_sign, c.user_id AS id_confirm, c.action, CASE
    WHEN action = 'timeout' THEN 0
    WHEN action = 'confirmed' THEN 1
    ELSE 0
    END AS cnt
  FROM Signups s
  LEFT JOIN Confirmations c
  ON s.user_id = c.user_id
) t
GROUP BY user_id 

#timeout = 0
#confirm = 1
#null = 0
#cari count tiap id buat n

# confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. 
# The confirmation rate of a user that did not request any confirmation messages is 0. Round the confirmation rate to two decimal places.