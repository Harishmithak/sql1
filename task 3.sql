use db1
--create table employee
create table department(
deptid int primary key,
deptname varchar(20)
)

insert into department values(100,'developer'),(101,'ui/ux')
select * from department

--create table address

create table address(
addressid int primary key,
city varchar(20),
state varchar(30),
pincode int
)

insert into address values(1,'mannford','oklahomaa(ok)',74044),(2,'sidney','ohio(oh)',45365)

select * from address

--create table employee

create table employee(
id int primary key,
name varchar(20),
designation varchar(20),
dept_id int references department(deptid),
mobile1 bigint,
mobile2 bigint,
streetaddress varchar(30),
address_id int references address (addressid)

)

insert into employee values(1,'john','developer',100,9025457758,123456789,'243 hinton rd',1)
insert into employee(id,name,designation,dept_id,mobile1,streetaddress,address_id)values(2,'jamie','designer',101,9786657055,'214 dorley rd',2)
insert into employee values(3,'jack','developer',100,6383125860,362578951,'236 hinton rd',1)

select * from employee