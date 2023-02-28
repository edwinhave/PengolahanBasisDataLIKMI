PERTEMUAN SETELAH UTS
SUB QUERY

SUB QUERY ADA 2
- MAIN QUERY (MATERI SEBELUM UTS)
- SUB QUERY 
  ➡️SELECT
  ➡️FROM
  ➡️KONDISI/WHERE

--SELECT*FROM hr.employees;
CONTOH
SELECT last_name
FROM hr.employees;

SELECT last_name
FROM hr.employees
WHERE salary = (
SELECT salary
FROM hr.employees
WHERE last_name = 'Austin');

SELECT Department_id
FROM hr.employees
WHERE (salary) > ( SELECT AVG(salary)
    FROM hr.employees)
GROUP BY department_id;

SELECT last_name
FROM hr.employees
WHERE salary > (SELECT salary
    FROM hr.employees
    WHERE last_name = 'Abel');

--#NOTE pisahkan urutan Main dan Sub Query
--Teknik pengerjaan untuk soal SUB QUERY adalah
--➡️Kerjakan dulu Main-nya baru kerjakan Subnya secara terpisah.
SELECT department_id, MIN(salary)
FROM hr.employees
GROUP BY department_id
HAVING MIN(salary) >
    (SELECT MIN(salary)
    FROM hr.employees
    WHERE department_id = 50);


--#kalau di Main ada GROUP BY, Sub-nya harus ada juga
--#kalau di Sub-nya ada GROUP BY , Mainnya tidak harus ada Group BY

CONTOH SOAL
--Tampilkan salary gaji pegawai yang gajinya lebih kecil dari IT_PROG

SELECT employee_id, last_name, job_id, salary
FROM hr.employees
WHERE salary < ANY
      (SELECT salary
      FROM hr.employees
      WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG'
ORDER BY EMPLOYEE_ID;
--ANY == ALL
-- KONDISI SUB QUERY SALAH SATU TERPENUHI MAKA AKAN TAMPIL 

SELECT employee_id, last_name, job_id, salary
FROM hr.employees
WHERE salary < ALL
      (SELECT salary
      FROM hr.employees
      WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG'
ORDER BY EMPLOYEE_ID;
--ALL == AND (WHERE A AND B)
-- KONDISI SUB QUERY HARUS DIPENUHI SEMUANYA MAKA AKAN TAMPIL


