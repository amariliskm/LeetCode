# Write your MySQL query statement below
SELECT t1.name
FROM Employee t1
JOIN Employee t2
ON t1.id = t2.managerId
GROUP BY t2.managerId
HAVING COUNT(*)>=5
