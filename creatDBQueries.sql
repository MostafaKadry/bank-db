drop database bankSysDb;
create database bankSysDb;
use bankSysDb; 
-- 1----------------------------------------
create table Employee (
id int primary key,
super_id int not null,
salary money default 0,
position varchar(15),
f_name varchar(10),
l_name varchar(10),
gender char(1),
birth_date date,
adress varchar(20)
);
-- 2----------------------------------------
create table emp_working_depart (
emp_id int not null,
dept_id int not null, 
startDate date
);
------------------------------------------
create table department (
id int primary key,
dep_name varchar(20),
dep_location varchar(20),
manger_id int not null
);
------------------------------------------

create table equipment(
id int primary key,
depart_id int not null,
equp_name varchar(15),
equp_type varchar(15),
starting_use date
);
------------------------------------------

create table out_source_servise(
id int primary key,
outsurce_ID int not null,
department_ID int not null,
srvs_name varchar(20),
srvs_datetime datetime
);
------------------------------------------
create table bank_treasury(
id int primary key,
balance money default 0
);
------------------------------------------
create table loan (
id int primary key,
duration varchar(10),
startDate date,
endDate date,
amount money default 0,
mang_fees money,
treasury_id int not null
);
--------------------------sss----------------
create table installment (
loan_id int not null,
customer_id int not null,
payment_date datetime default getdate() not null,
paymentAmount money default 0
)
-----------------------------------------
create table takeLoan (
loan_id int not null,
customer_id int not null,
takeing_loan datetime
);
------------------------------------------
create table customer (
id int primary key,
f_name varchar(10),
l_name varchar(10),
birthdate date,
gender char(1),
);
------------------------------------------
create table cust_phone(
customer_id int not null,
phone_num varchar primary key,
);
-----------------------------------------
create table car (
car_id int,
owner_id int not null,
owner_type varchar(10),
PRIMARY KEY (car_id, owner_type, owner_id)
)
------------------------------------------
create table parking_time (
car_id int not null,
area_id int not null,
time_in datetime,
time_out datetime,
);
-----------------------------------------
create table parking (area int primary key)
-----------------------------------------
create table dependant (
emp_id int not null,
dep_name varchar(25),
relation varchar(25),
BD date,
);
-----------------------------------------
create table emp_phone (
emp_id int not null,
phone_num varchar primary key
);
-----------------------------------------
create table customer_adderss (
cust_id int not null,
zip_code int not null,
street varchar(10),
build_number int
);
-----------------------------------------
create table zip_codes (
zip_code int primary key,
city varchar(15)
);
-----------------------------------------
create table transMoneyTransaction (
to_account_id int not null,
from_account_id int not null,
transDateandTime datetime,
transaction_amount money,
rans_id int primary key,
trans_by int default(0)
);
-----------------------------------------
create table account(
id int primary key,
acc_type varchar(10),
balance money default 0,
cust_id int not null,
acc_password varchar(30)
);
-----------------------------------------
create table withdraw_and_deposite(
id int primary key,
amount money,
wd_date datetime,
wd_type varchar(10) ,
account_id int not null,
action_by int default 0
);
-----------------------------------------
create table ATM (
id int primary key,
atm_location varchar(20),
balance money default 0 
);
------------------------------------------
create table refull_atm (
atm_id int not null,
outsource_id int not null,
amount money default 0,
dateOfRfull datetime
);
------------------------------------------
create table out_source_agency (
id int primary key,
name varchar(20)
);
------------------------------------------
--- we have 24 table, but in mapping there are only 23, I think the increased one is in normalization.
------------------------------------------