use security_company;
/*----Insertion----*/

INSERT INTO security_Company (company_ID, sc_Name, sc_Address ,EST_Date) VALUES (1, 'TIL', 'Tel aviv','1994-04-07');

INSERT INTO employees (emp_ID,emp_Name, company_ID, emp_Type ,years_of_exp ,start_working_Date) VALUES 
(11,'Alex', 1,'manager',27,'1994-06-26'),
(12,'David', 1,'manager',27,'1994-05-07'),
(13,'Roni', 1,'manager',26,'1995-12-07'),
(14,'Mila',1,'officer',3,'2018-07-26'),
(15,'Boni',1,'officer',25,'1996-03-07'),
(16,'Gal',1,'officer',26,'1995-06-07'),
(17,'Shlomo',1,'officer',24,'1997-06-26'),
(18,'Moshe',1,'bodyguard',21,'2000-04-07'),
(19,'Ami',1,'bodyguard',12,'2009-04-09'),
(20,'Hezi',1,'bodyguard',1,'2020-06-26'),
(21,'Menahem',1,'bodyguard',4,'2017-04-25'),
(22,'Haim',1,'bodyguard',2,'2019-04-07'),
(23,'Ofer',1,'bodyguard',0,'2021-05-07'),
(24,'Itzik',1,'bodyguard',7,'2014-04-20'),
(25,'Aharon',1,'NOC_engineer',9,'2012-06-07'),
(26,'Arie',1,'NOC_engineer',9,'2012-09-23'),
(27,'Daniel',1,'NOC_engineer',10,'2011-04-07'),
(28,'Ran',1,'NOC_engineer',11,'2010-03-18'),
(29,'Lotem',1,'NOC_engineer',9,'2012-04-07'),
(30,'Lin',1,'NOC_engineer',5,'2019-08-01');

INSERT INTO weapon (weap_ID,emp_ID, Weap_Type ) VALUES
 (61,14,'Glock'),
 (62,15,'Knife'),
 (63,16,'Barita'),
 (64,17,'Glock'),
 (65,18,'Glock'),
 (66,19,'M16'),
 (67,20,'M16'),
 (68,21,'M16'),
 (69,22,'Barita'),
 (70,23,'Glock'),
(71,24,'Glock');

 INSERT INTO customer (cust_ID,cust_Name, cust_Address,company_ID) VALUES
('71','momo','ashdod',1),
('72','koko','rehovot',1),
('3','tiltil','Tel-Aviv',1),
('6','Ariel','yafo',1),
('10','Aviv','Haifa',1),
('2','Nir','Lod',1),
('57','Tal','Eilat',1),
('68','Tal','Eilat',1),
('74','Toyo','rishon lezion',1);

INSERT INTO NOC (NOC_name ,NOC_Address,company_ID) VALUES
('TILNOC','Yigal Alon 68, Tel Aviv',1);

INSERT INTO Emp_NOC(emp_ID, NOC_Name ,Shift_Date ,Start_Time ,End_Time) VALUES
(25,'TILNOC','2019-08-01','19:00:00','05:00:00'),
(26,'TILNOC','2020-11-09','09:00:00','15:00:00'),
(27,'TILNOC','2018-08-01','23:00:00','07:00:00'),
(28,'TILNOC','2107-12-18','15:00:00','23:00:00'),
(29,'TILNOC','2019-08-01','07:00:00','12:00:00'),
(30,'TILNOC','2019-08-01','15:00:00','22:00:00');

INSERT INTO security_camera (cam_ID, cam_manufacturer, Cust_ID, NOC_Name ,cam_model) VALUES
('81', 'sony', 71,'TILNOC','ABC'),
('82', 'Cannon', 72,'TILNOC','DEF'),
('56', 'Nividia', 6,'TILNOC','DE3'),
('57', 'sony', 3,'TILNOC','DEI'),
('58', 'Nividia', 10,'TILNOC','EFI'),
('59', 'LG', 2,'TILNOC','D10I'),
('60', 'Samsung', 2,'TILNOC','D20I'),
('83', 'Nividia', 6,'TILNOC','ABC'),
('100', 'Cannon', 74,'TILNOC','DEFL');

INSERT INTO Orders (order_ID, cust_ID) VALUES
(123,71),
(125,71),
(126,3),
(127,2),
(128,6),
(129,10),
(130,10),
(131,3),
(124,74);

INSERT INTO Products (Product_ID,Product_Type) VALUES
(120,'Escort'),
(121,'Personal Protection'),
(122,'Patrol'),
(123,'Cyber Security');

INSERT INTO Line (Line_ID, Product_ID ,Quantity,Start_Date ,End_Date ,order_ID) VALUES
(1,120,3,'2019-08-01','2020-08-01',123),
(2,120,3,'2019-08-01','2020-08-01',123),
(3,120,3,'2019-08-01','2020-08-01',123),
(4,121,3,'2019-08-01','2020-08-01',124),
(5,122,3,'2019-08-01','2020-08-01',126),
(6,123,3,'2019-08-01','2020-08-01',131);

INSERT INTO Vehicle (V_ID ,Product_ID ,V_Prod_Year ,V_Model ,Fuel_Amount) VALUES
(701, 120, '1995', 'M4', 30 ),
(703, 122, '2020', 'E4', 45),
(704, 120, '2021', 'Q4', 158),
(705, 120, '1980', 'E4', 230),
(706, 122, '1996', 'M4', 90),
(707, 122, '2019', 'B6', 115),
(708, 122, '2018', 'C9', 96);

INSERT INTO V_Employees(emp_ID, V_ID ,Shift_Date ,Start_Time ,End_Time) VALUES
(15,'707','2019-08-01','07:00:00','15:00:00'),
(15,'705','2019-08-05','20:30:00','04:30:00'),
(15,'701','2019-09-07','22:00:00','06:00:00'),
(16,'701','2020-06-08','07:00:00','15:00:00'),
(17,'704','2021-01-18','16:00:00','21:00:00'),
(16,'708','2020-06-10','15:00:00','23:00:00');
