SELECT t.id, SUM(num) AS num
FROM (
  (SELECT requester_id AS id, COUNT(requester_id) AS num
  FROM RequestAccepted
  GROUP BY requester_id )

  UNION ALL

  (SELECT accepter_id AS id, COUNT(accepter_id)  AS num
  FROM RequestAccepted
  GROUP BY accepter_id ) 
) t
GROUP BY t.id
ORDER BY num DESC
LIMIT 1;

# cari count per id buat request dan accepter (berarti di group by id)