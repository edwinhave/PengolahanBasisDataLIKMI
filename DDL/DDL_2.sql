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




INSERT INTO Customer (
    Custno,
    CustFirstName,
    CustLastName,
    Custstreet,
    Custcity,
    CustState,
    CustZip,
    Custbal)
VALUES (
    'C0954327',
    'Sherri',
    'Gordon',
    '336 Hill St.',
	'Littleton',
    'CO',
    '80129-5543',
    '230'
)


INSERT INTO Customer (
    Custno,
    CustFirstName,
    CustLastName,
    Custstreet,
    Custcity,
    CustState,
    CustZip,
    Custbal)
VALUES (
    'C0954327',
    'Sherri',
    'Gordon',
    '336 Hill St.',
	'Littleton',
    'CO',
    '80129-5543',
    '230'
)

INSERT INTO Customer (
    Custno,
    CustFirstName,
    CustLastName,
    Custstreet,
    Custcity,
    CustState,
    CustZip,
    Custbal)
VALUES (
    'C1010398',
    'Jim',
    'Glussman',
	'1432 E. Ravenna',
    'Denver',
    'CO',
    '80111-0033',
    '200'
)

INSERT INTO Customer (
    Custno,
    CustFirstName,
    CustLastName,
    Custstreet,
    Custcity,
    CustState,
    CustZip,
    Custbal)
VALUES (
    'C2388597',
    'Beth',
    'Taylor',
	'2396 Rafter Rd',
    'Seattle',
    'WA',
    '98103-1121',
    '500'
)
SELECT * FROM Customer;

⬇️⬇️UPDATE
--1. Ubah nama customer nomor ‘C0954327’ menjadi ‘Sherry’
UPDATE Customer
SET CustFirstName = 'Sherri'
WHERE  Custno ='C0954327';

--2. Ubah saldo customer ‘Bob Mann’ menjadi 100
--3. Naikkan semua saldo 10% dari semula
--4. Kembalikan nilai saldo ke nilai semula

COMMIT

INSERT INTO Customer (
    Custno,
    CustFirstName)
VALUES (
    'C9999',
    'Edwin'
)



--SIMULASI SAVEPOINT
UPDATE  Customer 
SET custbal = custbal + 100;
EXEC SAVEPOINT naik100;

UPDATE  Customer 
SET custbal = custbal + 100;
EXEC SAVEPOINT naik200;

SELECT*FROM Customer;

UPDATE  Customer 
SET custbal = custbal + 100;

ROLLBACK TO SAVEPOINT naik200;
