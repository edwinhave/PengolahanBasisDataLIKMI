©Copyright by Edwin Jhon V.S


CREATE TABLE Mobil(
    mobil_id char(5),
    mobil_merk varchar2(20),
    mobil_plat varchar2(10),
    mobil_warna varchar2(15),
    mobil_tahun date,
    mobil_status varchar2(20)
);

CREATE TABLE Kostumer(
    kostumer_id char(5),
    kostumer_nama varchar2(20),
    kostumer_alamat varchar2(50),
    kostumer_jk varchar2(1),
    kostumer_hp varchar2(15),
	kostumer_ktp char(16)
);

CREATE TABLE Transaksi(
    transaksi_id char(5),
    transaksi_karyawan varchar2(5),
    transaksi_kostumer char(5),
    transaksi_mobil char(5),
    transaksi_tgl_pinjam date,
    transaksi_tgl_kembali date,
    transaksi_harga number(14),
    transaksi_denda number(14),
    transaksi_tgl date,
    transaksi_totaldenda number(14),
    transaksi_status varchar2(20),
    transaksi_tgldikembalikan date
);

ALTER TABLE Mobil ADD CONSTRAINT pk_mobil_id
PRIMARY KEY (mobil_id);

ALTER TABLE Kostumer ADD CONSTRAINT pk_kostumer_id
PRIMARY KEY (kostumer_id);

ALTER TABLE Transaksi ADD CONSTRAINT pk_transaksi
PRIMARY KEY (transaksi_id);

ALTER TABLE Transaksi ADD CONSTRAINT fk_tf_mobil
FOREIGN KEY(transaksi_mobil) REFERENCES mobil(mobil_id);

ALTER TABLE Transaksi ADD CONSTRAINT fk_tf_kostumer
FOREIGN KEY(transaksi_kostumer) REFERENCES kostumer(kostumer_id);


INSERT INTO Mobil (mobil_id,mobil_merk,mobil_plat,mobil_warna,mobil_tahun,mobil_status) VALUES('C0001','Civic','A 111 BC','Biru','01-JAN-2022','Dalam Perawatan');
INSERT INTO Mobil (mobil_id,mobil_merk,mobil_plat,mobil_warna,mobil_tahun,mobil_status) VALUES('C0002','Civic Type R','A 222 S','Biru','01-JAN-2023','Baik');
INSERT INTO Mobil (mobil_id,mobil_merk,mobil_plat,mobil_warna,mobil_tahun,mobil_status) VALUES('C0003','Honda NSX S','B 333 AD','Biru','01-NOV-2022','Baik');
INSERT INTO Mobil (mobil_id,mobil_merk,mobil_plat,mobil_warna,mobil_tahun,mobil_status) VALUES('C0004','Redbull Honda NSX S','B 444 AD','Biru','01-NOV-2021','Baik');
INSERT INTO Mobil (mobil_id,mobil_merk,mobil_plat,mobil_warna,mobil_tahun,mobil_status) VALUES('C0005','Redbull Alphatauri','B 555 AD','Abu abu','01-NOV-2021','Baik');

INSERT INTO Kostumer (kostumer_id,kostumer_nama,kostumer_alamat,kostumer_jk,kostumer_hp,kostumer_ktp) VALUES('H0001','Edwin','Rahayu X no 9','L','085211198925','1234123412341234');
INSERT INTO Kostumer (kostumer_id,kostumer_nama,kostumer_alamat,kostumer_jk,kostumer_hp,kostumer_ktp) VALUES('H0002','Irenna','Gang Pesanteren Pagarasih no 25','P','082218191163','432143214321');
INSERT INTO Kostumer (kostumer_id,kostumer_nama,kostumer_alamat,kostumer_jk,kostumer_hp,kostumer_ktp) VALUES('H0003','Edmenang','Rahayu X no 10','L','081322500185','0000111122223333');
INSERT INTO Kostumer (kostumer_id,kostumer_nama,kostumer_alamat,kostumer_jk,kostumer_hp,kostumer_ktp) VALUES('H0004','Edkalah','Rahayu X no 12','L','082115093509','9999888877776666');
INSERT INTO Kostumer (kostumer_id,kostumer_nama,kostumer_alamat,kostumer_jk,kostumer_hp,kostumer_ktp) VALUES('H0005','Edseimbang','Rahayu X no 9','L','082218710007','8765876587658765');

SELECT*FROM MOBIL;
SELECT*FROM KOSTUMER;

CREATE INDEX idx_mobil_merk
ON Mobil(mobil_merk);

CREATE INDEX idx_kostumer_nama
ON Kostumer(kostumer_nama);

CREATE SEQUENCE transaksi_seq
INCREMENT BY 1
START WITH 10000
MAXVALUE 99999
NOCACHE
NOCYCLE;

INSERT INTO TRANSAKSI (transaksi_id,transaksi_karyawan,transaksi_kostumer,transaksi_mobil,transaksi_tgl_pinjam,transaksi_tgl_kembali,transaksi_harga,transaksi_denda,transaksi_tgl,transaksi_totaldenda,transaksi_status,transaksi_tgldikembalikan) VALUES (transaksi_seq.nextval,'Dodo','H0001','C0005','01-JAN-2023','03-JAN-2023','100000000','0','01-JAN-2023','0','Baik','04-JAN-2023');
INSERT INTO TRANSAKSI (transaksi_id,transaksi_karyawan,transaksi_kostumer,transaksi_mobil,transaksi_tgl_pinjam,transaksi_tgl_kembali,transaksi_harga,transaksi_denda,transaksi_tgl,transaksi_totaldenda,transaksi_status,transaksi_tgldikembalikan) VALUES (transaksi_seq.nextval,'Doda','H0002','C0004','10-FEB-2023','13-FEB-2023','300000000','0','01-JAN-2023','0','Baik','04-JAN-2023');
INSERT INTO TRANSAKSI (transaksi_id,transaksi_karyawan,transaksi_kostumer,transaksi_mobil,transaksi_tgl_pinjam,transaksi_tgl_kembali,transaksi_harga,transaksi_denda,transaksi_tgl,transaksi_totaldenda,transaksi_status,transaksi_tgldikembalikan) VALUES (transaksi_seq.nextval,'Dode','H0003','C0003','15-MAR-2023','20-FEB-2023','400000000','0','01-JAN-2023','0','Baik','04-JAN-2023');
INSERT INTO TRANSAKSI (transaksi_id,transaksi_karyawan,transaksi_kostumer,transaksi_mobil,transaksi_tgl_pinjam,transaksi_tgl_kembali,transaksi_harga,transaksi_denda,transaksi_tgl,transaksi_totaldenda,transaksi_status,transaksi_tgldikembalikan) VALUES (transaksi_seq.nextval,'Dodi','H0004','C0002','20-MAY-2023','25-MAY-2023','200000000','0','01-JAN-2023','0','Baik','04-JAN-2023');
INSERT INTO TRANSAKSI (transaksi_id,transaksi_karyawan,transaksi_kostumer,transaksi_mobil,transaksi_tgl_pinjam,transaksi_tgl_kembali,transaksi_harga,transaksi_denda,transaksi_tgl,transaksi_totaldenda,transaksi_status,transaksi_tgldikembalikan) VALUES (transaksi_seq.nextval,'Dodu','H0005','C0001','25-JUN-2023','30-JUN-2023','50000000','0','01-JAN-2023','0','Baik','04-JAN-2023');

SELECT*FROM TRANSAKSI


CREATE VIEW  nota_transaksi AS
SELECT T.transaksi_id AS ID_TRANSAKSI, K.kostumer_nama AS NAMA_KOSTUMER, A.MOBIL_MERK AS MEREK_MOBIL, T.transaksi_tgl_pinjam AS TANGGAL_PINJAM, T.transaksi_tgl_kembali AS TANGGAL_KEMBALI
FROM transaksi T
JOIN kostumer K ON (T.transaksi_kostumer = K.kostumer_id)
JOIN mobil A ON (T.transaksi_mobil = A.mobil_id);

SELECT*FROM nota_transaksi;
