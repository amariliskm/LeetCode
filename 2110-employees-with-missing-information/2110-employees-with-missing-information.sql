(SELECT  t1.employee_id 
FROM Employees t1
LEFT JOIN Salaries t2 ON t1.employee_id = t2.employee_id
WHERE t2.employee_id IS NULL)

UNION 

(SELECT t1.employee_id 
FROM Salaries t1
LEFT JOIN Employees t2 ON t1.employee_id = t2.employee_id
WHERE t2.employee_id IS NULL)
ORDER BY employee_id 