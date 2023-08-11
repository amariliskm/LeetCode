SELECT
    visited_on,
    (
        SELECT SUM(amount)
        FROM customer
        WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
    ) AS amount,
    ROUND(
        (
            SELECT SUM(amount) / 7
            FROM customer
            WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
        ),
        2
    ) AS average_amount
FROM customer c
WHERE visited_on >= (
        SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)
        FROM customer
    )
GROUP BY visited_on;

# SELECT c1.visited_on, amount, ROUND(amount/7, 2) AS average_amount
# FROM 
# (SELECT visited_on, ( SELECT SUM(amount) FROM customer WHERE visited_on BETWEEN DATE_SUB(visited_on, INTERVAL 6 DAY) AND visited_on) AS amount
#     # SUM(amount) OVER(
#     # ORDER BY visited_on
#     # ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
#     # ) AS amount
#     # ROUND(AVG(amount) OVER(
#     # ORDER BY visited_on 
#     # ROWS 6 PRECEDING 
#     # ),2) AS average_amount
# FROM (
#     SELECT visited_on, SUM(amount) AS amount
#     FROM Customer
#     GROUP BY visited_on
#     )t
#     ) c1
# HAVING visited_on IN (
#     SELECT DISTINCT visited_on
#     FROM Customer, (Select @minday := DAY(MIN(visited_on))+6 FROM Customer) md
#     HAVING DAY(visited_on) BETWEEN @minday AND 31
#     )












# # SELECT c1.visited_on, week_after, SUM(c1.amount) OVER(
# #     ORDER BY visited_on
# #     ) total_amount
# # FROM Customer c1
# # JOIN (
# #     SELECT visited_on, DATE_SUB(visited_on, INTERVAL -6 DAY) AS week_after
# #     FROM Customer 
# # ) c2
# #     ON c1.visited_on = c2.week_after

