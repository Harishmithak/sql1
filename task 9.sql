use db1
select * from stud

--Write a Stored Procedure in SQL using conditional statements to search for a record from the students table (created in SQL Task 8) based on studentname column.

create PROCEDURE sp_Name
( @name varchar(50) )
AS
BEGIN
  IF((SELECT studentname FROM stud
  WHERE studentname = @name) = @name)
    BEGIN
	Print 'The student name is: '+@name 
    END
   ELSE
    BEGIN
	Print 'The student '+@name+' is not present'
    END
END

exec sp_Name 'pooja';

-- Write a Stored procedure in SQL to give remarks for the secured marks column in the students table (created in SQL Task 8) using CASE statement.

create PROCEDURE sp_case with encryption
AS
BEGIN
SELECT studentid,studentname,securedmarks,
CASE securedmarks
  WHEN '457' THEN 'good'
   WHEN '485' THEN ' verygood'
   WHEN '456' THEN 'good'
   WHEN '412' THEN 'good'
   WHEN '425' THEN 'good'

  
END AS 'remarks'
FROM stud;
END;

exec sp_case;


--Show the working of Table variables, temporary table, temporary stored procedures. (Both Local and Global)


--temporary table local 

create table #stude (studentid int , studentname varchar(20), semester varchar(20), securedmarks int, totalmarks int)
insert into #stude values(1,'harini','sem 5',457,500),(2,'pooja','sem 3',485,500),(3,'sita','sem 1',456,500),(4,'dinesh','sem 1',425,500),(5,'priya','sem 2',412,500)
select * from #stude

--temporary table global
create table ##stude (studentid int , studentname varchar(20), semester varchar(20), securedmarks int, totalmarks int)
insert into ##stude values(1,'harini','sem 5',457,500),(2,'pooja','sem 3',485,500),(3,'sita','sem 1',456,500),(4,'dinesh','sem 1',425,500),(5,'priya','sem 2',412,500)
select * from ##stude

--table variables local 
Declare @studen table (studentid int , studentname varchar(20), semester varchar(20), securedmarks int, totalmarks int)
insert into @studen values(1,'harini','sem 5',457,500),(2,'pooja','sem 3',485,500),(3,'sita','sem 1',456,500),(4,'dinesh','sem 1',425,500),(5,'priya','sem 2',412,500)
select * from @studen


--temporary stored procedures
--local
create procedure #stud
as
begin
print 'hai hello welcome'
end
exec #stud

--global

create procedure ##stud1
as
begin
print 'hai hello welcome!!!!'
end
exec ##stud1









