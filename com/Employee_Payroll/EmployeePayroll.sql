create database employee_payrolldata;
use employee_payrolldata;
show tables;

create table employee_detail(
employee_id int auto_increment,
employee_name varchar(20),
phone_numbe varchar(20),
address varchar(30),
gender varchar(10),
city varchar(20),
state varchar(20),
primary key(employee_id)
);

desc employee_payrolldata;

insert into employee_detail (employee_name,phone_numbe,address,gender,city) values ('Tushar','1465451128','Mumbai','Male','Jalgaon');
insert into employee_detail (employee_name,phone_numbe,address,gender,city) values ('Sanket','2568497623','Mumbai','Male','Nagpur');
insert into employee_detail (employee_name,phone_numbe,address,gender,city) values ('Aditya','1546584785','Mumbai','male','Patna');
insert into employee_detail (employee_name,phone_numbe,address,gender,city) values ('Usha','967884785','Mumbai','Female','Delhi');
insert into employee_detail (employee_name,phone_numbe,address,gender,city) values ('Priti','6589746231','Mumbai','Female','Karnatak');

select * from employee_detail;

create table salary_detail(
salary_id int auto_increment,
basic_pay float,
deductions float,
taxable_pay float,
tax float,
net_pay float,
start_date date,
primary key (salary_id),
foreign key (salary_id) references employee_detail(employee_id)
);
show tables;
Select * from salary_detail;

Select * from employee_detail;

insert into salary_detail(basic_pay,deductions,taxable_pay,tax,net_pay,start_date) values(30000,4000,2500,1200,30000,'2018-09-22');
insert into salary_detail(basic_pay,deductions,taxable_pay,tax,net_pay,start_date) values(40000,4000,2500,1300,32000,'2018-09-21');
insert into salary_detail(basic_pay,deductions,taxable_pay,tax,net_pay,start_date) values(500000,4000,2500,1400,34000,'2018-09-23');
insert into salary_detail(basic_pay,deductions,taxable_pay,tax,net_pay,start_date) values(60000,4000,2500,1500,36000,'2018-09-24');
insert into salary_detail(basic_pay,deductions,taxable_pay,tax,net_pay,start_date) values(70000,4000,2500,2600,38000,'2018-09-25');

Select e.employee_id,e.employee_name,e.phone_number,e.address,e.gender,e.city,es.basic_pay,es.deductions,es.taxable_pay,es.tax,es.net_pay,es.start_date from employee_detail as e right join salary_detail as es
on e.employee_id = es.salary_id;

create table employee_department(
department_id int auto_increment,
department_name varchar(30),
emp_department_id int,
primary key (department_id),
foreign key (emp_department_id) references salary_detail(salary_id)
);
Select * from salary_detail;
select * from employee_department;
insert into employee_department(department_name,emp_department_id) values("SDE",1),("Testing",2),("Admin",3),("HR",4),('Testing',5);
insert into employee_department(department_name,emp_department_id) values("SDE",7);

Select * from employee_department;

Select * from employee_detail as e
inner join salary_detail as es
inner join employee_department as ed
on e.employee_id = es.salary_id and es.salary_id = ed.emp_department_id;

update employee_detail set employee_name ='Adi' where employee_id =3;

select min(net_pay) from salary_detail where net_pay>30000;

select max(net_pay) from salary_detail where net_pay>35000;

select avg(net_pay) from salary_detail where net_pay;

select sum(net_pay) from salary_detail where net_pay;

select * from employee_detail;