SELECT ROUND(SUM(t2.tiv_2016),2) AS tiv_2016
FROM (
  SELECT *
  FROM Insurance
  GROUP BY tiv_2015
  HAVING COUNT(tiv_2015)>1
)  t1
JOIN (
  SELECT *
  FROM Insurance
  GROUP BY lat,lon
  HAVING COUNT(lat)=1 AND COUNT(lon)=1
) t2
ON t1.tiv_2015 = t2.tiv_2015


