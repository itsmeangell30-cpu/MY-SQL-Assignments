CREATE Database Emp;
Use Emp;

-- Table creation -Departments
Create table Departments(
       Department_id int Primary key,
       Department_Name Varchar(30)
);
-- Table creation - Location
Create table Location(
       Location_id int primary key,
       Location_name varchar(100)
	);
    -- Table creation -Employees
    Create table Employees( 
    Employee_id int primary key, 
    Employee_Name Varchar(50), 
    Gender enum ('M','F'),
    Age int, 
    Hire_date Date, 
    Designation varchar(50), 
    salary Decimal(10,2) Not null, 
    Foreign key(department_id) References Departments(department_id), 
    Foreign key(location_id) References Location(location_id) 
    );-
    
    -- Alter table -Employees-Add Column
    Alter table Employees
    Add column EMAIL varchar(30) Not null;
    
    -- Alter table - Modify
    Alter table Employees
    Modify Designation varchar(100);
    
    -- Alter table -Drop
    Alter table Employees
    Drop Column Age;
    
    -- Alter table -Rename a Colunm name
    Alter table Employees
    Rename column Hire_date to Date_Of_Joining;
    
    -- Table renaming
    
    Rename table Departments to Departments_info;
    Rename table  location to Locations;
    
    -- Insertion -Values into table
    Use Emp;
   Insert into Departments_Info
   Values(12,'IT'),
         (13,'CS'),
         (14,'Mech'),
         (15,'Architecture');
         
   Update departments_info
   set department_name ='Finance'
    Where department_id =11;

 Insert into locations
 Values (22 , 'chennai'),
	    (23, 'CBE'),
        (24, 'Madurai'),
        (25, 'sattur');
        
 Insert into locations(Location_id,location_name)
 Values( 26, 'Tutucorin');
         
     -- Insertion - values into Employees table
     Insert into Employees (Employee_id, Employee_Name, Gender, Date_Of_Joining, Designation, salary, Department_id, Location_id, EMAIL)
	 Values ( '01','Naveen','M','2023-05-12','Senior QA Analyst',50000.00,11,22,'Naveen.prasath @ example.org');
     
     Insert into Employees(Employee_id, Employee_Name, Gender, Date_Of_Joining, Designation, salary, Department_id, Location_id, EMAIL)
	  Values('02', 'Angeline','F','2023-08-17','Data Analyst',40000.00,12,23,'angeline.e @ example.org'),
            ('03', 'Surya',  'F', '2023-10-07','Senior data engineer',50000.00,13,24,'Surya.M @ example.org'),
            ('04', 'Priya', 'F' , '2023-11-25','Data engineer',70000.00,14,25,'Priya.KR @ example.org'),
            ('05', 'Jerusha', 'F', '2024-12-15','Gaming Engineer',80000.00,15,26,'jerusha.V @ example.org');
            
       Select * FROM Departments_info;
	   Select * FROM locations;
	   select * FROM Employees;
            
 -- Truncate -Employees table

    Truncate table Employees;
 
 -- Drop -Employees table
 
	Drop table Employees;
    
  --  Drop - Database EMP
  
      Drop database EMP;
    
    

    
    