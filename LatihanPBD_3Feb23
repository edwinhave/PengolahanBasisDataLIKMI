SELECT * FROM hr.EMPLOYEES;
SELECT * FROM hr.DEPARTMENTS;
SELECT * FROM hr.LOCATIONS;
SELECT * FROM hr.COUNTRIES;
SELECT * FROM hr.REGIONS;
SELECT * FROM hr.JOBS;
SELECT * FROM hr.JOB_HISTORIES;


--1. Tampilkan jumlah pegawai yang berada pada negara UK dan masuk kerja sebelum tahun 07
SELECT count(*)
FROM hr.employees E JOIN hr.departments D
    ON (E.department_id = D.department_id)
    JOIN hr.locations L
    ON (L.location_id = D.location_id)
    JOIN hr.countries C
    ON (L.country_id = C.country_id)
    WHERE country_name = 'United Kingdom'
    AND hire_date < '01-JAN-2007';

--2. Tampilkan jumlah pegawai ditiap negara
SELECT C.country_name,count(*)
FROM hr.employees E JOIN hr.departments D
    ON (E.department_id = D.department_id)
    JOIN hr.locations L
    ON (L.location_id = D.location_id)
    JOIN hr.countries C
    ON (L.country_id = C.country_id)
    GROUP BY country_name;

--3. Tampilkan jumlah pegawai yang bekerja setelah Daniel
SELECT COUNT(*)
FROM hr.employees E
JOIN hr.employees D
ON (E.hire_date > D.hire_date)
WHERE (E.first_name = 'Daniel') OR (E.last_name ='Daniel');
    
--4. Tampilkan nama department yang memiliki waktu mulainya (start date) lebih kecil dengan waktu penerimaan dan memiliki rata-rata gaji dibawah 4000
SELECT department_name, start_date 
FROM hr.departments d
JOIN hr.job_history j ON (d.department_id = j.department_id)
JOIN hr.employees e ON (e.department_id = j.department_id)
WHERE (start_date < hire_date)
GROUP BY d.department_id, d.department_name, j.start_date
HAVING AVG(salary) < 4000;



--5. Tampilkan rata-rata gaji, nama department dan hire date berada pada minggu ke 2 dan ke 4 dalam tiap bulannya dan yang rata-rata gajinya di antara 2000 sampai dengan 8000 kemudia urutkan berdasarkan rerata gaji
SELECT AVG(SALARY), department_name
from hr.employees E
JOIN hr.departments D
ON (E.department_id = D.department_id)
WHERE(TO_CHAR(HIRE_DATE,'FmWW') = 2)
GROUP BY d.department_id, department_name
HAVING AVG(Salary) BETWEEN 2000 AND 8000
ORDER BY AVG(SALARY);
