create database task12
use task12

--employee table
create table employee(
id int primary key,
first_name varchar(255),
last_name varchar(255)
)

--calloutcome table 
create table call_outcome(
id int primary key,
outcome_text char(128)
)

--country table

create table country(
id int primary key,
country_name char(128),
country_name_eng char(128),
country_code char(8)
)

--city table
create table city(
id int primary key,
city_name char(128),
lat decimal(9,6),
long decimal(9,6),
country_id int references country(id)
)

--customer table
create table customer(
id int primary key,
customer_name varchar(255),
city_id int references city(id),
CUSTOMER_ADDRESS VARCHAR(255),
NEXT_CALL_DATE DATE  NULL,
TS_INSERTED DATETIME
)

--call table 

create table call(
id int primary key,
employee_id int references employee(id),
customer_id int references customer(id),
start_time datetime,
end_time datetime  null,
call_outcome_id int  null references call_outcome(id)
)


