 use SQL_Class_14_
 Homeworks


	Create table Employees
(
    Id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10),
    Salary int,
    DepartmentId int foreign key references Department(Id)
)
Go

Insert into Employees values (1, 'mark', 'Male', 50000, 1)
Insert into Employees values (2, 'mary', 'Female', 60000, 3)
Insert into Employees values (3, 'steve', 'Male', 45000, 2)
Insert into Employees values (4, 'john', 'Male', 56000, 1)
Insert into Employees values (5, 'sara', 'Female', 39000, 2)
Go

select * from Employees
---1) Capitalize first letters 
--yechim
select id, concat(upper(left(name,1)),lower(substring(name,2,len(name)-1)))as name,Gender,Salary,DepartmentId from Employees


---2) Capitalize last letters
--yechim 
select id, concat(lower(substring(name,1,len(name)-1)),upper(right(name,1)))as name,Gender,Salary,DepartmentId from Employees


---3) Find me longest string
CREATE TABLE StringData1 (
   id INT PRIMARY KEY,
   original_string VARCHAR(100)
);
 
INSERT INTO StringData1 (id, original_string) VALUES
(1, 'apple'),
(2, 'banana'),
(3, 'cherry'),
(4, 'date');

select * from StringData1
--yechim
select ID, len(original_string) as len,original_string from StringData1
where  len(original_string)>5

---4) Split names to first name and last name 

CREATE TABLE [dbo].[TestMultipleColumns] 
(
    [Id] [int] NULL,
    [Name] [varchar](20) NULL
);
INSERT INTO [TestMultipleColumns] 
VALUES 
(1,    'Pawan,Kumar'), 
(2,    'Sandeep,Goyal'), 
(3,    'Isha,Mattoo'), 
(4,    'Gopal,Ranjan'),
(5,    'Neeraj,Garg'), 
(6,    'Deepak,Sharma'), 
(7,    ' Mayank,Tripathi');


select * from TestMultipleColumns

---yechim
select id,left(name,charindex(',',name)-1) as firstname,
right(name,len(name)-charindex(',',name)) as lastname  from TestMultipleColumns


