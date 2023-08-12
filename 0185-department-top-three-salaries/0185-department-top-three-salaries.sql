# Write your MySQL query statement below
SELECT  Department, Employee, Salary
FROM (
    SELECT t2.name AS Department, t1.name AS Employee, salary AS Salary, DENSE_RANK() OVER(
        PARTITION BY t2.name
        ORDER BY Salary DESC
    ) AS rn
    FROM Employee t1
    LEFT JOIN Department t2 ON t1.departmentId = t2.id
    ) t
WHERE rn < 4