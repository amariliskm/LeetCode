SELECT machine_id, ROUND(AVG(difftime),3) AS processing_time 
FROM
(SELECT t1.machine_id, t1.process_id, t2.timestamp - t1.timestamp  AS difftime  
FROM Activity t1
JOIN (
  SELECT *
  FROM Activity 
) t2
ON t1.machine_id  = t2.machine_id  AND t1.process_id  = t2.process_id
WHERE t1.activity_type = 'start' AND t2.activity_type = 'end'
GROUP BY t1.machine_id, t1.process_id) t
GROUP BY machine_id