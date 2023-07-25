# Write your MySQL query statement below
SELECT MAX(num) AS num
FROM
(SELECT num,COUNT(num) AS cnt
FROM MyNumbers
GROUP BY num
ORDER BY num DESC
) t
WHERE cnt=1
