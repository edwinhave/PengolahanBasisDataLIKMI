--CREATE TABLE
CREATE TABLE Customer
	(Custno char(8),
    CustFirstname Varchar2(15),
    CustLastname Varchar2(15),
    CustStreet Varchar2(30),
    CustCity Varchar2(15),
    CustState Char(2),
    CustZip Char(10),
    CustBal Number(6,2));

--DROP
DROP TABLE Customer

--DESCRIBE digunakan untuk mendeskripsikan struktur sebuah tabel.
describe Customer;

ALTER TABLE Customer ADD Telepon varchar2(15); 
describe Customer;

ALTER TABLE Customer MODIFY Telepon varchar2(12); 
describe Customer;

ALTER TABLE Customer RENAME COLUMN Telepon TO NoTelp; 
describe Customer;

ALTER TABLE Customer DROP COLUMN NoTelp; 
describe Customer;

ALTER TABLE Customer
    ADD CONSTRAINT custno_pk PRIMARY KEY(custno);
describe Customer;

SELECT * FROM user_constraints 
WHERE table_name='CUSTOMER';

--MENGHAPUS CONSTRAINT 
--HARUS HAPAL NAMA CONSTRAINT

ALTER TABLE <nama_Tabel> DROP constraint <nama_constraint>


⬇️⬇️⬇️⬇️⬇️
LATIHAN MEMBUAT TABLE

CREATE TABLE Customer(
    Custno char(8),
    CustFirstname Varchar2(15),
    CustLastname Varchar2(15),
    CustStreet Varchar2(30),
    CustCity Varchar2(15),
    CustState Char(2),
    CustZip Char(10),
    CustBal Number(6,2));

ALTER TABLE Customer
    ADD CONSTRAINT custno_pk PRIMARY KEY(custno);
describe Customer;


CREATE TABLE Salesman(
    EmpNo Char(8) CONSTRAINT sal_empno_pk PRIMARY KEY,
    EmpFirstName Varchar2(15),
    EmpLastName Varchar2(15),
    EmpPhone Varchar2(20),
    EmpEmail Varchar2(25),
    SupEmpNo Char(8),
    EmpCommrate Number(4,2)
    );
describe Salesman;

CREATE TABLE Product(
    ProdNo char(8) CONSTRAINT prod_prodno_PK PRIMARY KEY,
    ProdName Varchar2(35),
    ProdMfg Varchar2(20),
    ProdQOH Number(5),
    ProdPrice Number(7,2)
    );
describe Product;

CREATE TABLE MOrder(
  	OrderNo char(8) CONSTRAINT mo_orderno_pk PRIMARY KEY,
    OrderDate Date,
    Custno char(8),
    OrdName Varchar2(30),
    OrdStreet Varchar2(30),
    OrdtCity Varchar2(15),
    OrdState Char(2),
    OrdZip Char(10),
    EmpNo Char(8)
);
describe MOrder;

CREATE TABLE DOrder(
    OrderNo Char(8),
    ProdNo Char(8),
    QTY Number(3)
);

ALTER TABLE DOrder
    ADD CONSTRAINT do_orderno_prodno_pk PRIMARY KEY(Prodno,OrderNo);
describe DOrder;

ALTER TABLE DOrder ADD CONSTRAINT ordno_fk
FOREIGN KEY(OrderNo) REFERENCES MOrder(OrderNo);



SELECT * FROM user_constraints
    where table_name='DORDER';

Describe DOrder;
Describe MOrder;
Describe Product;
Describe Salesman;
Describe Customer;