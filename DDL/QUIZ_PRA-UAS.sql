CREATE TABLE Product (
    Kode_Barang char (7),
    Nama_Barang varchar2 (30),
    Satuan varchar2 (4),
    Stock_Barang number (3));

CREATE TABLE  Customer(
    Kode_customer char (5),
    Nama_customer varchar2 (25),
    Alamat varchar (25));

CREATE TABLE Sales (
    No_transaksi char(7),
    Tgl_transaksi date,
    Kode_costumer char (5));

CREATE TABLE Sales_Detail (
    No_Transaksi char (7),
    Kode_Barang char (7),
    Jumlah_barang number (3),
    Harga_jual number (6),
    Disc number (1,3));
