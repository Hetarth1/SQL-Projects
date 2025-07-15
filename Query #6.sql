SELECT first_name, last_name, 'Uncle' AS Label
FROM parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Aunty' AS Label
FROM parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly paid employee' AS Label
FROM parks_and_recreation.employee_salary
WHERE salary > 75000
ORDER BY first_name, last_name;