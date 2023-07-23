# Write your MySQL query statement below
SELECT x,y,z,  CASE
    WHEN x+y+z-max > max THEN 'Yes'
    ELSE 'No'
    END AS triangle
FROM (
    SELECT *, CASE
    WHEN x>y AND x>z THEN x
    WHEN y>x AND y>z THEN y
    ELSE z
    END AS max
    FROM Triangle
) t
