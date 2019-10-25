DROP TABLE PRODUCTTBL;
DROP TABLE MEMBERTBL;
DROP SEQUENCE IDSEQUENCE;

CREATE TABLE MEMBERTBL 
(
  MEMBERID CHAR(4) NOT NULL 
, MEMBERNAME NCHAR(5) NOT NULL 
, MEMBERADDRESS NVARCHAR2(20) 
, CONSTRAINT MEMBERTBL_PK PRIMARY KEY 
  (
    MEMBERID 
  )
  ENABLE 
);

CREATE TABLE PRODUCTTBL 
(
  PRODUCTNAME NCHAR(4) NOT NULL 
, MEMBERID CHAR(4) NOT NULL 
, PRICE NUMBER(7) NOT NULL 
, MADEDATE DATE 
, AMOUNT NUMBER(3) NOT NULL 
, CONSTRAINT PRODUCTTBL_PK PRIMARY KEY 
  (
    PRODUCTNAME 
  )
  ENABLE 
);

ALTER TABLE PRODUCTTBL
ADD CONSTRAINT PRODUCTTBL_FK1 FOREIGN KEY
(
  MEMBERID 
)
REFERENCES MEMBERTBL
(
  MEMBERID 
)
ENABLE;

CREATE SEQUENCE IDSEQUENCE;

INSERT INTO "TESTSHOP"."MEMBERTBL" (MEMBERID, MEMBERNAME, MEMBERADDRESS) VALUES ('KANG', N'������', '����� ���Ǳ� �Ÿ���');
INSERT INTO PRODUCTTBL (PRODUCTNAME, MEMBERID, PRICE, MADEDATE, AMOUNT) VALUES (N'��ǻ��', 'KANG', '100', TO_DATE('2018-02-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), '19');
