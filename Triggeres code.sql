use security_company;

create table CustomerTriger
(
Cust_ID int not null,
cust_Name char(25),
cust_Address char(30),
company_ID int,
primary key(Cust_ID)
)engine = innoDB;

create table customer_log
(
Cust_ID int not null,
old_cust_Name char(25),
new_cust_Name char(25),
old_cust_Address char(30),
new_cust_Address char(30),
old_company_ID int,
new_company_ID int,
command_ts timestamp,
command varchar(10));

delimiter $
CREATE TRIGGER Customer_customer_del_trg AFTER DELETE ON customer
FOR EACH ROW
BEGIN
INSERT INTO customer_log VALUES(old.Cust_ID, old.cust_Name, null, old.cust_Address,null, old.company_ID, null, now(), 'delete');
END$
delimiter ;

delimiter $
CREATE TRIGGER Customer_customer_upd_trg AFTER UPDATE ON customer
FOR EACH ROW
BEGIN
 INSERT INTO customer_log VALUES(new.Cust_ID, old.cust_Name, new.cust_Name, old.cust_Address, new.cust_Address, old.company_ID , new.company_ID, now(), 'update');
END$
delimiter ;