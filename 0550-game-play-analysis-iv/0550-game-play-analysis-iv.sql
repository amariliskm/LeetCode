SELECT ROUND(playerCount / (SELECT COUNT(DISTINCT player_id) from Activity), 2) as fraction 
FROM 
(
  SELECT COUNT(DISTINCT Activity.player_id) playerCount 
  FROM Activity, 
  (
    SELECT player_id, min(event_date) as startEventDate
    FROM Activity 
    GROUP BY player_id
  ) firstLogin 
  WHERE datediff(event_date, startEventDate) = 1 and Activity.player_id = firstLogin.player_id
) temp;