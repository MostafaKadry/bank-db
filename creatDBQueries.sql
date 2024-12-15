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
srvs_name varchar(20),
srvs_datetime datetime
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
create table cust_phone(
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
-----------------------------------------
create table dependant (
emp_id int,
dep_name varchar(25),
relation varchar(25),
BD date,
)
-----------------------------------------
create table emp_phone (
emp_id int,
phone_num varchar
)
-----------------------------------------
create table customer_adderss (
cust_id int,
zip_code int,
street varchar(10),
build_number int
)
-----------------------------------------
create table zip_codes(
city varchar(15),
zip_code int
)
-----------------------------------------
create table transMoneyTransaction (
to_account_id int,
from_account_id int,
transDateandTime datetime,
transaction_amount money,
rans_id int,
trans_by int default(0)
)
-----------------------------------------
create table account(
id int primary key,
acc_type varchar(10),
balance money,
cust_id int,
acc_password varchar(30)
)
-----------------------------------------
create table withdraw_and_deposite(
id int primary key,
amount money,
wd_date datetime,
)
-----------------------------------------
create table ATM (
id int primary key,
atm_location varchar(20),
balance money
)
------------------------------------------
create table refull_atm (
atm_id int,
outsource_id int,
amount money,
dateOfRfull datetime
)
------------------------------------------
create table out_source_agency (
id int primary key,
name varchar(20)
)
------------------------------------------
--- we have 24 table, but in mapping there are only 23, I think the increased one is in normalization.
------------------------------------------
