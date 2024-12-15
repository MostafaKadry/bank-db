create database bankSysDb;
use bankSysDb;
-- 1----------------------------------------
create table Employee (
id int primary key,
super_id int,
salary money,
position varchar(15),
f_name varchar(10),
l_name varchar(10),
gender char(1),
birth_date date,
adress varchar(20)
)
-- 2----------------------------------------
create table emp_working_depart (
emp_id int,
dept_id int, 
startDate date
)
------------------------------------------
create table department (
id int primary key,
dep_name varchar(20),
dep_location varchar(20),
manger_id int
)
------------------------------------------

create table equipment(
id int primary key,
depart_id int,
equp_name varchar(15),
equp_type varchar(15),
starting_use date
)
------------------------------------------

create table out_source_servise(
id int primary key,
outsurce_ID int,
department_ID int,
servece_name varchar(20),
serviceStartTime datetime
)
------------------------------------------
create table bank_treasury(
id int primary key,
balance money
)
------------------------------------------
create table loan (
id int primary key,
duration varchar(10),
startDate date,
endDate date,
amount money,
mang_fees money,
treasury_id int
)
------------------------------------------
create table installment (
loan_id int,
customer_id int,
payment_date datetime,
paymentAmount money
)
-----------------------------------------
create table takeLoan (
loan_id int,
customer_id int,
takeing_loan datetime
)
------------------------------------------
create table customer (
id int primary key,
super_id int,
f_name varchar(10),
l_name varchar(10),
birthdate date,
gender char(1),
)
------------------------------------------
create table phone(
customer_id int,
phone_num varchar
)
-----------------------------------------
create table car (
id int,
owner_id int,
owner_type varchar(10)
)
------------------------------------------
create table parking_time (
car_id int,
area_id int,
time_in datetime,
time_out datetime,
)
-----------------------------------------
create table parking (area int)
