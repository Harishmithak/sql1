create database task15
use task15

create table student
(
s_id int primary key,
sname varchar(20),
dept varchar(20),
yoc int
)

--auto commit

insert into student values
(1, 'ranita', 'bscct', 2022),
(2, 'harita', 'bscct', 2022),
(3, 'harishmitha', 'bscct', 2022)


select * from student

--auto rollback

insert into student values(1,'pooja','bsc')

---2---
--implicit transactions

set implicit_transactions on
insert into student values(4, 'san', 'bscit', 2023)
select iif(@@OPTIONS & 2=2,'implicit on','implicit off') as implicit_on_off
select @@TRANCOUNT as trancount
commit
select @@TRANCOUNT as next_trancount
set implicit_transactions off

select * from student

---3----
--explicit

--insert commit

begin tran
insert into student values(7, 'priya', 'bscit', 2023)
select @@TRANCOUNT as trancount
commit
select @@TRANCOUNT as next_trancount

select * from student

--rollback update

begin tran
update student set dept='bca' where s_id='24'
select * from student
rollback tran
select * from student

--savepoint -> update,insert
--rollback -> delete

begin tran
insert into student values(8, 'yamini', 'bca', 2023),(9, 'harish', 'bscit', 2023)
update student set dept='bca' where s_id=27
select * from student

save transaction insert_update
select * from student

delete from  student where s_id='8'
select * from student
rollback tran insert_update

select * from student
