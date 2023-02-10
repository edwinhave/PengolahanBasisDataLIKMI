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
--5. Tampilkan kode pekerjaan, nama pekerjaan dan jumlah pegawai di masing-masing pekerjaan yang di rekrut pada tahun 2003 dan bekerja sebagai sales
