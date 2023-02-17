
--1. Tampilkan total gaji pegawai tiap pekerjaan
SELECT job_title,(sum(salary)) as Gaji_Pegawai
from hr.employees E
JOIN hr.jobs J ON (E.job_id=J.job_id) 
GROUP BY job_title;

2. Tampilkan rata-rata gaji ditiap department
SELECT department_id, ROUND(AVG(salary))
FROM hr.employees
GROUP BY department_id
ORDER BY department_id asc;

3. Tampilkan jumlah pegawai di tiap pekerjaan
SELECT J.job_title, count(job_title) as Jumlah_Pegawai
from hr.employees E
JOIN hr.jobs J ON (E.job_id=J.job_id)
GROUP BY J.job_title;


4. Tampilkan jumlah pegawai tertinggi berdasarkan pekerjaannya
select job_title,max(salary), count (*)
from hr.employees d join hr.jobs e on (d.job_id=e.job_id)
group by job_title, salary
order by salary DESC;

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
SELECT country_name, COUNT(*)
From hr.employees E
JOIN hr.departments D ON (E.department_id = D.department_id)
JOIN hr.locations L ON (D.location_id = L.location_id)
JOIN hr.countries T ON (L.country_id = T.country_id)
GROUP BY country_name
ORDER BY COUNT(*) desc;

6. Tampilkan jumlah pegawai yang memiliki lama kerja paling lama (dalam tahun) terhitung dari Hire date hingga sekarang.
SELECT count(*),last_name, MAX(ROUND(((sysdate-hire_date)/365))) AS Lama_Kerja
FROM hr.employees
GROUP BY last_name
ORDER BY Lama_Kerja DESC;

7. Tampilkan data pegawai yang selisih gaji maksimum dan mininumnya diantara 4000 sampai 7000
SELECT * FROM hr.employees E
JOIN hr.jobs J ON (E.job_id = J.job_id)
WHERE (max_salary-min_salary) between 4000 and 7000

8. Tampilkan rata-rata gaji pegawai yang tinggal di california
SELECT ROUND(AVG(salary))
From hr.employees E
JOIN hr.departments D ON (E.department_id = D.department_id)
JOIN hr.locations L ON (D.location_id = L.location_id)
JOIN hr.countries T ON (L.country_id = T.country_id)
WHERE STATE_PROVINCE = 'California';

9. tampilkan jumlah pegawai yang memiliki region sama
SELECT count(*) as Jumlah_Pegawai, region_id
From hr.employees E
JOIN hr.departments D ON (E.department_id = D.department_id)
JOIN hr.locations L ON (D.location_id = L.location_id)
JOIN hr.countries T ON (L.country_id = T.country_id)
GROUP BY region_id;

10. susunlah kalimat dengan format seperti contoh:
	"Steven King bekerja sebagai President dari tanggal 17-Juni-2003 yang beralamatkan di 2004 Charade Rd, United State of America"
SELECT first_name||' '||last_name||'bekeja sebagai '||job_title||' dari tanggal '||hire_date||' yang beralamatkan '||street_address||','||country_name as SUSUN_KALIMAT
From hr.employees E
JOIN hr.jobs J ON (E.job_id = J.job_id)
JOIN hr.departments D ON (E.department_id = D.department_id)
JOIN hr.locations L ON (D.location_id = L.location_id)
JOIN hr.countries T ON (L.country_id = T.country_id)
