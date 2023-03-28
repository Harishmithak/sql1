--Create a database for Library Management. Analyse the required columns, perform a normalization and link the tables
--using primary and foreign key (using on update set default)

CREATE DATABASE LM
USE LM

CREATE TABLE LIBRARY(
BOOKID INT PRIMARY KEY ,
BOOKS VARCHAR(20)
)

INSERT INTO LIBRARY VALUES(101,'WINGS'),(102,'HARRYPOTTER'),(103,'THE RIVER')

SELECT * FROM LIBRARY

CREATE TABLE STUDENTS(
BOOKID INT REFERENCES LIBRARY(BOOKID),
STUDENTNAME VARCHAR(20)
)

INSERT INTO STUDENTS VALUES(101,'POOJA'),(102,'JANI'),(103,'HARI')

SELECT * FROM STUDENTS



alter table STUDENTS  drop[FK__STUDENTS__BOOKID__37A5467C]

alter table STUDENTS drop column BOOKID

alter table STUDENTS add BOOKID int default 102 constraint FK_STUD_ID foreign key (BOOKID) references LIBRARY(BOOKID)  ON update set default


update STUDENTS set BOOKID=101 where STUDENTNAME='POOJA'
update STUDENTS set BOOKID=102 where STUDENTNAME='JANI'
update STUDENTS set BOOKID=145 where STUDENTNAME='HARI'


update LIBRARY set BOOKID=103 WHERE BOOKID=145
