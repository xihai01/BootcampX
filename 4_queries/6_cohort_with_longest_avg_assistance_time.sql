SELECT name, MAX(sub_table.average_assistance_time) as average_assistance_time
FROM (
  SELECT cohorts.name, AVG(completed_at - started_at) as average_assistance_time
  FROM assistance_requests
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.id = students.cohort_id
  GROUP BY cohorts.name
) as sub_table
GROUP BY name
ORDER BY average_assistance_time DESC
LIMIT 1;