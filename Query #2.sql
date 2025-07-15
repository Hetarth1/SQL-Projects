SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 50000
;