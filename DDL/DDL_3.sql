CREATE SEQUENCE dept_deptid_seq
INCREMENT BY 10
START WITH 120
MAXVALUE 9999
NOCACHE
NOCYCLE;


-- NOCYCLE ➡️ TIDAK ADA PENGULANGAN
-- NOCACHE ➡️ TIDAK ADA PENYIMPANAN SEMENTARA

LATIHAN
    
CREATE TABLE Anggota (
    id_anggota char(5),
    nama_anggota varchar2(20),
    alamat_anggota varchar2(50)
);

CREATE TABLE Buku (
    kode_buku char(5),
    nama_buku varchar2(20),
    jenis_buku varchar2(20)
);

CREATE TABLE Pinjam (
    id_pinjam char(5),
    tanggal_pinjam date,
    jumlah_pinjam number(2,0),
    id_anggota char(5),
    kode_buku char(5)
);

ALTER TABLE Anggota ADD CONSTRAINT pk_id_anggota
PRIMARY KEY (id_anggota);

ALTER TABLE Buku ADD CONSTRAINT pk_kode_buku
PRIMARY KEY (kode_buku);

ALTER TABLE Pinjam ADD CONSTRAINT pk_id_pinjam
PRIMARY KEY (id_pinjam);

ALTER TABLE Pinjam ADD CONSTRAINT fk_id_anggota
FOREIGN KEY(id_anggota) REFERENCES Anggota(id_anggota);

ALTER TABLE Pinjam ADD CONSTRAINT fk_kode_buku
FOREIGN KEY(kode_buku) REFERENCES Buku(kode_buku);

INSERT INTO Anggota (id_anggota,nama_anggota,alamat_anggota) VALUES ('20230','Edwin Jhon','Rahayu X no 9');
INSERT INTO Anggota (id_anggota,nama_anggota,alamat_anggota) VALUES ('20231','Edlose','Rahayu X no 10');
INSERT INTO Anggota (id_anggota,nama_anggota,alamat_anggota) VALUES ('20232','Edseri','Rahayu X no 1');

INSERT INTO Buku (kode_buku,nama_buku,jenis_buku) VALUES ('c0001','Matematika','Pendidikan');
INSERT INTO Buku (kode_buku,nama_buku,jenis_buku) VALUES ('c0002','Weathering With You','Novel');
INSERT INTO Buku (kode_buku,nama_buku,jenis_buku) VALUES ('c0003','Alkitab','Agama');

INSERT INTO PINJAM (id_pinjam, tanggal_pinjam,jumlah_pinjam,id_anggota,kode_buku) VALUES (id_pinjam_seq.nextval,'12-JAN-2010','2','20230','c0001');
INSERT INTO PINJAM (id_pinjam, tanggal_pinjam,jumlah_pinjam,id_anggota,kode_buku) VALUES (id_pinjam_seq.nextval,'15-JAN-2010','1','20232','c0002');
INSERT INTO PINJAM (id_pinjam, tanggal_pinjam,jumlah_pinjam,id_anggota,kode_buku) VALUES (id_pinjam_seq.nextval,'15/JAN/2010','1','20232','c0002');
INSERT INTO PINJAM (id_pinjam, tanggal_pinjam,jumlah_pinjam,id_anggota,kode_buku) VALUES (id_pinjam_seq.nextval,'18-JAN-2010','1','20230','c0003');


DELETE from pinjam

SELECT*FROM Anggota;
SELECT*FROM Buku;
SELECT*FROM Pinjam
order by  id_pinjam;

CREATE SEQUENCE id_pinjam_seq
INCREMENT BY 1
START WITH 10000
MAXVALUE 99999
NOCACHE
NOCYCLE;
