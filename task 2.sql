select * from Trainees
create table task2(
id int primary key,
name varchar(20)unique,
salary int check(salary>=10000),
increment int default '1000',
)
insert into task2 values(101,'rinu',23000,2000),
(102,'swetha',18000,1000),
(103,'nemo',45000,2500),
(104,'crystal',32000,3000),
(105,'sara',24000,1200)

select * from task2

--RENAMING 
create schema t1

create table t1.emp(
id int primary key,
name varchar(20)unique,
salary int check(salary>=10000),
increment int default '1000',
)
insert into t1.emp values(111,'anu',23000,2000),
(112,'narmatha',18000,1000),
(113,'ram',45000,2500),
(114,'riya',32000,3000),
(115,'saha',24000,1200)

select * from t1.emp

exec sp_renamedb 'database1','db1' --renaming database

create schema t2
alter schema t2 transfer t1.emp
drop schema t1
select * from t2.emp

--renaming table 
create table tb1(
id int primary key,
name varchar(20)unique,
salary int check(salary>=10000),
increment int default '1000',
)
EXEC sp_rename 'tb1','tb2'
select * from tb2

--identity ,computed
create table new(
id int  identity(1,1),
name varchar(20),
salary int ,
increment int,
)
insert into new(name,salary,increment) values ('John',10000,1000)
insert into new(name,salary,increment) values ('nivi',23000,1000)
insert into new(name,salary,increment) values ('sri',24000,1000)
insert into new(name,salary,increment) values ('apsana',30000,1000)
insert into new(name,salary,increment) values ('ruth',12000,1000)

select * from new

alter table new add revisedsalary as (salary+' '+increment) persisted
select * from new
select * into n2 from new where salary >20000
select * from n2
