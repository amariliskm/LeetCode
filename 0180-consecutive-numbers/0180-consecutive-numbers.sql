# Write your MySQL query statement below
SELECT DISTINCT t1.num AS ConsecutiveNums 
FROM Logs t1
JOIN Logs t2
  ON t1.id = t2.id+1 AND t1.num = t2.num
JOIN Logs t3
  ON t2.id = t3.id+1 AND t1.num = t3.num
