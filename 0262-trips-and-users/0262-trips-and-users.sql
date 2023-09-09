WITH user_not_banned AS(
    SELECT users_id 
    FROM Users
    WHERE banned = 'No'
), count_completed_day AS(
    SELECT request_at, COUNT(request_at) AS cnt
    FROM Trips t1 
    LEFT JOIN user_not_banned t2 ON t1.client_id = t2.users_id 
    WHERE users_id IS NOT NULL AND t1.driver_id NOT IN (
        SELECT users_id
        FROM Users
        WHERE banned = 'Yes'
    )
    GROUP BY request_at
), count_cancel AS(
    SELECT request_at AS Day, COUNT(request_at) AS cnt_cancel
    FROM Trips 
    WHERE status LIKE 'cancelled%' AND  client_id NOT IN (
        SELECT users_id 
        FROM Users
        WHERE banned = 'Yes'
    )
    GROUP BY request_at 
)

# select *
# from count_completed_day

SELECT request_at AS Day,ROUND(IFNULL(cnt_cancel/cnt, 0), 2) AS `Cancellation Rate`
FROM count_completed_day t1
LEFT JOIN count_cancel t2 ON t1.request_at = t2.Day
WHERE request_at BETWEEN "2013-10-01" and "2013-10-03" 