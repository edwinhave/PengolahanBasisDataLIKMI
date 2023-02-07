
SELECT * FROM hr.employees;
SELECT * FROM hr.locations;

-- 1. Tampilkan pegawai yang bekerja sebagai FI_MGR, PU_MAN, ST_MAN
SELECT * FROM hr.employees 
WHERE job_id
IN ('FI_MGR','PU_MAN','ST_MAN','PU_CLERK');

--2. Tampilkan pegawai yang tidak bekerja sebagai IT_PROG maupun MK_MAN dan gajinya >10000
SELECT * FROM hr.employees 
WHERE job_id
NOT IN ('IT_PROG','MK_MAN')
AND SALARY > 1000;

--3. Tampilkan para pegawai bagian pembelian (job_id=’PU_MAN’, ‘PU_CLERK) Gajinya > 3000
SELECT * FROM hr.employees
WHERE job_id IN ('PU_MAN','PU_CLERK')
AND SALARY > 3000;

--4. Tampilkan first_name, last_name, total komisi (commission_pct*salary) semua pegawai bernama ‘Peter’
SELECT first_name, last_name, (commission_pct*salary) AS Total_Komisi
FROM hr.employees
where first_name LIKE 'Peter%';

--5. Buatlah kalimat dari nama, dan tahun masuk seperti contoh berikut ini:‘Steven King bekerja sejak tahun 1987’
SELECT first_name || ' ' || last_name ||' Bekerja sejak tahun '|| TO_CHAR(hire_date, 'YYYY')
AS KALIMAT
FROM hr.employees;

--6. Tampilkan first_name, last_name, lama kerja (dibulatkan dalam bulan) pegawai departemen no. 80
SELECT first_name, last_name, ROUND((SYSDATE-hire_date)/30),department_id
FROM hr.employees
WHERE department_id = 80;

--7. Tampilkan first_name, last_name, lama kerja (dalam tahun) pegawai yang pada tanggal 31 Des 2015 telah bekerja lebih dari 10 tahun
SELECT first_name, last_name, ROUND((TO_DATE('31-DEC-15')-hire_date)/365) AS LAMA_BEKERJA,department_id
FROM hr.employees
WHERE ROUND((TO_DATE('31-DEC-15')-hire_date)/365) > 10;

--8. Tampilkan jumlah lokasi di setiap kota
SELECT city, COUNT(*) AS "JUMLAH_LOKASI"
FROM hr.locations
GROUP BY CITY
ORDER BY CITY;

--9. Tampilkan pegawai yang bekerja sebagai ‘IT_PROG’ lebih dari 20 tahun
SELECT first_name, last_name,((SYSDATE-hire_date)/365) AS Lama_Kerja_TAHUN
FROM HR.employees
WHERE job_id = 'IT_PROG' AND ((SYSDATE-hire_date)/365)>20;

--10.Tampilkan jumlah pegawai yang bekerja lebih dari 15 tahun, di setiap department 
SELECT department_id, COUNT(ROUND((SYSDATE-hire_date)/365)) AS "JUMLAH_PEGAWAI"
FROM hr.employees
WHERE ROUND((SYSDATE-hire_date)/365) >= 15
GROUP BY department_id,ROUND((SYSDATE-hire_date)/365)
ORDER BY department_id;

--11. Tampilkan jumlah pegawai yang direkrut setiap tahunnya
SELECT TO_CHAR(hire_date, 'YYYY') as "Year", COUNT(*) as PEGAWAI
FROM hr.employees
GROUP BY TO_CHAR(hire_date, 'YYYY');

--12.	Tampilkan jumlah programmer (job_id=’IT_PROG’) yang direkrut setiap tahunnya
SELECT TO_CHAR(hire_date, 'YYYY') as "Year", COUNT(*) as Pegawai_IT_PROG
FROM hr.employees
WHERE job_id = 'IT_PROG'
GROUP BY TO_CHAR(hire_date, 'YYYY');

--13.	Tampilkan jumlah pegawai yang menjadi bawahan langsung setiap manager
SELECT M.FIRST_NAME, M.LAST_NAME, E.FIRST_NAME, E.LAST_NAME
FROM hr.employees E JOIN hr.employees M
ON (E.manager_id = M.employee_id);

--14.	Tampilkan jumlah pegawai yang direkrut setiap bulannya pada tahun 2006, terurut bulan
SELECT TO_CHAR(hire_date, 'MONTH') as "Month", COUNT(*) as "NOMOR"
FROM hr.employees
WHERE TO_CHAR(hire_date, 'YYYY') = 2006
GROUP BY TO_CHAR(hire_date, 'MONTH')
ORDER BY "Month";

--15.	Tampilkan jumlah pegawai yang direkrut bulan Jan-08, per departmen 
SELECT TO_CHAR(hire_date, 'MONTH') as "Month",department_id , COUNT(*) as "NOMOR"
FROM hr.employees
WHERE hire_date > '01-JAN-08'
GROUP BY TO_CHAR(hire_date, 'MONTH'), department_id
ORDER BY "Month";
