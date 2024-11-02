/*----Creation----*/

create schema Security_Company;
use Security_Company;

create table Security_Company
(
Company_ID int not null,
SC_Name char(25),
SC_Address char(30),
EST_Date date,
primary key(Company_ID)
)engine = innoDB;

create table Employees
(
emp_ID int not null,
emp_Name char(25),
company_ID int,
emp_Type char(25) not null,
Years_Of_Exp int,
Start_Working_Date date,
primary key(emp_ID),
constraint fk_emp_company foreign key(company_ID) references security_Company(company_ID)
on update cascade
on delete no action
)engine = innoDB;

create table Weapon
(
weap_ID int not null,
emp_ID int not null,
Weap_Type char(25),
primary key(weap_ID),
constraint fk_Weapon foreign key(emp_ID) references Employees(emp_ID)
on update cascade
on delete no action
)engine = innoDB;


create table Customer
(
Cust_ID int not null,
cust_Name char(25),
cust_Address char(30),
company_ID int,
primary key(Cust_ID),
constraint fk_cust_company foreign key(company_ID) references security_Company(company_ID)
on update cascade
on delete no action
)engine = innoDB;

create table NOC
(
NOC_Name char(25) not null,
NOC_Address char(30),
company_ID int not null,
primary key(NOC_Name),
CONSTRAINT fk_NOC FOREIGN KEY (company_ID) REFERENCES security_Company(company_ID)
)engine = innoDB;

create table Emp_NOC
(
emp_ID int not null,
NOC_Name char(25) not null,
Shift_Date date not null,
Start_Time time,
End_Time time,
primary key (emp_ID,NOC_Name),
constraint fk_engineer_noc foreign key (emp_ID) references Employees(emp_ID),
constraint fk_noc_engineer foreign key (NOC_Name) references NOC(NOC_Name)
on update cascade
on delete no action
)engine = InnoDB;


create table Security_Camera
(
cam_ID int not null,
cam_manufacturer char(25),
cam_model char(25),
NOC_Name char(25),
Cust_ID int not null,
primary key(cam_ID),
constraint fk_noc_camera foreign key(NOC_Name) references NOC(NOC_Name),
constraint fk_camera foreign key(Cust_ID) references Customer(Cust_ID)
on update cascade
on delete no action
)engine = innoDB;

create table Orders
(
order_ID int not null,
cust_ID int ,
primary key(order_ID),
constraint fk_cust_order foreign key(cust_ID) references customer(cust_ID)
on update cascade
on delete no action
)engine = innoDB;

create table Products
(
Product_ID int not null,
Product_Type char(25) not null,
primary key(Product_ID)
)engine = innoDB;

create table Line
(
Line_ID int not null,
Product_ID int not null,
Quantity int,
Start_Date date,
End_Date date,
order_ID int not null,
primary key(Line_ID),
constraint fk_Line_order foreign key(order_ID) references Orders(order_ID),
constraint fk_products_line foreign key(Product_ID) references Products(Product_ID)
on update cascade
on delete no action
)engine = innoDB;

create table Emp_Products
(
emp_ID int not null,
Product_ID int not null,
primary key (emp_ID,Product_ID),
constraint fk_Emp_Products foreign key (emp_ID) references Employees(emp_ID),
constraint fk_Product_ID foreign key (Product_ID) references Products(Product_ID)
on update cascade
on delete no action
)engine = InnoDB;


create table Vehicle
(
V_ID int not null,
Product_ID int,
V_Prod_Year int,
V_Model char(25),
Fuel_Amount int,
primary key (V_ID),
constraint fk_patrol_pv foreign key (Product_ID) references Products(Product_ID)
on update cascade
on delete no action
)engine = InnoDB;

create table V_Employees
(
emp_ID int not null,
V_ID int not null,
Shift_Date date not null,
Start_Time time,
End_Time time,
primary key (emp_ID,V_ID),
constraint fk_emp_ID foreign key (emp_ID) references Employees(emp_ID),
constraint fk_V_ID foreign key (V_ID) references Vehicle(V_ID)
on update cascade
on delete no action
)engine = InnoDB;

