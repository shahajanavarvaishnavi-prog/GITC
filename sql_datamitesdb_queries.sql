Drop database  if exists datamites_db;

create database datamites_db;
use datamites_db;

create table employee 
(emp_id int primary key ,emp_name varchar(30) , dept_name varchar(20) , emp_salary int );
insert into employee values
(101 , 'John', 'HR' , 10000),
(201,'Mary','Finance',20000),
(301,'Zara','IT',30000),
(401,'Rida','Sales',50000),
(501, 'Ram','HR',40000),
(601,'Varun','IT',70000),
(701,'Araav','HR',60000),
(801,'Joy','IT',90000),
(302,'Arun','Sales',40000),
(403,'Joe','Finance',35000),
(704,"Dia","Finance",26000);

CREATE TABLE department (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(30),
dept_head varchar(20)
);
CREATE TABLE student (
s_id INT PRIMARY KEY,
s_name VARCHAR(30),
s_age INT,
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);


INSERT INTO department VALUES
(10, 'CDS', 'Ram Prasad'),
(20, 'CDA', 'Nithish Kumar'),
(30, 'CDE', 'kishore kamath'),
(40, 'AIE', 'bipin roy'),
(50, 'CS', 'lohith reddy'),
(60, 'IOT', 'Sarvesh Yadav');

select * from department;

INSERT INTO student VALUES
(101, 'John', 30, 10),
(102, 'Mary', 45, 20),
(103, 'Ravi', 50, 20),
(104, 'Anita', 40, 30),
(105, 'Suresh', 35, NULL),
(106, 'Neha', 28, 10),
(107, 'Arjun', 16, 20),
(108, 'Kiran', 32, 40),
(109, 'Pooja', 28, 50),
(110, 'Amit', 22, NULL);

-- student table is child table
select * from student;

-- department table is a parent table
select * from department;
select  * from employee;

Select max(emp_salary) as highest_salary from employee;

Select min(emp_salary) as lowest_salary from employee;

Select avg(emp_salary) as avg_salary from employee;

Select sum(emp_salary) as total_salary from employee;

Select count(*) as total_employee from employee;

Select distinct(dept_name) as departments from employee;

-- Find the employee details who belongs to IT and salary is more than 50k
Select * from employee
where dept_name= "IT" and emp_salary >50000;

-- Find the employee details who belongs to IT and sales
Select * from employee
where dept_name= "IT" OR dept_name="sales" ;

-- solution 2
select * from employee
where dept_name in ("IT", "Sales");

-- find the number of employee in each dept
select dept_name, count(*)as dept_count from employee -- we can only give column name which is mentioned in group by clause and aggregate function
Group by dept_name;

-- find the max salary in each department
select dept_name, max(emp_salary) as maximum_salary from employee
Group by dept_name;

-- sort the employee salary in ascending order and display employee info
select * from employee
order by emp_salary ; -- defaulty it will be ascending order

-- sort the employee salary in descending order and display employee info
select * from employee
order by emp_salary desc; 

-- fetch first top 3 records from the table 
select * from employee limit 3;

-- fetch last 2 records from employee table 
select * from employee
order by emp_id desc -- we dont have command to take it from down so use desc and perform
limit 2;

-- find the employee details who is getting is getting max salary
select * from employee
order by emp_salary desc 
limit 1;

-- find 2nd highest salary 
select * from employee
order by emp_salary desc 
limit 1 offset 1;

-- solution 2
select max(emp_salary) as 2nd_highest_salary from employee
where emp_salary < (select max(emp_salary) from employee);

-- find the employee details whose salary is between 30000 and 60000
select * from employee
where emp_salary between 30000 and 60000;

-- find the employee details whose employee name startswith letter "a"
select * from employee
where emp_name like "a%"; -- it should startwith "a" and ends with anything

-- find the employee details whose employee name endswith letter "n"
select * from employee
where emp_name like "%n"; -- it can start with anything but end with "n"

-- find the employee whose names contain exactly 4 charcters using "_"
-- "_" represents only one charcater
select * from employee
where emp_name like "____";

-- check this query 
select * from employee where dept_name like "h_";   -- 

-- sub queries 
-- 16. find the employee details who is getting max salary using sub queries
select max(emp_salary) from employee;
select * from employee where emp_salary=(select max(emp_salary) from employee);
select * from employee where emp_salary = (select max(emp_salary) from employee);

-- 17. find the employee who earns more than avg salary?
select * from employee where emp_salary > (Select avg(emp_salary) as employee_salary from employee);

-- 18. find the list of employees getting salary lesser than max salary
select * from employee where emp_salary < (select max(emp_salary) from employee)
order by emp_salary desc;

-- 19. find the 2nd highest salary
select * from employee where emp_salary < (select max(emp_salary) from employee)
order by emp_salary desc
limit 1;

select * from student;

-- 20. retrive null values, find student details who doesnot belongs to any dept,

select *  from student where dept_id is null;

-- find the students who are enrolled in the department
select * from student where dept_id is not null;

-- 21. find the employee count and employee details by using partition by using partition by

select *,
count(emp_id) over(partition by dept_name) as emp_count
from employee;

select *, 
max(emp_salary) over(partition by dept_name order by emp_salary desc) as max_sal
from employee;
select *, 
rank() over(partition by dept_name order by emp_salary desc) as rank_emp
from employee;

select * from employee
order by emp_salary desc
limit 1 offset 1;


-- P.K Constraint
-- Duplicate vaulues
-- Null values

-- Inner Join

select s.* ,d.*
from student s
inner join department d
on s.dept_id = d.dept_id;

--  or

select s.* ,d.*
from student s
join department d
on s.dept_id = d.dept_id;

-- left join
select s.* ,d.*
from student s
left join department d
on s.dept_id = d.dept_id;

-- Right join
select s.* ,d.*
from student s
Right join department d
on s.dept_id = d.dept_id;


select s.* ,d.*
from student s
inner join department d
on s.dept_id = d.dept_id 
where d.dept_name = "CDS" ;

show tables;

select * from orders;

