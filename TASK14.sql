CREATE DATABASE TASK141
USE TASK141

--1)Create a table Hobbies (HobbyID(pk), HobbyName(uk)) 
--1. insert records into the table using a stored procedure.
--2. insert duplicate records into the table and show the working of exception handling using Try/catch blocks.
--3. Store the error details in an errorbackup table.

create table hobbies
(hobby_id int primary key,
hobby_name varchar(20) unique)

--procedure inserthobby
CREATE PROCEDURE InsertHobby1
@hobby_id varchar(20),
    @Hobby_Name VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Hobbies (hobby_id , hobby_name) VALUES (@hobby_id , @Hobby_Name);
END

BEGIN TRY
    EXEC InsertHobby1 1,'Reading';
    EXEC InsertHobby1 5,'Gardening';
    EXEC InsertHobby1 5,'reading';
    EXEC InsertHobby1 4,'Reading';

   
END TRY
BEGIN CATCH
    PRINT 'Error Message: ' + ERROR_MESSAGE();
    PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR);
    PRINT 'Error Severity: ' + CAST(ERROR_SEVERITY() AS VARCHAR);
    PRINT 'Error State: ' + CAST(ERROR_STATE() AS VARCHAR);
    PRINT 'Error Line: ' + CAST(ERROR_LINE() AS VARCHAR);
    PRINT 'Error Procedure: ' + CAST(ERROR_PROCEDURE() AS VARCHAR);
   
    -- Storing the error details in the ErrorBackup table
    INSERT INTO  errorbackup (ErrorMessage, ErrorNumber, ErrorSeverity, ErrorState, ErrorLine, ErrorProcedure)
    VALUES (ERROR_MESSAGE(), ERROR_NUMBER(), ERROR_SEVERITY(), ERROR_STATE(), ERROR_LINE(), ERROR_PROCEDURE());
END CATCH

--table errorbackup
CREATE TABLE ErrorBackup (
    ErrorBackupID INT IDENTITY(1,1) PRIMARY KEY,
    ErrorMessage VARCHAR(MAX),
    ErrorNumber INT,
    ErrorSeverity INT,
    ErrorState INT,
    ErrorLine INT,
    ErrorProcedure VARCHAR(100),
    ErrorDateTime DATETIME DEFAULT GETDATE()
);

select * from hobbies

select * from ErrorBackup

--2) Create a procedure to accept 2 numbers, if the numbers are equal then calculate the product else use RAISERROR to show the working of exception handling.


create procedure CAL

@num1 int,
@num2 int
as
begin
  if @num1=@num2
  begin
  declare
  @product int
  set @product =@num1 * @num2;
  print 'the product of ' +(cast(@num1 as varchar)) +'and '+(cast(@num2 as varchar))+'is'+(cast(@product as varchar));
  end
  else
  begin
  declare @errormessage varchar(500)='The numbers '+(cast(@num1 as varchar))+'and'+(cast(@num2 as varchar))+'are not not equal';
  Raiserror(@errormessage,16,1);
  end
  end

  exec CAL 2,5

  --3)Create a table Friends(id(identity), name (uk)) and insert records into the table using a stored procedure.
    
	create table friends(
name varchar(50))
ALTER procedure friends1
@name varchar(25)
as
begin
if LEFT(@name ,1) in (' A','D','H','K','P','R','S','T','V','Y')
begin
insert into friends values(@name)
end
else
begin
throw 50002,'name must begin only  with A,D,H,K,P,R,S,T,V,Y ',1;
end
end

EXEC friends1 'MADHU';

SELECT * FROM friends
