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

--PERTEMUAN KE-4 (17 JANUARI 2023)
select * from hr.employees;

select first_name from hr.employees;

--EXAMPLE
-- "CASE" (NAMA FIELD)

--Field yang mau diubah jadi huruf kecil
select LOWER(first_name), first_name
from hr.employees;

--Field yang mau diubah jadi huruf Besar
select UPPER(first_name), first_name
from hr.employees;

--Field digabungkan
select CONCAT(first_name,last_name), first_name
from hr.employees;

--Pengambilan Character dari
-- SUBSTR (NamaField, urutan huruf , jumlah huruf yang akan terambil )
select SUBSTR(first_name,3,2), first_name
from hr.employees;

--Pengambilan jumlah character pada data yang disediakan
select LENGTH(first_name), first_name
from hr.employees;

--Jika memasukkan NamaField, tidak perlu menggunakan kutip('')
--Penggunaan kutip 1 untuk kata yang diluar database
select LENGTH('EDWIN')
from Dual;

--INSTRING digunakan untuk mencari huruf yang kita mau ada di urutan berapa pada data
select INSTR(first_name,'e'), first_name
from hr.employees;

--Fungsi-fungsi ini menambahkan atau menambahkan karakter ke string, berdasarkan panjang tertentu.
select LPAD(salary,10,'-'), first_name
from hr.employees;

select RPAD(salary,10,'*'), first_name
from hr.employees;

select LPAD(salary,10,'-'),RPAD(salary,10,'*'), first_name
from hr.employees;

--REPLACE atau Mengganti huruf atau character tertentu
select email
from hr.employees;

select REPLACE(email,'A','@')
from hr.employees;

--MENGHAPUS / MEMOTONG 
select TRIM('B' 
from first_name), first_name
from hr.employees ORDER BY first_name;

select LOWER(first_name), first_name
from hr.employees;

--Using the Character-Manipulation Functions
-- CONTOH SOAL ⬇️
-- ➡️Tampilkan employ_id, first_name dan last_name yang di aliaskan nama dan JOB_ID berinisial REP dan hitung jumlah charcter last_name dan mencari lokasi huruf a pada last_name ⬅️
--
SELECT employee_id, CONCAT(first_name, last_name) NAME,
job_id, LENGTH (last_name),
INSTR(last_name, 'a') "Contains 'a'?"
FROM hr.employees
WHERE SUBSTR(job_id, 4) = 'REP';

--NUMBER FUNCTIONS
-- 1. ROUND => PEMBULATAN BIASA
-- 2. TRUNC => PEMBULATAN/PEMOTONGAN MENDEKATI
--Membulatkan nilai ke desimal yang ditentukan
Select
    Round(44.757,2),
    Trunc(44.757,2),
    Round(44.754,2),
    Trunc(44.759,2)
from Dual;

--Bekerja dengan Tanggal
SELECT last_name, hire_date
FROM hr.employees
WHERE hire_date < '01-FEB-07';

--Menggunakan Operator Aritmatika dengan Tanggal
SELECT last_name, (SYSDATE-hire_date)/7 AS WEEKS
FROM hr.employees
WHERE department_id = 90;
--Tampilkan nama belakang, tampilkan juga jumlah lama ia bekerja dengan hitungan minggu

--SYSNTAX MEMUNCULKAN HARI INI ⬇️
SELECT SYSDATE from Dual;

--SYSNTAX MENGHITUNG ULANG TAHUN
SELECT SYSDATE - TO_DATE('01-NOV-01') from Dual;

--SYSNTAX MENGHITUNG UMUR DALAM BENTUK BULAN DAN DI BAGI 12 UNTUK KEBUTUHAN UMUR/TAHUNAN
SELECT (MONTHS_BETWEEN('17-JAN-23','01-NOV-01'))/12
from Dual;

SELECT NEXT_DAY('9-JAN-23','THUESDAY')
FROM Dual;

--MENGGUNAKAN FUNGSI TANGGAL DENGAN ROUND() & TRUNC()
Select
    ROUND(SYSDATE,'MONTH'),
    ROUND(SYSDATE,'YEAR'),
    TRUNC(SYSDATE,'MONTH'),
    TRUNC(SYSDATE,'YEAR')
from Dual;
