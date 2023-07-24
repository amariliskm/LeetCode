SELECT id, CASE 
    WHEN t1_p_id = 0 THEN 'Root'
    WHEN sum_child >= 1 THEN 'Inner'
    ELSE 'Leaf'
    END AS type
FROM (
  # cari root dan inner dahulu
  SELECT t1.id AS id, IFNULL(t1.p_id,0) AS t1_p_id, t2.id AS id_child, t2.p_id AS t2_p_id, COUNT(t2.p_id) AS sum_child
  FROM Tree t1
  LEFT JOIN Tree t2
  ON t1.id = t2.p_id
  GROUP BY t1.id
)t




# root node because its parent node is null and it has child .
#  inner node because it has parent node  and child node.
# leaf nodes because they have parent nodes and they do not have child nodes.


#root jika p_id nya null
# inner kalo dia ada di p_id