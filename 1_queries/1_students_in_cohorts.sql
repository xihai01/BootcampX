-- select id and name of students
SELECT id, name
FROM students
WHERE cohort_id = 1
ORDER BY name ASC;

-- select total students from the 3 cohorts
SELECT COUNT(*)
FROM students
WHERE cohort_id IN (1, 2, 3);

-- select name, id and cohort_id of students with no phone or email
SELECT name, id, cohort_id
FROM students
WHERE phone IS NULL OR email IS NULL;

-- select name, id, email and cohort_id of students with no gmail or phone
SELECT name, email, id, cohort_id
FROM students
WHERE email NOT LIKE '%@gmail.com' AND phone IS NULL;

-- select name, id, cohort_id of students currently enrolled in bootcamp
SELECT name, id, cohort_id
FROM students
WHERE end_date IS NULL
ORDER BY cohort_id;

-- select name, email and phone of students without a linked github account
SELECT name, email, phone
FROM students
WHERE github IS NULL
AND end_date IS NOT NULL;