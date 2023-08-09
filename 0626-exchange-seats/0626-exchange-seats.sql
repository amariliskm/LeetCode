
SELECT s2.id, s1.student
FROM(
  SELECT id, student, CASE 
    WHEN id % 2 = 1 and id != cnt THEN id+1
    WHEN id % 2 = 1 and id = cnt THEN id
    WHEN id % 2 = 0 THEN id-1
    END AS swap_id
  FROM Seat 
  CROSS JOIN (
    SELECT COUNT(id) AS cnt
    FROM Seat
  ) t
) s1
JOIN Seat s2 ON s1.swap_id = s2.id
