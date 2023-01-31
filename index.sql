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

⬇️PERTEMUAN 5 -- 20/01/2023
--Pertemuan 5 20/01/2023

SELECT last_name,
TO_CHAR(hire_date, 'fmDAY MON YEAR')
AS HIREDATE
FROM hr.employees;

SELECT * FROM hr.employees WHERE OrderDate='2008-11-11';

--Menggunakan Fungsi TO_CHAR dengan Angka
SELECT last_name,TO_CHAR(salary, '$99,999.00') SALARY
FROM hr.employees
WHERE last_name = 'Ernst';

--Example of RR Date Format
SELECT last_name, TO_CHAR(hire_date, 'DD-Mon-YYYY')
FROM hr.employees
WHERE hire_date < TO_DATE('01-Jan-23','DD-Mon-RR');

--Nesting Functions ➡️Initcap(Upper(Lower(Field)))
SELECT last_name,
SUBSTR (LAST_NAME, 1, 8), '_US'
FROM hr.employees
WHERE department_id = 60;

SELECT last_name,
CONCAT(SUBSTR (LAST_NAME, 1, 8), '_US')
FROM hr.employees
WHERE department_id = 60;

SELECT last_name,
UPPER(CONCAT(SUBSTR (LAST_NAME, 1, 8), '_US'))
FROM hr.employees
WHERE department_id = 60;

--Menggunakan Fungsi NVL
--NVL BIASA HANYA NULL YANG BISA DIRUBAH
SELECT last_name, salary, NVL(commission_pct, 0),
(salary*12) + (salary*12*NVL(commission_pct, 0)) AN_SAL
FROM hr.employees;

--Menggunakan Fungsi NVL2
--Mirip Fungsi IF
-- Istilah bahasanya adalah
-- Jika Commission_PCT = NULL maka 'Sal'
-- else Commission_PCT <> NULL maka 'Sal+Com'
--NVL2 MAU NULL ATAU APAPUN BISA DIRUBAH
SELECT last_name, salary, commission_pct,
NVL2(commission_pct,'COMMISION', '3') income
FROM hr.employees WHERE department_id IN (50, 80);

--FUNGSI NULLIF ADALAH
--JIKA MAU MEMBANDIKAN "2 DATA", DAN KALAU "HASILNYA SAMA", MAKA HASILNYA NULL. 
SELECT first_name, LENGTH(first_name) "expr1",
last_name, LENGTH(last_name) "expr2",
NULLIF(LENGTH(first_name), LENGTH(last_name)) result
FROM hr.employees;

-- A = NULL & B <> NULL ==> A=B
-- A <> NULL & B = NULL ==> B=A
-- A = NULL & B = NULL ==> C

SELECT last_name,manager_id,commission_pct,
COALESCE(manager_id,commission_pct, null) comm
FROM hr.employees
ORDER BY commission_pct; 

SELECT last_name,manager_id,commission_pct,
COALESCE(manager_id,commission_pct, -1) comm
FROM hr.employees
ORDER BY commission_pct;

⬇️PERTEMUAN 6 -- 24/01/2023
--Pertemuan 6 24/01/2023


⬇️PERTEMUAN 7 -- 24/01/2023
--Pertemuan 7 24/01/2023
--📢FUNGSI AGREGAT harus menggunakan Having

SELECT 
FROM table
WHERE condition
GROUP BY column
ORDER BY column

SELECT ROUND(AVG(salary)), MAX(salary),
MIN(salary), SUM(salary)
FROM hr.employees
WHERE job_id LIKE '%REP%';

SELECT MIN(hire_date), MAX(hire_date)
FROM hr.employees;

--MENAMPILKAN TOTAL DATA YANG AKU PUNYA
SELECT COUNT(*)
FROM hr.employees
WHERE department_id = 50; --KALAU ADA "WHERE" DENGAN KONDISI TERTENTU

-- MENGHITUNG YANG TIDAK NULL
SELECT COUNT(commission_pct) 
FROM hr.employees
WHERE department_id = 80; 

--DISTINCT
SELECT COUNT(DISTINCT department_id)
FROM hr.employees;

--Group Functions and Null Values
SELECT AVG(commission_pct)
FROM hr.employees; --NULLNYA TIDAK DIHITUNG ==> TOTAL COMISION / 35 

SELECT AVG(NVL(commission_pct, 0))
FROM hr.employees; -- INI NULLNYA DI HITUNG KARENA TOTAL DATA PADA TABEL ==> TOTAL COMMISION / 45

select * from hr.employees;

--Menggunakan Klausa GROUP BY
SELECT  first_name, department_id, ROUND(AVG(salary)) 
FROM hr.employees 
GROUP BY department_id, first_name;

--setiap field yang gak ada fungsi agregat diletakan di "group by"
--gak semua field harus ditampilkan

--DI GROUP BY GAK BOLEH MAKE ALIAS
SELECT department_id as dept_id, job_id, SUM(salary)
FROM hr.employees
GROUP BY department_id, job_id ;

SELECT department_id, COUNT(last_name)
FROM hr.employees -- ini akan error
--> harus tambahin 
GROUP BY department_id,last_name;


--Illegal Queries Using Group Functions
--FUNGSI AGREGAT TIDAK PERNAH BOLEH DILETAKKAN DI WHERE

SELECT department_id, AVG(salary)
FROM employees
WHERE AVG(salary) > 8000
GROUP BY department_id;

--URUTAN SYNTAX LIVE SQL
SELECT first_name,last_name, department_id,AVG(salary)
FROM hr.employees
WHERE 
GROUP BY department_id
HAVING AVG(salary)
ORDER BY AVG(salary);

--Using the HAVING Clause
SELECT department_id, MAX(salary)
FROM hr.employees
GROUP BY department_id
HAVING MAX(salary)>10000 ;

SELECT job_id, SUM(salary) PAYROLL
FROM hr.employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary) > 13000
ORDER BY SUM(salary);


--Nesting Group Functions
SELECT MAX(AVG(salary))
FROM hr.employees
GROUP BY department_id;


pertemuan 8
SELECT first_name, department_id, department_name, manager_id
From hr.employees NATURAL JOIN hr.departments
ORDER BY Department_id ; --keluar 32 rows
--natural join itu untuk menggabungkan data antara dua tabel dimana panjang data dan tipe datanya sama

SELECT first_name, department_id, department_name
From hr.employees JOIN hr.departments USING (department_id)
ORDER BY department_id; -- keluar 50 rows
-- join using itu menggabungkan antara 2 tabel menggunakan usingnya apa
-- join using tidak menggunakan alias ataupun imbuhan

SELECT first_name, department_id, department_name
From hr.employees JOIN hr.departments USING (department_id)
ORDER BY department_id;  -- ini eror
--manager_id tidak punya tabel

SELECT first_name, D.department_id , department_name, d.manager_id
From hr.employees e JOIN hr.departments d
ON (E.department_id= D.department_id);
--manager_id dan department_id harus dikasih imbuhan atau alias

--SYNTAX CROSS JOIN
SELECT first_name, department_name,
FROM hr.employees, hr.departments;


--JOIN ON JOIN ON
-- apa yang ada di table a dan B di gabungkan dengan JOIN ON
SELECT first_name, D.department_id , department_name, city
From hr.employees e JOIN hr.departments d
ON (E.department_id= D.department_id)
JOIN hr.Locations L
On (D.location_id = L.location_id);


--SELF JOIN
-- JOIN KEPADA DIRINYA SENDIRI UNTUK TABEL BARU DENGAN CARA ALIAS
-- CONTOH SOAL !! TAMPILAKAN DATA PEGAWAI YANG MEMILIKI MANAGER !!
-- Nama Field tidak pernah JAMAK
-- udah jelas baca aja!!!!
SELECT M.FIRST_NAME, M.LAST_NAME, E.FIRST_NAME, E.LAST_NAME
FROM hr.employees E JOIN hr.employees M
ON (E.manager_id = M.employee_id);


-- CONTAH SOAL : TAMPILKAN NAMA BELAKANG DEPARTMENT ID & DEPARTMENT NAME

SELECT last_name, E.department_id , department_name
From hr.employees E 
LEFT OUTER JOIN hr.departments D
ON (E.department_id = D.department_id)
ORDER BY department_id;

SELECT LAST_name, D.department_id , department_name
From hr.departments E 
LEFT OUTER JOIN hr.employees D
ON (E.department_id = D.department_id)
ORDER BY department_id;

SELECT last_name, D.department_id , department_name
From hr.employees E 
FULL OUTER JOIN hr.departments D
ON (E.department_id = D.department_id)
ORDER BY department_id;

--contoh soal
-- tampilkan nama pegawai yang tinggal di washinton
SELECT first_name, D.department_id, state_province
From hr.employees e JOIN hr.departments d
ON (E.department_id= D.department_id)
JOIN hr.Locations L
On (D.location_id = L.location_id)
WHERE state_province LIKE 'Washington';
