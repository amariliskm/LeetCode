# Write your MySQL query statement below
SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary
FROM (
    SELECT name, departmentId,salary, DENSE_RANK() OVER(
        PARTITION BY departmentId 
        ORDER BY salary DESC
    ) AS 'rank'
    FROM Employee
) e
LEFT JOIN Department d
    ON e.departmentId = d.id
WHERE e.rank = 1;
