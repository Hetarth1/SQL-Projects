DROP TEMPORARY TABLE IF EXISTS temp_table;

CREATE TEMPORARY TABLE temp_table
(
first_name VARCHAR(50),
last_name VARCHAR(50),
song_name VARCHAR(100)
);

INSERT INTO temp_table
VALUES
('Arijit','Singh','Tum Hi Ho'),
('Atif','Aslam','Main Rang Sharbaton Ka');

SELECT *
FROM temp_table;

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;

SELECT *
FROM salary_over_50k;