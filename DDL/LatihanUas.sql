--1.	Buatlah Tabel beserta Constraint
CREATE TABLE Film(
	Kode_film char(3),
	jenis varchar2(10),
	judul_film varchar2(25),
    jumlah number(1)
);

CREATE TABLE Penyewa(
	Id_penyewa char(6),
	jenis_identitas varchar2(15),
    nama varchar2(30),
    alamat varchar2(50)
);

CREATE TABLE Penyewaan(
    kode_sewa char(4),
    tgl_sewa date,
    id_penyewa char(6),
    tgl_kembali date
);

CREATE TABLE Detail_sewa(
    kode_sewa char(4),
    kode_film char(3)
);


ALTER TABLE Film ADD CONSTRAINT pk_kode_film
PRIMARY KEY (kode_film);

ALTER TABLE Penyewa ADD CONSTRAINT pk_id_penyewa
PRIMARY KEY (id_penyewa);

ALTER TABLE Penyewaan ADD CONSTRAINT pk_kode_sewa
PRIMARY KEY (kode_sewa);

ALTER TABLE detail_sewa ADD CONSTRAINT pk_detil_kode_sewa
PRIMARY KEY (kode_sewa,kode_film);

ALTER TABLE Detail_sewa add constraint fk_kode_film 
foreign key(kode_film) references film(kode_film);

ALTER TABLE Detail_sewa add constraint fk_kode_sewa 
foreign key(kode_sewa) references penyewaan(kode_sewa);

ALTER TABLE Penyewaan add constraint fk_id_penyewaan 
foreign key(id_penyewa) references penyewa(id_penyewa);



--2.	Isilah data ke dalam table tersebut dengan data yang ada pada file (lat_pbd_m_1_data.jpg)
INSERT INTO Film VALUES ('A01', 'Action', 'Spiderman', 3);
INSERT INTO Film VALUES ('A02', 'Action', 'Spiderman 2', 5);
INSERT INTO Film VALUES ('A03', 'Action', 'Justice League', 4);
INSERT INTO Film VALUES ('D01', 'Drama', 'Love Story', 3);
INSERT INTO Film VALUES ('D02', 'Drama', 'Beauty And The Beast', 5);
INSERT INTO Film VALUES ('D03', 'Drama', 'Remember Me', 3);
INSERT INTO Film VALUES ('H01', 'Horror', 'Evil Death', 2);
INSERT INTO Film VALUES ('H02', 'Horror', 'Conjuring', 3);
INSERT INTO Film VALUES ('H03', 'Horror', 'Insidious', 5);


INSERT INTO Penyewa VALUES ('P-000'||seq_id_penyewa.NEXTVAL, 'SIM', 'Sandi', 'Jl. Banda 10');
INSERT INTO Penyewa VALUES ('P-000'||seq_id_penyewa.NEXTVAL, 'KTP', 'Andi', 'Jl. Melati 1');
INSERT INTO Penyewa VALUES ('P-000'||seq_id_penyewa.NEXTVAL, 'SIM', 'Budi', 'Jl. Kalimalang 12');
INSERT INTO Penyewa VALUES ('P-000'||seq_id_penyewa.NEXTVAL, 'SIM', 'Willy', 'Jl. Cimacan 45');
INSERT INTO Penyewa VALUES ('P-000'||seq_id_penyewa.NEXTVAL, 'KTP', 'Tuti', 'Jl. Cibitung 16');


INSERT INTO Penyewaan VALUES ('S00'||seq_kode_sewa.NEXTVAL, '02-JAN-07', 'P-0001', '03-JAN-07');
INSERT INTO Penyewaan VALUES ('S00'||seq_kode_sewa.NEXTVAL, '03-JAN-07', 'P-0003', '04-JAN-07');
INSERT INTO Penyewaan VALUES ('S00'||seq_kode_sewa.NEXTVAL, '10-JAN-07', 'P-0004', '13-JAN-07');
INSERT INTO Penyewaan VALUES ('S00'||seq_kode_sewa.NEXTVAL, '15-JAN-07', 'P-0002', '01-FEB-07');
INSERT INTO Penyewaan VALUES ('S00'||seq_kode_sewa.NEXTVAL, '28-JAN-07', 'P-0005', '06-FEB-07');
INSERT INTO Penyewaan VALUES ('S00'||seq_kode_sewa.NEXTVAL, '04-FEB-07', 'P-0001', '07-FEB-07');


INSERT INTO detail_sewa
VALUES ('S001', 'A01');
INSERT INTO detail_sewa
VALUES ('S001', 'A02');
INSERT INTO detail_sewa
VALUES ('S002', 'D01');
INSERT INTO detail_sewa
VALUES ('S002', 'D02');
INSERT INTO detail_sewa
VALUES ('S003', 'D03');
INSERT INTO detail_sewa
VALUES ('S004', 'A01');
INSERT INTO detail_sewa
VALUES ('S004', 'A02');
INSERT INTO detail_sewa
VALUES ('S004', 'D03');
INSERT INTO detail_sewa
VALUES ('S004', 'H03');
INSERT INTO detail_sewa
VALUES ('S005', 'D03');
INSERT INTO detail_sewa
VALUES ('S005', 'H01');
INSERT INTO detail_sewa
VALUES ('S006', 'A03');
INSERT INTO detail_sewa
VALUES ('S006', 'D03');
INSERT INTO detail_sewa
VALUES ('S006', 'H03');

--3.	Buatlah sequence untuk Id_penyewa di Tabel Penyewa dan kode_sewa di table Penyewaan
CREATE SEQUENCE seq_id_penyewa
INCREMENT BY 1
START WITH 1
MAXVALUE 9999
NOCYCLE
NOCACHE;

CREATE SEQUENCE seq_kode_sewa
INCREMENT BY 1
START WITH 1
MAXVALUE 999
NOCYCLE
NOCACHE;

--4.	Buatlah Index Untuk Nama Penyewa dan judul Film
CREATE INDEX idx_nama_penyewa
ON Penyewa(nama);

CREATE INDEX idx_judul_film
ON Film(judul_film);

--5.	Buatlah View dengan nama V_LAMA dengan nama field No Sewa,  Nama Penyewa, Tgl Pinjam, Tgl Kembali, Lama Sewa
CREATE OR REPLACE VIEW V_LAMA AS
SELECT kode_sewa, nama, tgl_sewa, tgl_kembali, (tgl_kembali - tgl_sewa) AS lama_sewa
FROM penyewa P
JOIN penyewaan PN ON (P.id_penyewa = P.id_penyewa);

--6. Tampilkan Data Penyewa yang memiliki lama sewa lebih dari pada 4 hari
SELECT P.id_penyewa, P.nama, P.alamat, PW.tgl_sewa, PW.tgl_kembali, TRUNC(PW.tgl_kembali - PW.tgl_sewa) AS lama_sewa
FROM penyewa P
JOIN penyewaan PW ON (P.id_penyewa = PW.id_penyewa)
WHERE PW.tgl_kembali - PW.tgl_sewa > 4;

--7. Tampilkan Data Film yang paling sering di sewa

--8. Tampilkan Data Penyewa yang paling sering menyewa Film

--9. Tampilkan data penyewa yang menyewa di bulan February

--10. Tampilkan data film yang Tidak pernah di sewa
SELECT KODE_FILM FROM FILM
WHERE Kode_film NOT IN
	(SELECT Kode_film FROM detail_sewa)

--11. Buatlah query untuk menghapus tabel
DROP INDEX idx_nama_penyewa;
DROP INDEX idx_judul_film;

DROP SEQUENCE seq_id_penyewa;
DROP SEQUENCE seq_kode_sewa;

DROP TABLE film;
DROP TABLE penyewaan;
DROP TABLE penyewa;
DROP TABLE detail_sewa;
