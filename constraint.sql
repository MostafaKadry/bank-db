use bankSysDb; 
alter table Employee
add constraint super foreign key(super_id)  references Employee(id),
constraint emp_gender check( gender in( 'f','m' ));

-------------------------------------------------------------------------------
alter table emp_working_depart
add constraint empforw foreign key(emp_id)  references Employee(id),
constraint deptforw foreign key(dept_id)  references department(id),
constraint compwork primary key(emp_id,dept_id);

-------------------------------------------------------------------------------
alter table department
add constraint mang_dept foreign key(manger_id)  references Employee(id);

-------------------------------------------------------------------------------
alter table equipment
add constraint equp_dept foreign key(depart_id)  references department(id);

-------------------------------------------------------------------------------
alter table out_source_servise
add constraint out_servive1 foreign key(department_ID)  references department(id),
constraint out_servive foreign key(outsurce_ID)  references out_source_agency(id),
constraint treasuryid foreign key(treasury_id)  references bank_treasury(id);
-------------------------------------------------------------------------------
 alter table loan
add constraint loan_bank foreign key(treasury_id)  references bank_treasury(id);


-----------------------------------------ssss--------------------------------------
alter table installment
add constraint loankey foreign key(loan_id)  references loan(id),
constraint install_id primary key(loan_id,customer_id, payment_date),
constraint custkey foreign key(customer_id)  references customer(id);

-------------------------------------------------------------------------------
alter table takeLoan
add constraint loankeytake foreign key(loan_id)  references loan(id),
constraint custkeytake foreign key(customer_id)  references customer(id),
constraint take_loan primary key(loan_id,customer_id);
-------------------------------------------------------------------------------
alter table customer
add constraint cust_gender check( gender in( 'f','m' ));

-------------------------------------------------------------------------------
 alter table cust_phone
add constraint custphonekey foreign key(customer_id)  references customer(id);
-------------------------------------------------------------------------------
 alter table dependant
 add constraint depend_id foreign key(emp_id)  references employee(id);
-------------------------------------------------------------------------------
alter table emp_phone
add constraint empphonekey foreign key(emp_id)  references employee(id);
-------------------------------------------------------------------------------
alter table customer_adderss
add constraint custaddress foreign key(cust_id)  references customer(id),
constraint zcode foreign key (zip_code) references zip_codes(zip_code);
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
alter table transMoneyTransaction
add constraint toacc foreign key(to_account_id)  references account(id),
constraint fromacc foreign key(from_account_id)  references account(id),
constraint atm_id foreign key(trans_by)  references ATM(id);
----------------------------------------------------------------------------------
 alter table withdraw_and_deposite
add constraint acc foreign key(account_id)  references account(id),
constraint f_atm_id foreign key(action_by)  references ATM(id),
constraint wdteasury foreign key(treasury_id)  references bank_treasury(id);
-------------------------------------------------------------------------------
 alter table account
add constraint custac_id foreign key(cust_id)  references customer(id),
constraint account_type check( acc_type in( 'gold','silver','platinum' ));

-------------------------------------------------------------------------------
 alter table refull_atm
add constraint cust_id foreign key(outsource_id)  references out_source_agency(id);

-------------------------------------------------------------------------------
 alter table car
add constraint owcar check( owner_type in( 'employee','customer' ));
----------------------------------------------------------------------------------------
 alter table parking_time
add constraint carid foreign key(car_id)  references car(car_id),
constraint areaid foreign key(area_id)  references parking(area);
