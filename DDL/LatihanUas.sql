CREATE TABLE Film(
	Kode_film char(3),
	jenis varchar2(10),
	judul_film varchar2(25),
    jumlah number(1)
);

CREATE TABLE Penyewa(
	Id_penyewa char(1),
	jenis_identitas varchar2(15),
    nama varchar2(30),
    alamat varchar2(50)
);

CREATE TABLE Penyewaan(
    kode_sewa char(1),
    tgl_sewa date,
    id_penyewa char(4),
    tgl_kembali date
);

CREATE TABLE Detail_sewa(
    kode_sewa char(1),
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


INSERT INTO film (kode_film,jenis,judul_film,jumlah) values ('A01','Action','Spiderman','3');
INSERT INTO film (kode_film,jenis,judul_film,jumlah) values ('A02','Action','Spiderman 2','5');
INSERT INTO film (kode_film,jenis,judul_film,jumlah) values ('A03','Action','Juctice League','4');
INSERT INTO film (kode_film,jenis,judul_film,jumlah) values ('D01','Drama','Love Story','3');
INSERT INTO film (kode_film,jenis,judul_film,jumlah) values ('D02','Drama','Beauty and The Beast','5');
INSERT INTO film (kode_film,jenis,judul_film,jumlah) values ('D03','Drama','Remember Me','3');
INSERT INTO film (kode_film,jenis,judul_film,jumlah) values ('H01','Horror','Evil Death','2');
INSERT INTO film (kode_film,jenis,judul_film,jumlah) values ('H02','Horror','Conjuring','3');
INSERT INTO film (kode_film,jenis,judul_film,jumlah) values ('H03','Horror','Insidious','5');


INSERT INTO Penyewa(Id_penyewa,jenis_identitas,nama,alamat) values () 
CREATE TABLE Penyewa(
	Id_penyewa char(1),
	jenis_identitas varchar2(15),
    nama varchar2(30),
    alamat varchar2(50)
);
