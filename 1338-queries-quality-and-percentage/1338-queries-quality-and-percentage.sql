# Write your MySQL query statement below
SELECT query_name, ROUND(AVG(quality),2) AS quality, ROUND(AVG(poor_query)*100,2) AS poor_query_percentage 
FROM(
    SELECT query_name, rating/position AS quality, CASE
        WHEN rating < 3 THEN 1
        ELSE 0
        END AS poor_query
    FROM Queries
) t
GROUP BY query_name 