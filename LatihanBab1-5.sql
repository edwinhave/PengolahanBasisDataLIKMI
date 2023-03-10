1. Tampilkan no pegawai, first name, Last name, email, no telp, job id, manager id, tgl diterima, gaji, komisi 
dan departementnya di dalam 1 kolom yang diberi judul Hasil Akhir
SELECT employee_id||','|| first_name||','|| last_name||','|| email||','|| phone_number||','||  job_id||','||  manager_id||','||  hire_date||','|| salary||','|| commission_pct||','|| department_name AS "Hasil_Akhir"
From hr.employees NATURAL JOIN hr.departments;

2. Tampilkan nama dari semua pegawai yang memiliki nama yang mengandung karakter ‘A’ pada huruf ketiga.
SELECT first_name
FROM hr.employees
WHERE UPPER(SUBSTR(first_name,3,1)) = 'a';

3. tampilkan last name, gaji dari pegawai yang gajina tidak ada diantara 5000 dan 12000
SELECT last_name
FROM hr.employees
WHERE salary not between '5000' and '12000';

4. tampilkan last name, job id, tgl penerimaan yang nama belakangnya terdiri dari Matos dan Taylor yang disusun dari tgl terlama
SELECT last_name,job_id,hire_date
FROM hr.employees
WHERE last_name IN ('Matos','Taylor')
ORDER BY hire_date ASC;

5. Tampilkan last name dari pegawai yang memiliki huruf a dan i di last name
SELECT last_name
FROM hr.employees
WHERE last_name LIKE '%a%i%';

6. Tampilkan last name, salary, komisi yang mana komisinya sebesar 30%
select last_name, salary,commission_pct
from hr.employees
WHERE commission_pct = 0.3;

7. Tampilkan id pegawai, last name, gaji dan gaji yang telah dinaikin sebesar 15.5% (lakukan pembulatan) yang diberi nama New Salary
SELECT employee_id, last_name, salary, ROUND(salary * 1.155) AS "New Salary"
FROM HR.employees;

8. Buatlah query yang menampilkan last name (dengan huruf pertama kapital dan yang lainnya huruf kecil) dan banyaknya huruf dari last name yang namanya dimulai dengan huruf 'J', 'A', 'M' dan diurutkan 
SELECT INITCAP(last_name),LENGTH(last_name)
FROM hr.Employees
WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
ORDER BY LENGTH(last_name) DESC;

9. buatlah query untuk menampilkan nama belakang dan gaji dengan format gaji 15 karakter yang disebelah kirinya diberi simbol $
SELECT last_name,LPAD(Salary,15,'$')
From hr.employees;

SELECT last_name , CONCAT('$', LPAD(CAST(salary AS CHAR(15)), 15, '0')) AS salary
FROM hr.employees;


10. buatlah query yang menampilka 8 karakter dari nama belakan dan salarynya yang ditampilkan dalam bentuk * dan diurutkan dari yang terbesar
SELECT SUBSTR(last_name, 1, 8) AS "Nama Belakang",
RPAD('', ROUND(salary / 1000), '') AS "Gaji"
FROM hr.employees
ORDER BY salary DESC;


11. tampilkan nama belakang pegawai, hire date, yang hari pertama adalah hari senin setelah 6 bulan bekerja (beri alias sebagai REVIEW).
dengan format "Monday, 21st December, 1987"
SELECT last_name,hire_date, to_char(next_day(add_month(hire_date,6),'Monday', 'fmDay, DDth month, YYYY')
from hr.employees;

--REVISI MENYUSUL✅✅
SELECT last_name, TO_CHAR(hire_date,'fmDay, DD MM YY'), hire_date
FROM hr.employees
WHERE TO_CHAR(hire_date,'fmDay, DD MM YYYY') = 'Monday';
--REVISI MENYUSUL✅✅
                                    
                                    
12. tampilkan id manager dan gaji terendah dari pegawai untuk manager tersebut.
    tidak termasuk manager yang tidak di ketahui kemudian urutkan.
SELECT manager_id, MIN(salary)
FROM hr.employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
ORDER BY MIN(salary) ASC;

13. Tampilkan nama belakang, job id, department id, nama department yang bekerja di kota 'sydney'
SELECT last_name, job_id,E.department_id,department_name
FROM hr.employees E JOIN hr.departments D ON (E.department_id = D.department_id)
JOIN hr.locations L on (L.location_id=D.location_id)
WHERE lower(city) = 'sydney';

14. Tampilkan nama pegawai, no department yang max salary nya diantara 5000 sampai dengan 20000
SELECT last_name, department-id, max(salary)
FROM hr.employees
GROUP BY department_id, last_name
HAVING max(salary) between 5000 AND 20000;

15. Tampilkan Alamat, kode pos, kota, dan id region nya 3
SELECT street_address, postal_code,city,R.region_id
FROM hr.locations L
JOIN hr.countries C ON (L.country_id=C.country_id)
JOIN hr.regions R ON (C.region_id=R.region_id)
WHERE R.region_id = 3;

16. Tampilkan rata-rata gaji pegawai yang telah bekerja selama 16 atau 20 thn
SELECT AVG (salary)
FROM hr.employees
WHERE ROUND((sysdate-hire_date)/365) IN ('16','20');
                                    
--YANG BENAR✅✅✅✅                                    
SELECT AVG(salary), ROUND((SYSDATE-hire_date)/365.0)
FROM hr.employees
WHERE ROUND((SYSDATE-hire_date)/365.0) = 16
OR ROUND((SYSDATE-hire_date)/365,0) = 20
GROUP BY ROUND((SYSDATE-hire_date)/365.0);

17. Tampilkan nama belakang dan hitung berapa bulan pegawai telah bekerja hingga saat ini (lakukan pengurutan berdasarkan lama bekerja).
SELECT last_name, round((sysdate-hire_date)/30) AS "Lama_Kerja"
FROM hr.employees
ORDER BY "Lama_Kerja";

18. tampilkan nama-nama department yang dekepalai oleh Neena Kochar
SELECT department_name
FROM hr.departments d join hr.employees e ON (d.department_id = e.department_id)
WHERE e.first_name LIKE 'Neena' OR last_name like 'Kochar';

19. Tampilkan data pegawai yang bekerja di negara Inggris (United Kingdom)
SELECT *
FROM hr.employees d JOIN hr.departments e ON (d.department_id=e.department_id)
JOIN hr.locations f ON (e.location_id=f.location_id)
JOIN hr.countries g ON (f.country_id=g.country_id)
WHERE g.country_name LIKE 'United Kingdom';

20. tampilkan nama lengkap pegawai, tanggal masuk pegawai, nama lengkap manajernya, dan tanggal masuk manajernya untuk pegawai yang bekerja lebih dulu dari manajernya (berikan nama alias untuk masing-masing kolom)
SELECT (E.first_name || ' ' || E.last_name) AS NAMA, E.hire_date,
(M.first_name || ' ' || M.last_name) AS NAMA, M.hire_date
FROM hr.employees E join hr.employees M
ON (E.manager_id = M.employee_id)
WHERE E.hire_date < M.hire_date;
