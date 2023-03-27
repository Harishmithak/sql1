create table salesman(
salesmanid int,
name varchar(20),
city varchar(20),
commission float
)

insert into salesman values(5001 , 'James Hoog ', 'New York',  0.15),(5002 ,' Nail Knite ','Paris ' ,0.13),(5005 ,'Pit Alex ',' London ', 0.11),
(5006 ,' Mc Lyon ',' Paris ', 0.14),(5007 ,'Paul Adam ','Rome ', 0.13),(5003,' Lauson Hen ','San Jose ', 0.12)

select * from salesman

create table customer(customerid int,
customername varchar(20),
city varchar(20),
grade int,
salesmanid int
)
 
 insert into customer values(3002,' Nick Rimando ','New York',100 , 5001),(3007,' Brad Davis ','New York ', 200 ,5001),
 (3005 ,' Graham Zusi ',' California ', 200 , 5002),
(3008 ,' Julian Green ',' London ', 300 , 5002),
(3004 ,'Fabian Johnson ',' Paris', 300 , 5006),
(3009 ,' Geoff Cameron ',' Berlin ', 100 , 5003),
(3003,'Jozy Altidor',' Moscow ', 200 , 5007)
 insert into customer (customerid ,customername,
city ,
salesmanid )values(3001 ,' Brad Guzan ','London',5005)

select * from customer

create table orders(
orderno int,
purchaseamt float,
orderdate date,
customerid int,
salesmanid int
)

INSERT INTO orders (orderno, purchaseamt, orderdate, customerid, salesmanid)
VALUES
    (70001, 150.5, '2012-10-05', 3005, 5002),
    (70009, 270.65, '2012-09-10', 3001, 5005),
    (70002, 65.26, '2012-10-05', 3002, 5001),
    (70004, 110.5, '2012-08-17', 3009, 5003),
    (70007, 948.5, '2012-09-10', 3005, 5002),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (70008, 5760, '2012-09-10', 3002, 5001),
    (70010, 1983.43, '2012-10-10', 3004, 5006),
    (70003, 2480.4, '2012-10-10', 3009, 5003),
    (70012, 250.45, '2012-06-27', 3008, 5002),
    (70011, 75.29, '2012-08-17', 3003, 5007),
    (70013, 3045.6, '2012-04-25', 3002, 5001)


	select * from orders



	--1

	SELECT s.name,s.salesmanid,c.customername ,s.commission,c.city
    FROM salesman AS s
   INNER JOIN
   customer  AS c
   ON s.city=c.city

   --2

   	SELECT s.name,c.customername ,c.city,s.commission
    FROM salesman AS s
   INNER JOIN
   customer  AS c
   ON s.salesmanid=c.salesmanid where commission>0.12


   --3

   SELECT orderno,orderdate,purchaseamt,customername,grade,name,commission
FROM salesman AS s
   inner join
   customer AS c
   ON s.salesmanid =  c.salesmanid
   inner join 
   orders AS o
   ON o.customerid=c.customerid 

   --4

   select o.orderno,o.purchaseamt,c.customername,c.city
   from customer as c
   inner join 
   orders as o
   on c.customerid=o.customerid where purchaseamt>500 and purchaseamt<2000

   --5

   select c.customername,c.city ,c.grade,c.customerid,s.name
   from customer as c
   inner join 
   salesman as s
   on s.salesmanid=c.salesmanid order by customerid 
