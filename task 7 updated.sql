use db1
create table students(
s_id int primary key,
s_name varchar(25),
dept varchar(25),
score int
)

INSERT INTO students (s_id, s_name, dept, score) VALUES
(1, 'hari', 'bsc ct', 85),
(2, 'arun', 'bsc it', 92),
(3, 'haritha', 'bca', 76),
(4, 'dinesh', 'bca', 89),
(5, 'dinu', 'bca', 78),
(6, 'pooja', 'bsc it', 91),
(7, 'rani', 'bca', 84),
(8, 'paul', 'bsc it', 72),
(9, 'divya', 'bsc', 87),
(10, 'mark', 'bsc', 80),
(11, 'ziva', 'bca', 93),
(12, 'angelina', 'bca', 75),
(13, 'kavya', 'Sociology', 88),
(14, 'edwin', 'bsc ct', 82),
(15, 'john', 'bsc it', 79),
(16, 'lavanya', 'bsc', 86),
(17, 'Jack', 'bsc', 73),
(18, 'jaanu', 'bsc ct', 90),
(19, 'rajesh', 'bca', 77),
(20, 'priya', 'bsc it', 83),
(21, 'vivin', 'Management', 81),
(22, 'jani', 'bca', 74),
(23, 'ravi', 'bsc it', 85),
(24, 'lakshu', 'bsc ct', 89),
(25, 'premiya', 'bca', 76);

select * from students

-- Create a non-clustered index for department.

create index students_index on students(dept)

--Create a filtered index for department='BCA'

create index filter_students_index on students(dept) where dept='bca'

-- Create a view for students in BCA department.

create view studentsview as select * from students where dept='bca'

select * from studentsview

-- Apply Rank() for all the students based on score.

select s_id,s_name,dept,score,rank()over(order by score desc)as score_rank from students

--Apply Dense_Rank() for students in each department based on score.


select s_id,s_name,dept,score,rank()over(partition by dept order by score) as for_each_dep_rank from students

create table manager(
m_id int primary key,
m_name varchar(20)
)
insert into manager values(101,'ranita'),(102,'harish'),(103,'har'),(104,'priya'),(105,'saran')

create table emp(
e_id int primary key,
e_name varchar(20),
m_id int references manager(m_id),
e_dept varchar(20)
)



drop table manager
drop table emp

insert into emp values(1,'jim',101,'science'),(2,'jam',102,'bio'),(3,'juck',103,'science'),(4,'jimmy',104,'social')


--. Create a complex view by retrieving the records from Manager and Employee table.

create view manager_emp_view as select m.m_id,m.m_name,e.e_id,e.e_name,e.e_dept from manager as m inner join emp as e on m.m_id=e.m_id

select * from manager_emp_view

-- Show the working of 'on delete cascade on update set default' for the above tables

alter table emp drop [FK__emp__m_id__55F4C372]
alter table emp drop column m_id

alter table emp add m_id int default 102 constraint fk_emp_m_id foreign key(m_id) references manager(m_id) on delete cascade on update set default

update emp set m_id=101 where e_id=1
update emp set m_id=105 where e_id=2
update emp set m_id=102 where e_id=3
update emp set m_id=103 where e_id=4

delete from manager where m_id=103
update manager set m_id=100 where m_id=105


select * from manager
select * from emp


