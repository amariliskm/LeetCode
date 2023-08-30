CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN

DECLARE M INT;
SET M=N-1;
  RETURN (
      # Write your MySQL query statement below.
      SELECT salary AS getNthHighestSalary
      FROM Employee
      GROUP BY salary
      ORDER BY salary DESC
      LIMIT M,1   
  );
END