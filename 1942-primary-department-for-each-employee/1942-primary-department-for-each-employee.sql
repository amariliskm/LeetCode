
SELECT employee_id, department_id  
FROM(
    SELECT *, ROW_NUMBER() OVER(
      PARTITION BY employee_id 
      ORDER BY primary_flag ASC
    ) AS rank_flag
    FROM Employee
  ) t
WHERE rank_flag = 1 and employee_id not in (
  SELECT employee_id
  FROM (
    SELECT *, CASE
      WHEN count(employee_id) =2 THEN "Y"
      WHEN count(employee_id) = 1 and cnt_flg = 2 THEN "X"
      WHEN count(employee_id) = 1 and cnt_flg = 1 THEN "N"
    END AS which_dep 
    FROM(
      SELECT *, COUNT(primary_flag) AS cnt_flg
      FROM Employee
      GROUP BY employee_id, primary_flag)t
    GROUP BY employee_id
    HAVING which_dep ="X"
  ) t2
)


    
    