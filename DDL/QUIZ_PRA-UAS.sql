1. Buatlah Tabel berdasarkan data di atas.(constraint dan tipe data tentukan sendiri)
CREATE TABLE PRODUCT (
    Kode_barang char(7),
    Nama_barang varchar2(25),
    Satuan varchar2(5),
    stock_barang number(3)
);

CREATE TABLE Customer (
    kode_customer char(5),
    nama_customer varchar2(20),
    alamat varchar2(50)
);

CREATE TABLE Sales (
    No_transaksi char(7),
    tanggal_transaksi date,
    kode_customer char(5)
);

CREATE TABLE Sales_Detail(
    No_transaksi char(7),
    kode_barang char(7),
    jumlah_barang number(3),
    harga_jual number(6),
    disc number(4,3)
);


ALTER TABLE Product ADD CONSTRAINT pk_kode_barang
PRIMARY KEY (kode_barang);

ALTER TABLE Customer ADD CONSTRAINT pk_customer
PRIMARY KEY (kode_customer);

ALTER TABLE Sales ADD CONSTRAINT pk_no_transaksi
PRIMARY KEY (No_transaksi);

ALTER TABLE Sales_Detail ADD CONSTRAINT pk_notrans_kodbrg
PRIMARY KEY (No_transaksi,kode_barang);

ALTER TABLE Sales add constraint fk_kode_customer
foreign key(kode_customer) references customer(kode_customer);

ALTER TABLE Sales_Detail add constraint fk_no_transaksi
foreign key(no_transaksi) references sales(no_transaksi);

ALTER TABLE Sales_Detail add constraint fk_kode_barang
foreign key(kode_barang) references product(kode_barang);

-- 2. Isilah data ke dalam table yang anda buat.
INSERT INTO PRODUCT VALUES('SBN0001','SABUN LUX','pcs','100');
INSERT INTO PRODUCT VALUES('SBN0002','SABUN Lifeboy','pcs','75');
INSERT INTO PRODUCT VALUES('SKT0001','Sikat Gigi Formula','pcs','50');
INSERT INTO PRODUCT VALUES('SKT0002','Sikat Gigi Pepsodent','pcs','75');
INSERT INTO PRODUCT VALUES('PST0001','Pasta Gigi Close Up ','pcs','75');
INSERT INTO PRODUCT VALUES('PST0002','Pasta Gigi Pepsodent ','pcs','150');
INSERT INTO PRODUCT VALUES('PST0003','Pasta Gigi Formula ','pcs','50');
INSERT INTO PRODUCT VALUES('KPR0001','Kapur Barus','pack','25');
INSERT INTO PRODUCT VALUES('SKL0001','So Klin Pembersih','sch','50');
INSERT INTO PRODUCT VALUES('SHM0001','Shampo Dove','btl','50');
INSERT INTO PRODUCT VALUES('SHM0002','Shampo Rejoice','btl','100');
INSERT INTO PRODUCT VALUES('SHM0003','Shampo Sunsilk','btl','25');
INSERT INTO PRODUCT VALUES('SHM0004','Shampo Lifebouy','btl','75');
SELECT * FROM PRODUCT

INSERT INTO Customer VALUES('C'||LPAD(seq_kode_customer.NEXTVAL, 4, '0'),'Susi','Jl. Melati 211');
INSERT INTO Customer VALUES('C'||LPAD(seq_kode_customer.NEXTVAL, 4, '0'),'Budi','Jl. Anggrek 14');
INSERT INTO Customer VALUES('C'||LPAD(seq_kode_customer.NEXTVAL, 4, '0'),'Wati','Jl. Pasir Kaliki 18');
INSERT INTO Customer VALUES('C'||LPAD(seq_kode_customer.NEXTVAL, 4, '0'),'Iwan','Jl. Cibadak 30');
INSERT INTO Customer VALUES('C'||LPAD(seq_kode_customer.NEXTVAL, 4, '0'),'Santi','Jl. Astana Anyar 80');
SELECT*FROM Customer;

INSERT INTO Sales VALUES ('JL-'||LPAD(seq_no_transaksi.NEXTVAL, 4, '0'), '21-FEB-02', 'C0001');
INSERT INTO Sales VALUES ('JL-'||LPAD(seq_no_transaksi.NEXTVAL, 4, '0'), '21-FEB-02', 'C0002');
INSERT INTO Sales VALUES ('JL-'||LPAD(seq_no_transaksi.NEXTVAL, 4, '0'), '21-FEB-02', 'C0003');
INSERT INTO Sales VALUES ('JL-'||LPAD(seq_no_transaksi.NEXTVAL, 4, '0'), '21-FEB-02', 'C0004');
INSERT INTO Sales VALUES ('JL-'||LPAD(seq_no_transaksi.NEXTVAL, 4, '0'), '22-FEB-02', 'C0001');
INSERT INTO Sales VALUES ('JL-'||LPAD(seq_no_transaksi.NEXTVAL, 4, '0'), '22-FEB-02', 'C0005');
INSERT INTO Sales VALUES ('JL-'||LPAD(seq_no_transaksi.NEXTVAL, 4, '0'), '22-FEB-02', 'C0004');
INSERT INTO Sales VALUES ('JL-'||LPAD(seq_no_transaksi.NEXTVAL, 4, '0'), '22-FEB-02', 'C0002');
INSERT INTO Sales VALUES ('JL-'||LPAD(seq_no_transaksi.NEXTVAL, 4, '0'), '23-FEB-02', 'C0005');
INSERT INTO Sales VALUES ('JL-'||LPAD(seq_no_transaksi.NEXTVAL, 4, '0'), '23-FEB-02', 'C0004');
select*from sales

INSERT INTO Sales_Detail VALUES ('JL-0001','SBN0002',6,12000,2.5);
INSERT INTO Sales_Detail VALUES ('JL-0001','SHM0002',5,12500,2.5);
INSERT INTO Sales_Detail VALUES ('JL-0001','PST0003',2,11000,0);
INSERT INTO Sales_Detail VALUES ('JL-0002','KPR0001',2,10000,0);
INSERT INTO Sales_Detail VALUES ('JL-0002','SHM0001',1,13000,0);
INSERT INTO Sales_Detail VALUES ('JL-0003','SKL0001',1,15000,0);
INSERT INTO Sales_Detail VALUES ('JL-0004','SKL0001',5,14500,2.5);
INSERT INTO Sales_Detail VALUES ('JL-0004','SBN0001',5,14500,2.5);
INSERT INTO Sales_Detail VALUES ('JL-0004','SKT0001',5,15000,2.5);
INSERT INTO Sales_Detail VALUES ('JL-0004','SKL0002',5,12500,2.5);
INSERT INTO Sales_Detail VALUES ('Jl-0005','SHM0004',3,15000,0);
INSERT INTO Sales_Detail VALUES ('Jl-0006','PST0002',10,10500,2.5);
INSERT INTO Sales_Detail VALUES ('Jl-0007','SHM0002',15,12000,5);
INSERT INTO Sales_Detail VALUES ('Jl-0008','SHM0003',3,15000,0);
INSERT INTO Sales_Detail VALUES ('Jl-0008','SHM0004',4,15000,0);
INSERT INTO Sales_Detail VALUES ('Jl-0009','SKL0001',10,12500,2.5);
INSERT INTO Sales_Detail VALUES ('Jl-0009','SBN0001',10,13000,2.5);
INSERT INTO Sales_Detail VALUES ('Jl-0009','KPR0001',10,9500,2.5);
INSERT INTO Sales_Detail VALUES ('Jl-0009','SHM0002',5,15000,2.5);
INSERT INTO Sales_Detail VALUES ('Jl-0009','SBN0001',5,14500,2.5);


SELECT*FROM SALES_DETAIL
-- 3.Buatlah index untuk nama produk dan nama customer.
CREATE INDEX idx_nama_product
ON Product(nama_barang);

CREATE INDEX idx_nama_customer
ON Customer(nama_customer);

-- 4. Buatlah seq untuk customer dan sales
CREATE SEQUENCE seq_kode_customer
INCREMENT BY 1
START WITH 1
MAXVALUE 9999
NOCYCLE
NOCACHE;

CREATE SEQUENCE seq_no_transaksi
INCREMENT BY 1
START WITH 1
MAXVALUE 9999
NOCYCLE
NOCACHE;

--5.Buatlah view dengan nama penjualan master yang berisikan kolom kode customer, nama customer, total penjualan
CREATE VIEW Penjualan_master AS
SELECT S.kode_customer, C.nama_customer, SUM((SA.harga_jual - (SA.harga_jual * SA.disc / 100)) * SA.jumlah_barang) AS Total_penjualan
FROM sales S
JOIN customer C ON (S.kode_customer = C.kode_customer)
JOIN sales_detail SA ON (S.no_transaksi = SA.no_transaksi)
GROUP BY S.kode_customer, C.nama_customer;
    
