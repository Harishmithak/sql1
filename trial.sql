use db1
select * from #stude

select * from ##stude

SELECT * FROM @STUDEN


Declare @@studen table (studentid int , studentname varchar(20), semester varchar(20), securedmarks int, totalmarks int)
insert into @@studen values(1,'harini','sem 5',457,500),(2,'pooja','sem 3',485,500),(3,'sita','sem 1',456,500),(4,'dinesh','sem 1',425,500),(5,'priya','sem 2',412,500)
select * from @@studen

exec #stud

exec ##stud1
