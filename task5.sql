use db1
--CREATING TABLE
CREATE TABLE Trainees1 (
TRAINEE_ID INT NOT NULL PRIMARY KEY,
FIRST_NAME CHAR(25),
LAST_NAME CHAR(25),
SALARY INT,
JOINING_DATE DATETIME,
DEPARTMENT CHAR(25)
);
--INSERTING VALUES

INSERT INTO Trainees1
(TRAINEE_ID, FIRST_NAME, LAST_NAME, SALARY,
JOINING_DATE, DEPARTMENT) VALUES
(002, 'Niharika', 'Verma', 80000, '2023-03-20', 'Admin'),
(003, 'Vishal', 'Singhal', 300000, '2023-03-20', 'HR'),
(004, 'Amitabh', 'Singh', 500000, '2023-03-20', 'Admin'),
(005, 'Vivek', 'Bhati', 500000, '2023-03-20', 'Admin'),
(006, 'Vipul', 'Diwan', 200000, '2023-03-20', 'Account'),
(007, 'Satish', 'Kumar', 75000, '2023-03-20', 'Account'),
(008, 'Geetika', 'Chauhan', 90000, '2023-03-20', 'Admin');

--DISPLAYING TABLE
select * from Trainees1

--to get the count of employees in each department.

SELECT COUNT(FIRST_NAME) as 'No of Employees',DEPARTMENT FROM Trainees1 GROUP BY DEPARTMENT;

--TO calculate the estimated induction program day for the trainees from 5 days from JOINING_DATE.

SELECT DATEADD(day, 5, '2023-03-20 ') AS INDUCTION_PROGRAM_DATE;

-- to retrieve the month in words from the Trainees table - JOINING_DATE Column

SELECT TRAINEE_ID,JOINING_DATE,
      CHOOSE(MONTH([JOINING_DATE]),'January','February','March','April','May','June',
      'July','August','September','October','November','December') AS month
  FROM Trainees1


  --to perform the total and subtotal of salary in each department.

    SELECT coalesce (DEPARTMENT, 'All Departments') AS Department,
  sum(salary) as totalsalary
  FROM Trainees1
  GROUP BY ROLLUP (DEPARTMENT)

  -- to retrieve first 3 records randomly.

  SELECT top 3  * from Trainees1 order by newid()

  --composite key with any example

  create table dept
(
id int IDENTITY (1,1),
Dept_id int,
Dept_name varchar(25),
constraint pk_id Primary Key(id),
constraint uk_id_name Unique (Dept_id,Dept_name)
);
insert into dept(Dept_id,Dept_name) values(100,'CA')
insert into dept(Dept_id,Dept_name) values(101,'IT')

SELECT * FROM dept
--CASE 
SELECT TRAINEE_ID,FIRST_NAME,salary,
CASE
    WHEN salary >= 50000 THEN 'Senior '
    WHEN salary >= 20000 THEN 'Junior '
    ELSE 'Trainee'
END AS ' Details'
FROM Trainees1;


--IIF
select * ,IIF(DEPARTMENT='HR','senior','junior') AS DEPTS from Trainees1

--SEQUENCE 
CREATE SEQUENCE [dbo].[SequenceObject]
AS INT
START WITH 1 
INCREMENT BY 1

CREATE TABLE EMPL
(
    Id INT PRIMARY KEY,
    Name NVARCHAR(50),
    Gender NVARCHAR(10)
);
select * from EMPL

INSERT INTO EMPL VALUES
(NEXT VALUE for [dbo].[SequenceObject], 'HARI', 'Male');
INSERT INTO EMPL VALUES
(NEXT VALUE for [dbo].[SequenceObject], 'DINU', 'Female')


--SYNONYM
create database t5
use t5
create synonym f for db1.dbo.Trainees1
select * from f

--IDENTITY INSERT

use db1
create table Dep
(
id int IDENTITY (1,1) primary key,
Dept_id int,
Dept_name varchar(25)
)

insert into Dep(Dept_id,Dept_name) values(1,'BCA'),(2,'IT'),(3,'CT')



SET IDENTITY_INSERT Dep off 

insert into Dep(Dept_id,Dept_name) values(4,'DS')

select * from Dep

SET IDENTITY_INSERT Dep on

insert into Dep(id,Dept_id,Dept_name) values(6,5,'AI')

