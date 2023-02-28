1.Tampilkan seluruh data Pegawai.
SELECT *
FROM hr.employees;

2.Tampilkan Data pegawai yang pekerjaannya sebagai sales dan gajinya di atas 3000.
SELECT *
FROM hr.employees E
JOIN hr.jobs J ON (E.job_id = J.job_id)
WHERE job_title like 'Sales%' AND salary >= 3000

3.Tampilkan nama depan, nama belakang pegawai, gaji, dan gaji setelah di tambahkan dengan komisi.
SELECT first_name, last_name, salary, salary + (salary*commission_pct) AS GAJI_TOTAL
FROM hr.employees E
JOIN hr.jobs J ON (J.job_id = E.job_id)


4.Tampilkan nama pegawai, pekerjaan dan tanggal mulai pegawai yang mulai bekerja setelah tanggal 1 February 2003,Urutkan berdasarkan tgl mulai kerja.
SELECT first_name,job_title,hire_date
FROM hr.employees E
JOIN hr.jobs J ON (E.job_id = J.job_id)
WHERE hire_date > '1-FEB-03'
ORDER BY hire_date ASC;


5.Tampilkan nama pegawai dan hitunglah berapa tahun pegawai tersebut telah bekerja hingga saat ini yang di beri judul "Lama Kerja(tahun)" kemudian urutkan bedasarkan lama kerja.
SELECT first_name, ROUND((sysdate-hire_date)/365) AS "Lama Kerja(Tahun)"
FROM hr.employees 
order by LAMA_KERJA DESC;

6. Tampilkan nama lengkap pegawai dan email pegawai dengan mengganti huruf ke 3 pada email dengan '@'
SELECT first_name||' '||last_name AS NAMA_LENGKAP, REPLACE(email,'@',3)
FROM hr.employees;

7. Tampilkan nama pegawai (nama depan huruf kecil semua sedangkan nama belakang hanya huruf pertamanya besar) sebagai nama, pemnambahan gaji sebesar 20% sebagai Bonus kemudian di urutkan berdasarkan bonus
SELECT LOWER(first_name) ||' '||last_name as Nama,(salary*0.2) AS BONUS
FROM hr.employees
ORDER BY BONUS DESC;
  
8.Tampilkan nama belakang karyawan yang memiliki urutan abjad pertama dan yang terakhir.
SELECT MIN(last_name),MAX(last_name)
FROM hr.employees;

9.Tampilkan job id, departement id, dan selisih gaji yang lebih dari 5000
SELECT E.job_id, E.department_id, MAX_SALARY-MIN_SALARY AS SELISIH_GAJI
FROM hr.employees E
JOIN hr.jobs J ON (E.job_id = J.job_id)
WHERE MAX_SALARY-MIN_SALARY >= 5000;

10. Tampilkan jumlah pegawai yang memiliki 2 huruf depan email yang sama dan di urutkan berdasarkan abjad
SELECT count(email)
FROM hr.employees
WHERE SUBSTR(email,2,1) = '@';

11.Tampilkan jumlah dari provinsi yang merupakan negara "United States of America".
SELECT COUNT(STATE_PROVINCE)
FROM hr.employees E
JOIN hr.departments D ON (E.department_id = D.department_id)
JOIN hr.locations L ON (D.location_id = L.location_id)
JOIN hr.countries T ON (L.country_id = T.country_id)
WHERE COUNTRY_NAME = 'United States of America';

12.Tampilkan nama lengkap pegawai yang tinggal di kota Oxford
SELECT first_name ||' '||last_name AS NAMA_LENGKAP
FROM hr.employees E
JOIN hr.departments D ON (E.department_id = D.department_id)
JOIN hr.locations L ON (D.location_id = L.location_id)
JOIN hr.countries T ON (L.country_id = T.country_id)
WHERE city = 'Oxford';
