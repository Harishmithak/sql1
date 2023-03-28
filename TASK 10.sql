create database task10
use task10

create table employees(EMPLOYEE_ID int ,
FIRST_NAME varchar(20), LAST_NAME varchar(20),
EMAIL varchar(20), PHONE_NUMBER bigint, HIRE_DATE date,
JOB_ID int ,SALARY int)

insert into employees values(1,'harishmitha','k','harish@gmail.com',9994519917,'2023-01-23',101,20000),
(2,'haritha','n','haritha@gmail.com',9995674895,'2022-01-23',102,25000),
(3,'ranita','n','ranita@gmail.com',7895467235,'2023-01-23',103,54000),
(4,'yamini','j','yamini@gmail.com',8300564043,'2023-01-23',104,15000),
(5,'selva','k','selva@gmail.com',8300564030,'2023-01-23',105,20000),
(6,'vignesh','r','vignesh@gmail.com',8300564030,'2023-01-23',106,20000),
(7,'dhanaprakash','d','dhana@gmail.com',7658945679,'2023-01-23',107,20000),
(8,'arun','a','arun@gmail.com',9997856897,'2023-01-23',108,20000),
(9,'venkat','v','venkat@gmail.com',9867549324,'2023-01-23',109,20000),
(10,'srikanth','s','srikanth@gmail.com',8654792323,'2023-01-23',110,20000),
(11,'priyadharshan','p','dharshan@gmail.com',98576486324,'2023-01-23',111,20000),
(12,'divyaprakash','d','divya@gmail.com',7896534567,'2023-01-23',112,20000),
(13,'hari','k','hari@gmail.com',9940796014,'2023-01-23',113,20000),
(14,'vikram','v','vikram@gmail.com',8675467945,'2023-01-23',114,20000),
(15,'vasanth','v','vasanth@gmail.com',8765934567,'2023-01-23',115,20000),
(16,'sharon','s','sharon@gmail.com',6789456734,'2023-01-23',116,20000),
(17,'hemanth','k','hemanth@gmail.com',9978567483,'2023-01-23',117,22000),
(18,'harshan','h','harshan@gmail.com',6789453647,'2023-01-23',118,25000),
(19,'sivabharath','s','siva@gmail.com',8300567845,'2023-01-23',119,34000),
(20,'karthikeyan','k','karthik@gmail.com',9994574734,'2023-01-23',120,32000)

select * from employees

--. Write a SQL query to find those employees who receive a higher salary than the employee with ID 16. Return first name, last name.

SELECT FIRST_NAME,LAST_NAME
FROM employees
WHERE salary > (SELECT SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID=16)

--Write a SQL query to find out which employees have the same HIRE_DATE as the employee whose ID is 11. Return first name, last name, job ID.
SELECT FIRST_NAME,LAST_NAME,JOB_ID
FROM employees
WHERE HIRE_DATE= (SELECT HIRE_DATE FROM EMPLOYEES WHERE EMPLOYEE_ID=11)

--Write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name.

select EMPLOYEE_ID,FIRST_NAME,LAST_NAME from
(select avg(SALARY) AS AVERAGE from EMPLOYEES) as A1, EMPLOYEES as E
where E.SALARY >A1.AVERAGE;

--Write a SQL query to find those employees who report to that manager whose first name is ‘’Yamini". Return first name, last name, employee ID and salary.

SELECT FIRST_NAME,LAST_NAME,EMPLOYEE_ID,SALARY FROM EMPLOYEES WHERE FIRST_NAME =(SELECT FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME='YAMINI')

-- Write a SQL query to find those employees whose salary falls within the range of the smallest salary and 2500. Return all the fields.

select * from employees where salary >=(select MIN(salary) from employees ) and SALARY<=35000