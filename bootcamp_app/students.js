const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

//get user inputs for cohort name and limit
const args = process.argv.slice(2);
const cohortName = args[0];
const limit = args[1];

const query = `
SELECT students.id, students.name as student, cohorts.name as cohort
FROM students
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name LIKE $1
LIMIT $2;
`;

const values = [`%${cohortName}%`, limit];

pool.query(query, values)
.then(res => {
  res.rows.forEach(user => {
    console.log(`${user.student} has an id of ${user.id} and was in the ${user.cohort} cohort`);
  });
})
.catch(err => console.error('query error', err.stack));
