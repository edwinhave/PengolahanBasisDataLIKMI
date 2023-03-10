create table customer (custno char(8),custfirstname varchar2(15),
   custlastname varchar2(15), custstreet varchar2(30),
   custcity varchar2(15), custstate char(2), custzip char(10),
   custbal number(6,2));
create table salesman (empno char(8), empfirstname varchar2(15),
   emplastname varchar2(15), empphone varchar2(20), empemail varchar2(25),
   supempno char(8), empcommrate number(4,2));
create table product (prodno char(8), prodname varchar2(35), prodmfg varchar2(20),
   prodqoh number(5), prodprice number(7,2));
create table morder (ordno char(8), orddate date, custno char(8),
   ordname varchar2(30), ordstreet varchar2(30), ordcity varchar2(15),
   ordstate char(2), ordzip char(10), empno char(8));
create table dorder (ordno char(8), prodno char(8), qty number(3));

alter table customer add constraint
   cust_custno_pk primary key(custno);

alter table salesman add constraint
   emp_empno_pk2 primary key(empno);

alter table product add constraint
   prod_prodno_pk primary key(prodno);

alter table morder add constraint
   mord_ordno_pk primary key(ordno);

alter table morder add constraint
   mord_custno_fk foreign key(custno) references customer(custno);

alter table morder add constraint
   mord_empno_fk foreign key(empno) references salesman(empno);

alter table dorder add constraint
   dord_ordno_pk primary key (ordno,prodno);

alter table dorder add constraint
   dord_ordno_fk foreign key(ordno) references morder(ordno);

alter table dorder add constraint
   dord_prodno_fk foreign key(prodno) references product(prodno);

Insert into customer (custno,custfirstname,custlastname,custstreet,custcity,custstate,custzip,custbal) values ('C0954327','Sheri','Gordon','336 Hill St.','Littleton','CO','80129-5543',230);
Insert into customer (custno,custfirstname,custlastname,custstreet,custcity,custstate,custzip,custbal) values ('C1010398','Jim','Glusmann','1432 E. Ravenna','Denver','CO','80111-0033',200);
Insert into customer (custno,custfirstname,custlastname,custstreet,custcity,custstate,custzip,custbal) values ('C2388597','Beth','Taylor','2396 Rafter Rd.','Seattle','WA','98103-1121',500);
Insert into customer (custno,custfirstname,custlastname,custstreet,custcity,custstate,custzip,custbal) values ('C3340959','Betty','Wise','4334 153rd NW','Seattle','WA','98178-3311',200);
Insert into customer (custno,custfirstname,custlastname,custstreet,custcity,custstate,custzip,custbal) values ('C3499503','Bob','Mann','1190 Lorraine Cir.','Monroe','WA','98013-1095',0);
Insert into customer (custno,custfirstname,custlastname,custstreet,custcity,custstate,custzip,custbal) values ('C8543321','Ron','Thompson','789 122nd St','Renton','WA','98666-1289',85);
Insert into customer (custno,custfirstname,custlastname,custstreet,custcity,custstate,custzip,custbal) values ('C8574932','Wally','Jones','411 Webber Ave','Seattle','WA','98105-1093',1500);
Insert into customer (custno,custfirstname,custlastname,custstreet,custcity,custstate,custzip,custbal) values ('C8654390','Candy','Kendall','456 Pine St.','Seattle','WA','98105-3345',50);
Insert into customer (custno,custfirstname,custlastname,custstreet,custcity,custstate,custzip,custbal) values ('C9128574','Jerry','Wyatt','16212 123rd Ct','Denver','CO','80222-0022',100);
Insert into customer (custno,custfirstname,custlastname,custstreet,custcity,custstate,custzip,custbal) values ('C9403348','Mike','Boren','642 Crest Ave','Englewood','CO','80113-5431',0);
Insert into customer (custno,custfirstname,custlastname,custstreet,custcity,custstate,custzip,custbal) values ('C9432910','Larry','Styles','9825 S. Crest Lane','Bellevue','WA','98104-2211',250);
Insert into customer (custno,custfirstname,custlastname,custstreet,custcity,custstate,custzip,custbal) values ('C9543029','Sharon','Johnson','1223 Meyer Way','Fife','WA','98222-1123',856);
Insert into customer (custno,custfirstname,custlastname,custstreet,custcity,custstate,custzip,custbal) values ('C9549302','Todd','Hayes','1400 NW 88th','Lynnwood','WA','98036-2244',0);
Insert into customer (custno,custfirstname,custlastname,custstreet,custcity,custstate,custzip,custbal) values ('C9857432','Homer','Wells','123 Main St.','Seattle','WA','98105-4322',500);
Insert into customer (custno,custfirstname,custlastname,custstreet,custcity,custstate,custzip,custbal) values ('C9865874','Mary','Hill','206 McCaffrey','Littleton','CO','80129-5543',150);
Insert into customer (custno,custfirstname,custlastname,custstreet,custcity,custstate,custzip,custbal) values ('C9943201','Harry','Sanders','1280 S. Hill Rd.','Fife','WA','98222-2258',1000);

Insert into product (prodno,prodname,prodmfg,prodQoh,prodprice) values ('P0036566','17 Inch Color Monitor','ColorMeg, Inc.',12,169);
Insert into product (prodno,prodname,prodmfg,prodQoh,prodprice) values ('P0036577','19 Inch Color Monitor','ColorMeg, Inc.',10,319);
Insert into product (prodno,prodname,prodmfg,prodQoh,prodprice) values ('P1114590','R3000 Color Laser Printer','Connex',5,699);
Insert into product (prodno,prodname,prodmfg,prodQoh,prodprice) values ('P1412138','10 Foot Printer Cable','Ethlite',100,12);
Insert into product (prodno,prodname,prodmfg,prodQoh,prodprice) values ('P1445671','8-Outlet Surge Protector','Intersafe',33,14.99);
Insert into product (prodno,prodname,prodmfg,prodQoh,prodprice) values ('P1556678','CVP Ink Jet Color Printer','Connex',8,99);
Insert into product (prodno,prodname,prodmfg,prodQoh,prodprice) values ('P3455443','Color Ink Jet Cartridge','Connex',24,38);
Insert into product (prodno,prodname,prodmfg,prodQoh,prodprice) values ('P4200344','36-Bit Color Scanner','UV Components',16,199.99);
Insert into product (prodno,prodname,prodmfg,prodQoh,prodprice) values ('P6677900','Black Ink Jet Cartridge','Connex',44,25.69);
Insert into product (prodno,prodname,prodmfg,prodQoh,prodprice) values ('P9995676','Battery Back-Up System','Cybercx',12,89);

Insert into salesman (empno,empfirstname,emplastname,empphone,empemail,supempno,empcommrate) values ('E1329594','Landi','Santos','303-789-1234','Lsantos@bigco.com','E8843211',0.02);
Insert into salesman (empno,empfirstname,emplastname,empphone,empemail,supempno,empcommrate) values ('E8544399','Joe','Jenkins','303-221-9875','Jjenkins@bigco.com','E8843211',0.02);
Insert into salesman (empno,empfirstname,emplastname,empphone,empemail,supempno,empcommrate) values ('E8843211','Amy','Tang','303-556-4321','Atang@bigco.com','E9884325',0.04);
Insert into salesman (empno,empfirstname,emplastname,empphone,empemail,supempno,empcommrate) values ('E9345771','Colin','White','303-221-4453','Cwhite@bigco.com','E9884325',0.04);
Insert into salesman (empno,empfirstname,emplastname,empphone,empemail,supempno,empcommrate) values ('E9884325','Thomas','Johnson','303-556-9987','Tjohnson@bigco.com','',0.05);
Insert into salesman (empno,empfirstname,emplastname,empphone,empemail,supempno,empcommrate) values ('E9954302','Mary','Hill','303-556-9871','Mhill@bigco.com','E8843211',0.02);
Insert into salesman (empno,empfirstname,emplastname,empphone,empemail,supempno,empcommrate) values ('E9973110','Theresa','Beck','303-320-2234','Tbeck@bigco.com','E9884325',0);

Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O1116324','23-Jan-2007','C0954327','E8544399','Sherri Gordon','336 Hill St.','Littleton','CO','80129-5543');
Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O1231231','23-Jan-2007','C9432910','E9954302','Larry Styles','9825 S. Crest Lane','Bellevue','WA','98104-2211');
Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O1241518','10-Feb-2007','C9549302','','Todd Hayes','1400 NW 88th','Lynnwood','WA','98036-2244');
Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O1455122','09-Jan-2007','C8574932','E9345771','Wally Jones','411 Webber Ave','Seattle','WA','98105-1093');
Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O1579999','05-Jan-2007','C9543029','E8544399','Tom Johnson','1632 Ocean Dr.','Des Moines','WA','98222-1123');
Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O1615141','23-Jan-2007','C8654390','E8544399','Candy Kendall','456 Pine St.','Seattle','WA','98105-3345');
Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O1656777','11-Feb-2007','C8543321','','Ron Thompson','789 122nd St.','Renton','WA','98666-1289');
Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O2233457','12-Jan-2007','C2388597','E9884325','Beth Taylor','2396 Rafter Rd.','Seattle','WA','98103-1121');
Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O2334661','14-Jan-2007','C0954327','E1329594','Mrs. Ruth Gordon','233 S. 166th','Seattle','WA','98103-1122');
Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O3252629','23-Jan-2007','C9403348','E9954302','Mike Boren','642 Crest Ave','Englewood','CO','80113-5431');
Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O3331222','13-Jan-2007','C1010398','','Jim Glussman','1432 E. Ravenna','Denver','CO','80111-0033');
Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O3377543','15-Jan-2007','C9128574','E8843211','Jerry Wyatt','16212 123rd Ct.','Denver','CO','80222-0022');
Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O4714645','11-Jan-2007','C2388597','E1329594','Beth Taylor','2396 Rafter Rd.','Seattle','WA','98103-1121');
Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O5511365','22-Jan-2007','C3340959','E9884325','Betty White','4334 153rd NW','Seattle','WA','98178-3311');
Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O6565656','20-Jan-2007','C9865874','E8843211','Mr. Jack Sibley','166 E 344th','Renton','WA','98006-5543');
Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O7847172','23-Jan-2007','C9943201','','Harry Sanders','1280 S. Hill Rd.','Fife','WA','98222-2258');
Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O7959898','19-Feb-2007','C8543321','E8544399','Ron Thompson','789 122nd St.','Renton','WA','98666-1289');
Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O7989497','16-Jan-2007','C3499503','E9345771','Bob Mann','1190 Lorraine Cir.','Monroe','WA','98013-1095');
Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O8979495','23-Jan-2007','C9865874','','Helen Sibley','206 McCaffrey','Renton','WA','98006-5543');
Insert into morder (ordno,orddate,custno,empno,ordname,ordstreet,ordcity,ordstate,ordzip) values ('O9919699','11-Feb-2007','C9857432','E9954302','Homer Wells','123 Main St.','Seattle','WA','98105-4322');

Insert into dorder (ordno,prodno, qty) values ('O1116324','P1445671',1);
Insert into dorder (ordno,prodno, qty) values ('O1231231','P0036566',1);
Insert into dorder (ordno,prodno, qty) values ('O1231231','P1445671',1);
Insert into dorder (ordno,prodno, qty) values ('O1241518','P0036577',1);
Insert into dorder (ordno,prodno, qty) values ('O1455122','P4200344',1);
Insert into dorder (ordno,prodno, qty) values ('O1579999','P1556678',1);
Insert into dorder (ordno,prodno, qty) values ('O1579999','P6677900',1);
Insert into dorder (ordno,prodno, qty) values ('O1579999','P9995676',1);
Insert into dorder (ordno,prodno, qty) values ('O1615141','P0036566',1);
Insert into dorder (ordno,prodno, qty) values ('O1615141','P1445671',1);
Insert into dorder (ordno,prodno, qty) values ('O1615141','P4200344',1);
Insert into dorder (ordno,prodno, qty) values ('O1656777','P1445671',1);
Insert into dorder (ordno,prodno, qty) values ('O1656777','P1556678',1);
Insert into dorder (ordno,prodno, qty) values ('O2233457','P0036577',1);
Insert into dorder (ordno,prodno, qty) values ('O2233457','P1445671',1);
Insert into dorder (ordno,prodno, qty) values ('O2334661','P0036566',1);
Insert into dorder (ordno,prodno, qty) values ('O2334661','P1412138',1);
Insert into dorder (ordno,prodno, qty) values ('O2334661','P1556678',1);
Insert into dorder (ordno,prodno, qty) values ('O3252629','P4200344',1);
Insert into dorder (ordno,prodno, qty) values ('O3252629','P9995676',1);
Insert into dorder (ordno,prodno, qty) values ('O3331222','P1412138',1);
Insert into dorder (ordno,prodno, qty) values ('O3331222','P1556678',1);
Insert into dorder (ordno,prodno, qty) values ('O3331222','P3455443',1);
Insert into dorder (ordno,prodno, qty) values ('O3377543','P1445671',1);
Insert into dorder (ordno,prodno, qty) values ('O3377543','P9995676',1);
Insert into dorder (ordno,prodno, qty) values ('O4714645','P0036566',1);
Insert into dorder (ordno,prodno, qty) values ('O4714645','P9995676',1);
Insert into dorder (ordno,prodno, qty) values ('O5511365','P1412138',1);
Insert into dorder (ordno,prodno, qty) values ('O5511365','P1445671',1);
Insert into dorder (ordno,prodno, qty) values ('O5511365','P1556678',1);
Insert into dorder (ordno,prodno, qty) values ('O5511365','P3455443',1);
Insert into dorder (ordno,prodno, qty) values ('O5511365','P6677900',1);
Insert into dorder (ordno,prodno, qty) values ('O6565656','P0036566',10);
Insert into dorder (ordno,prodno, qty) values ('O7847172','P1556678',1);
Insert into dorder (ordno,prodno, qty) values ('O7847172','P6677900',1);
Insert into dorder (ordno,prodno, qty) values ('O7959898','P1412138',5);
Insert into dorder (ordno,prodno, qty) values ('O7959898','P1556678',5);
Insert into dorder (ordno,prodno, qty) values ('O7959898','P3455443',5);
Insert into dorder (ordno,prodno, qty) values ('O7959898','P6677900',5);
Insert into dorder (ordno,prodno, qty) values ('O7989497','P1114590',2);
Insert into dorder (ordno,prodno, qty) values ('O7989497','P1412138',2);
Insert into dorder (ordno,prodno, qty) values ('O7989497','P1445671',3);
Insert into dorder (ordno,prodno, qty) values ('O8979495','P1114590',1);
Insert into dorder (ordno,prodno, qty) values ('O8979495','P1412138',1);
Insert into dorder (ordno,prodno, qty) values ('O8979495','P1445671',1);
Insert into dorder (ordno,prodno, qty) values ('O9919699','P0036577',1);
Insert into dorder (ordno,prodno, qty) values ('O9919699','P1114590',1);
Insert into dorder (ordno,prodno, qty) values ('O9919699','P4200344',1);

--DROP CONSTRAIN
DROP CONSTRAINT <namaConstraint>


--📢QUERY VIEW
--CREAT VIEW <nama_view> AS
--SELECT namafield from namatable

CREATE VIEW  Vcust_wa AS
SELECT*
FROM Customer
WHERE Custstate='WA';

--NAMA VIEW (HASIL)
SELECT * FROM Vcust_wa;

--MENAMPILKAN STRUKTUR VIEW
-- DESCRIBER <namaview>
DESCRIBE Vcust_wa;


--MENGUBAH VIEW
CREATE OR REPLACE VIEW  Vcust_wa AS
SELECT custno,custfirstname,custlastname,custstreet, custcity,custstate
FROM Customer
WHERE Custstate='WA';

--DROP VIEW 
DROP VIEW <namaview>


--📢INDEX
CREATE INDEX Cust_lastname_idx
ON Customer(custlastname)

--HAPUS INDEX
DROP INDEX <namaindex>
