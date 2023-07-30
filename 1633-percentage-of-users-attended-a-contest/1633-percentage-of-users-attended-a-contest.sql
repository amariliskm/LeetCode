# SELECT *
SELECT contest_id, ROUND(COUNT(contest_id) / (SELECT COUNT(DISTINCT user_id) FROM Users) *100,2) percentage 
FROM Users u
RIGHT JOIN Register r
    ON u.user_id = r.user_id 
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC