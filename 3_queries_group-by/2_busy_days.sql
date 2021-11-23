SELECT day, COUNT(name) as total_assignments
FROM assignments
GROUP BY day
HAVING COUNT(name) >= 10
ORDER BY day;