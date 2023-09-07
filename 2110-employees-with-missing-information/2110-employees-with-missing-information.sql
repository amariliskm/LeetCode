WITH hsl_join AS (
    SELECT t1.employee_id AS both_id
    FROM Employees t1
    JOIN Salaries t2
    ON  t1.employee_id = t2.employee_id
)

(SELECT  employee_id 
FROM Employees t1
LEFT JOIN hsl_join t2 ON t1.employee_id = t2.both_id
WHERE both_id IS NULL)

UNION 

(SELECT employee_id 
FROM Salaries t1
LEFT JOIN hsl_join t2 ON t1.employee_id = t2.both_id
WHERE both_id IS NULL)
ORDER BY employee_id 