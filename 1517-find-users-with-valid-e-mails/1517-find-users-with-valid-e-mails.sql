# Write your MySQL query statement below
SELECT *
FROM Users
WHERE mail REGEXP  '^[A-Za-z]+[a-zA-Z0-9-_.]*@leetcode[.]com$'

# REGEXP