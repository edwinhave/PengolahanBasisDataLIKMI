SELECT department_id, location_id
FROM hr.departments;

SELECT last_name, salary, salary + 300
FROM hr.employees;

SELECT last_name, salary, 12*salary+100
FROM hr.employees;

SELECT last_name, salary, 12*(salary+100)
FROM hr.employees;

--Defining a Null Value
SELECT last_name, job_id, salary, commission_pct
FROM hr.employees;

--Null Values in Arithmetic Expressions
SELECT last_name, 12*salary*commission_pct
FROM hr.employees;

--Using Column Aliases
SELECT last_name AS "Name" , salary*12 AS "Annual Salary"
FROM hr.employees;

--Pengoperasian Penggabungan
SELECT last_name||' Bekerja sebagai '|| job_id AS "Employees"
FROM hr.employees;

--Duplicate Rows
SELECT department_id
FROM hr.employees;

SELECT DISTINCT department_id
FROM hr.employees;

-- Pertemuan 13 Januari 2023
SELECT employee_id, last_name, job_id, department_id
FROM hr.employees
WHERE department_id = 90 ;

SELECT last_name, job_id, department_id
FROM hr.employees
WHERE last_name = 'Whalen' ;

SELECT last_name, salary
FROM hr.employees
WHERE salary <= 3000 ;

SELECT last_name, salary
FROM hr.employees
WHERE salary BETWEEN 2500 AND 3500 ;

SELECT employee_id, last_name, salary, manager_id
FROM hr.employees
WHERE manager_id IN (100, 101, 201);

SELECT first_name
FROM hr.employees
WHERE first_name LIKE 'S%' ;

SELECT last_name
FROM hr.employees
WHERE last_name LIKE '_o%' ;

SELECT last_name, manager_id
FROM hr.employees
WHERE manager_id IS NULL ;

SELECT employee_id, last_name, job_id, salary
FROM hr.employees
WHERE salary >=10000
AND job_id LIKE '%MAN%' ;

SELECT employee_id, last_name, job_id, salary
FROM hr.employees
WHERE salary >= 10000
OR job_id LIKE '%MAN%' ;

SELECT last_name, job_id
FROM hr.employees
WHERE job_id
NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP') ;


SELECT last_name, job_id, salary
FROM hr.employees
WHERE job_id = 'SA_REP'
OR job_id = 'AD_PRES'
AND salary > 15000; -- salah satu boleh tidak terpenuhi

SELECT last_name, job_id, salary
FROM hr.employees
WHERE (job_id = 'SA_REP'
OR job_id = 'AD_PRES') -- aturan yang di dalam harus di penuhi
AND salary > 15000;

--SELECT
--FROM
--WHERE
--ORDER BY

SELECT last_name, job_id, department_id, hire_date
FROM hr.employees
ORDER BY hire_date ;

select * from hr.employees order by last_name ASC;

SELECT last_name, department_id, salary
FROM hr.employees
ORDER BY department_id, salary DESC;

