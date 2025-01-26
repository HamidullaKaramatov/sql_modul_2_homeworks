create database sql_class_22_homework

use sql_class_22_homework


---MISOL 1
CREATE TABLE Activities (
    sell_date DATE,
    product VARCHAR(50)
);

INSERT INTO Activities (sell_date, product) VALUES ('2020-05-30', 'Headphone');
INSERT INTO Activities (sell_date, product) VALUES ('2020-06-01', 'Pencil');
INSERT INTO Activities (sell_date, product) VALUES ('2020-06-02', 'Mask');
INSERT INTO Activities (sell_date, product) VALUES ('2020-05-30', 'Basketball');
INSERT INTO Activities (sell_date, product) VALUES ('2020-06-01', 'Bible');
INSERT INTO Activities (sell_date, product) VALUES ('2020-06-02', 'Mask');
INSERT INTO Activities (sell_date, product) VALUES ('2020-05-30', 'T-Shirt');


select * FROM Activities


Find the date, number of products produced per date and the name of those items

/* sell_date					Products
	2020-05-30					 Basketball, Headphone, T-Shirt
	2020-06-01					Bible, Pencil
	2020-06-02					Mask
*/

/* string_agg */


--MISOL 2
CREATE TABLE Orders (
    order_number INT PRIMARY KEY,
    customer_number INT
);

-- Insert the data into the Orders table
INSERT INTO Orders (order_number, customer_number) VALUES
(5, 1),
(2, 2),
(3, 3),
(4, 3);


select customer_number, order_number from Orders

/* customer_number
		3
*/

Eng kop order qilgan customerni topish

--YECHIM 

select top 1 customer_number from Orders
group by customer_number
order by count(customer_number) desc



--MISOL 3
CREATE TABLE Employees (
    emp_id INT,
    event_day DATE,
    in_time INT,
    out_time INT
);

-- Insert the data into the Employees table
INSERT INTO Employees (emp_id, event_day, in_time, out_time) VALUES
(1, '2020-11-28', 4, 32),
(1, '2020-11-28', 55, 200),
(1, '2020-12-03', 1, 42),
(2, '2020-11-28', 3, 33),
(2, '2020-12-09', 47, 74);

select * from Employees

Har bir employee bir kunda necci vaqt officeda bolganligini hisoblash kerak

/* event_day		emp_ID		Total_time
	2020-11-28		1				173
	2020-12-03		1				41
	2020-11-28		2				30
	2020-12-09		2				27
*/

--SOLUTION

select event_day,sum(out_time - in_time) as total_vaqt from Employees
group by emp_id,event_day


--MISOL 4

-- Create the Product table
CREATE TABLE Product (
    product_key INT 
);

-- Insert the data into the Product table
INSERT INTO Product (product_key) VALUES
(5),
(6);

-- Create the Customer table
CREATE TABLE Customer (
    customer_id INT,
    product_key INT,
   );

-- Insert the data into the Customer table
INSERT INTO Customer (customer_id, product_key) VALUES
(1, 5),
(2, 6),
(3, 5),
(3, 6),
(1, 6);


select * from Customer
select * from Product

Har bir productni ololadigan customer topish

/* customer_ID
		1
		3
*/

--SOLUTION 

select customer_id from Customer
group by customer_id
having count(distinct product_key)=(select count(*)from Product)

--MISOL 5
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO Users (user_id, name) VALUES (1, 'aLice');
INSERT INTO Users (user_id, name) VALUES (2, 'bOB');
INSERT INTO Users (user_id, name) VALUES (3, 'sArA');
INSERT INTO Users (user_id, name) VALUES (4, 'JoHNSoN');


select * from users

/* 1		Alice
   2		Bob
   3		Sara
   4		Johnson
*/

Capitalize first letters 

--solution

select user_id,concat(upper(left(name,1)),lower(substring(name,2,len(name)-1))) as result from Users;






