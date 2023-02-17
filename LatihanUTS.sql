
--1. Tampilkan total gaji pegawai tiap pekerjaan
SELECT (sum(salary)),job_id
from hr.employees
GROUP BY job_id;

2. Tampilkan rata-rata gaji ditiap department
SELECT department_id, ROUND(AVG(salary))
FROM hr.employees
GROUP BY department_id
ORDER BY department_id asc;

3. Tampilkan jumlah pegawai di tiap pekerjaan
SELECT job_id, count(job_id) as Jumlah_Pegawai
from hr.employees
GROUP BY job_id;


4. Tampilkan jumlah pegawai tertinggi berdasarkan pekerjaannya
SELECT count(job_id) as jumlah_pegawai,MAX(salary),job_id
FROM hr.employees
GROUP BY job_id,salary
ORDER BY salary DESC;


SELECT count(job_id) as jumlah_pegawai,job_id
FROM hr.employees
WHERE SALARY = (select MAX(salary) from hr.employees)
GROUP BY job_id;


SELECT E.*, J.job_title
FROM hr.employees E
INNER JOIN hr.jobs J ON E.job_id = J.job_id
WHERE E.salary = (SELECT MAX(salary) FROM hr.employees);


5. tampilkan nama negara yang memiliki jumlah pegawai tertinggi


6. Tampilkan jumlah pegawai yang memiliki lama kerja paling lama (dalam tahun) terhitung dari Hire date hingga sekarang.
SELECT last_name, round((sysdate-hire_date)/365) AS "Lama_Kerja"
FROM hr.employees
ORDER BY "Lama_Kerja";

SELECT first_name, last_name,TRUNC((SYSDATE - hire_date)/365) AS LAMA_KERJA
FROM hr.employees
WHERE TRUNC((SYSDATE - TO_DATE('31-DEC-07')) / 365) > 10;

7. Tampilkan data pegawai yang selisih gaji maksimum dan mininumnya diantara 4000 sampai 7000

8. Tampilkan rata-rata gaji pegawai yang tinggal di california

9. tampilkan jumlah pegawai yang memiliki region sama

10. susunlah kalimat dengan format seperti contoh:
	"Steven King bekerja sebagai President dari tanggal 17-Juni-2003 yang beralamatkan di 2004 Charade Rd, United State of America"
