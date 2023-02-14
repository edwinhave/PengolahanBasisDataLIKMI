--1. Tampilkan data pegawai yang nama belakangnya terdiri >= 9 karakter terurut berdasarkan nama depan
SELECT*
FROM hr.employees
WHERE LENGTH(last_name)>=9
ORDER BY First_name;

--2. Tampilkan jumlah bawahan dari pegawai yang nomor 145 dan masuk kerjanya pada tahun 2007
SELECT count(E.employee_id)
FROM hr.employees E JOIN hr.employees M
ON (E.manager_id = M.employee_id)
Where M.employee_id = 145
AND TO_CHAR(E.hire_date, 'YYYY') = 2007;

--3. Tampilkan nama lengkap pegawai dan lama kerja dalam tahun, yang pada tanggal 31 DES 2007 telah bekerja >= 10 tahun
SELECT first_name, last_name,TRUNC((SYSDATE - hire_date)/365) AS LAMA_KERJA
FROM hr.employees
WHERE TRUNC((SYSDATE - TO_DATE('31-DEC-07')) / 365) > 10;

--4. Tampilkan jumlah pegawai yang direkrut tiap bulan pada tahun 2003 terurut bulan
--BENAR TAPI SALAH
SELECT TO_CHAR(hire_date, 'MONTH') as "Month", COUNT(*) as "NOMOR"
FROM hr.employees
WHERE TO_CHAR(hire_date, 'YYYY') = 2006
GROUP BY TO_CHAR(hire_date, 'MONTH')
ORDER BY "Month";
-- YANG BENER
SELECT count(*),to_char(hire_date,'fmMon')
FROM hr.employees
WHERE to_char(hire_date,'fmYYYY') ='2003'
GROUP BY to_char(hire_date,'fmMon'),hire_date
ORDER BY hire_date;

--5. Tampilkan kode pekerjaan, nama pekerjaan dan jumlah pegawai di masing-masing pekerjaan yang di rekrut pada tahun 2003 dan bekerja sebagai sales
SELECT E.job_id, job_title, count(*), TO_CHAR(hire_date, 'fmYYYY')
FROM hr.employees E join hr.jobs J
ON (E.job_id = J.job_id)
WHERE job_title LIKE '%Sales%'
AND TO_CHAR(hire_date, 'fmYYYY') = '2004'
GROUP BY E.job_id, job_title,TO_CHAR(hire_date, 'fmYYYY');
