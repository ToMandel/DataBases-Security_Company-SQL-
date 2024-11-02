use security_company;
/*----Queries----*/
/*1*/
SELECT 
    customer.cust_Name, customer.cust_ID, customer.cust_Address
FROM
    customer
ORDER BY customer.cust_Address;

/*2*/
SELECT 
    cust_Name
FROM
    customer
WHERE
    cust_Name LIKE 'A%';

/*3*/
SELECT 
    customer.cust_Name, customer.cust_ID, security_camera.cam_ID
FROM
    customer,
    security_camera
WHERE
    customer.cust_ID = security_camera.cust_ID
        AND cam_ID BETWEEN 80 AND 83
        AND security_camera.cust_ID > 1;

/*4*/
SELECT 
    customer.cust_Name,
    Orders.order_ID,
    security_company.sc_Name
FROM
    customer,
    Orders,
    security_company
WHERE
    customer.cust_ID = Orders.cust_ID
GROUP BY Orders.cust_ID
ORDER BY Orders.order_ID;

/*5*/
SELECT 
    customer.cust_ID, customer.cust_Name, COUNT(order_ID)
FROM
    customer,
    Orders
WHERE
    Orders.cust_ID = customer.cust_ID
        AND order_ID IN (SELECT 
            order_ID
        FROM
            Orders,
            customer
        WHERE
            Orders.cust_ID = customer.cust_ID
                AND (cust_Name LIKE ('Aviv')
                OR cust_Name LIKE ('momo')))
GROUP BY cust_ID , cust_Name
HAVING COUNT(order_ID) > 1
ORDER BY cust_Name;

/*6*/
SELECT 
    customer.cust_Name, Security_Camera.cam_ID
FROM
    customer,
    Security_Camera
WHERE
    customer.Cust_ID = Security_Camera.Cust_ID
        AND (Security_Camera.cam_ID) IN (SELECT 
            cam_ID
        FROM
            Security_Camera
        WHERE
            cam_ID BETWEEN 50 AND 70);

/*7*/
SELECT DISTINCT
    Security_Camera.cam_ID AS ID,
    Security_Camera.cam_manufacturer AS Manufacturer
FROM
    Security_Camera
WHERE
    cam_ID IN (SELECT 
            cam_ID
        FROM
            Security_Camera,
            customer
        WHERE
            cust_Name = 'Nir'
                AND customer.Cust_ID = Security_Camera.Cust_ID)
        OR cam_ID IN (SELECT 
            cam_ID
        FROM
            Security_Camera,
            customer
        WHERE
            cam_manufacturer = 'Sony'
                AND customer.Cust_ID = Security_Camera.Cust_ID)
ORDER BY cam_manufacturer;


/*----Employees Queries-----*/
/*1*/
SELECT 
    Employees.*
FROM
    Employees
ORDER BY DATEDIFF(Employees.Start_Working_Date, CURDATE()) DESC;

/*get the employee id from the employees that are officers*/
/*2*/
SELECT 
    emp_ID
FROM
    Employees
WHERE
    emp_Type = 'Officer';

/*get the details of the employees that worked for more than 10 years.*/
/*3*/
SELECT 
    Employees.*
FROM
    Employees
WHERE
    YEAR(CURDATE()) - YEAR(Start_Working_Date) >= '10'
ORDER BY Start_Working_Date ASC;

/*get the employees details and weapon id and name from employees and weapon table and show who doesn't owns a weapon*/
/*4*/
SELECT 
    Employees.emp_ID,
    Employees.emp_Name,
    Employees.emp_Type,
    Weapon.weap_ID,
    Weapon.Weap_Type
FROM
    Employees
        LEFT OUTER JOIN
    Weapon ON Employees.emp_ID = Weapon.emp_ID
WHERE
    Weapon.weap_ID IS NULL;

/*show how many of weapon type are the same held by the employees */
/*5*/
SELECT 
    Employees.emp_Type,
    Weapon.Weap_Type,
    COUNT(Weapon.Weap_Type) AS 'number_Of_weapon'
FROM
    Employees,
    Weapon
WHERE
    Employees.emp_ID = Weapon.emp_ID
GROUP BY Weapon.Weap_Type , Employees.emp_Type
ORDER BY COUNT(Weapon.Weap_Type) DESC;


/*get the details of the "employee of the month" who worked the biggest amount of hours and show that amount of hours.*/
/*6*/
SELECT 
    Employees.emp_id,
    Employees.emp_Name,
    SUM(CASE
        WHEN (HOUR(emp_NOC.end_time) - HOUR(emp_NOC.start_time)) > 0 THEN HOUR(emp_NOC.end_time) - HOUR(emp_NOC.start_time)
        ELSE (24 - HOUR(emp_NOC.start_time) + HOUR(emp_NOC.end_time))
    END) AS shift_duration_sum,
    employees.emp_type
FROM
    Employees
        JOIN
    emp_NOC ON Employees.emp_id = emp_NOC.emp_id
GROUP BY emp_NOC.emp_id , Employees.emp_name 
UNION SELECT 
    Employees.emp_id,
    Employees.emp_Name,
    SUM(CASE
        WHEN (HOUR(v_employees.end_time) - HOUR(v_employees.start_time)) > 0 THEN HOUR(v_employees.end_time) - HOUR(v_employees.start_time)
        ELSE (24 - HOUR(v_employees.start_time) + HOUR(v_employees.end_time))
    END) AS shift_duration_sum,
    employees.emp_type
FROM
    Employees
        JOIN
    v_employees ON Employees.emp_id = v_employees.emp_id
GROUP BY v_employees.emp_id , Employees.emp_name
ORDER BY shift_duration_sum DESC;

/*calculate the amount of fuel per hour to a vehicle*/
/*7*/
SELECT 
    employees.emp_id,
    employees.emp_name,
    vehicle.v_id,
    vehicle.v_prod_year,
    fuel_amount / (CASE
        WHEN (HOUR(v_employees.end_time) - HOUR(v_employees.start_time)) > 0 THEN HOUR(v_employees.end_time) - HOUR(v_employees.start_time)
        ELSE (24 - HOUR(v_employees.start_time) + HOUR(v_employees.end_time))
    END) AS avg_fuel_amount_per_employee_vhicle
FROM
    employees
        JOIN
    v_employees ON employees.emp_id = v_employees.emp_id
        JOIN
    vehicle ON vehicle.v_id = v_employees.v_id
GROUP BY emp_id , emp_name , v_id , v_prod_year
ORDER BY avg_fuel_amount_per_employee_vhicle DESC;