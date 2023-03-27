
use db1
--create table
create table stud (studentid int identity(1,1), studentname varchar(20), semester varchar(20), securedmarks int, totalmarks int)

--insert rows
insert into stud values('harini','sem 5',457,500),('pooja','sem 3',485,500),('sita','sem 1',456,500),('dinesh','sem 1',425,500),('priya','sem 2',412,500)

select * from stud

--Create User-define Scalar function to calculate percentage of all students after creating the following table.

create  function calper(@mark int,@totalmarks int)
returns int
as
begin
declare @per int
set @per=((@mark * 100)/@totalmarks)
return @per
end

--function call
select   dbo.calper(securedmarks,totalmarks)  as percentage  from  stud;

-- Create user-defined function to generate a table that contains result of Sem 1 students.

create function semres(@sem varchar(20))
returns table
as
return (select * from dbo.stud where semester = @sem)
--function call
select * from semres('sem 1');

--Write SQL stored procedure to retrieve all students details. (No parameters)

create procedure sp_std_details
as
begin
select * from stud;
end
--procedure execution
exec sp_std_details


--Write SQL store procedure to display Sem 1 students details. (One parameter)
create procedure sp_std_details2(@semresult varchar(20))
as
begin
select * from stud where (semester = @semresult )
end

exec sp_std_details2'sem 2';

--Write SQL Stored Procedure to retrieve total number of students details. (OUTPUT Parameter)

create procedure sp_stud_details3(@semres varchar(20) output)
AS
BEGIN
select COUNT(STUDENTID)AS TOTAL_STUDENTS FROM stud
end

declare @total int
exec sp_stud_details3 @total output
print @total

--Show the working of Merge Statement by creating a backup for the students details of only students in Sem 1.
create table stud_backup (studentid int , studentname varchar(20), semester varchar(20), securedmarks int, totalmarks int)



MERGE STUD_BACKUP B
USING (SELECT * FROM STUd WHERE SEMESTER='SEM 1') AS S
ON(S.STUDENTID=B.STUDENTID)
WHEN MATCHED 
THEN UPDATE SET 
B.STUDENTNAME=S.STUDENTNAME
WHEN NOT MATCHED BY TARGET 
THEN INSERT(STUDENTID,STUDENTNAME,SEMESTER,SECUREDMARKS,TOTALMARKS)
VALUES(S.STUDENTID,S.STUDENTNAME,S.SEMESTER,S.SECUREDMARKS,S.TOTALMARKS)
WHEN NOT MATCHED BY SOURCE
THEN DELETE;

SELECT * FROM stud_backup
