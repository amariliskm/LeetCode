(SELECT name AS results 
FROM MovieRating t1
LEFT JOIN Users  t2 
    ON t1.user_id = t2.user_id      
GROUP BY t1.user_id
ORDER BY COUNT(t1.user_id) DESC, name ASC
LIMIT 1)

UNION ALL

(SELECT  title AS results  
FROM MovieRating t1
LEFT JOIN Movies t2 
    ON t1.movie_id = t2.movie_id 
WHERE MONTH(created_at) = 2 AND YEAR(created_at) = 2020     
GROUP BY t1.movie_id
ORDER BY AVG(rating) DESC, title ASC
LIMIT 1)
