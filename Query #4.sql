SELECT gender, AVG(age) avg_age
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING avg_age < 40;