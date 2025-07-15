SELECT LENGTH('SKyfall');

SELECT first_name, LENGTH(first_name)
FROM parks_and_recreation.employee_demographics
ORDER BY 2;

SELECT UPPER('sky');

SELECT LOWER('nIghT');

SELECT first_name, UPPER(first_name)
FROM parks_and_recreation.employee_demographics;

SELECT RTRIM('       Hi!     ');

SELECT first_name,
LEFT(first_name, 3),
RIGHT(first_name, 2),
SUBSTRING(first_name,3,2),
birth_date,
SUBSTRING(birth_date,1,4) AS birth_year
FROM parks_and_recreation.employee_demographics;

SELECT first_name, REPLACE(first_name, 'A','z')
FROM parks_and_recreation.employee_demographics;

SELECT LOCATE('e', last_name)
FROM parks_and_recreation.employee_salary;

SELECT first_name, last_name,
CONCAT(first_name,' ',last_name) full_name
FROM parks_and_recreation.employee_demographics;