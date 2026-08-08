
Drop database if exists EMP;

Create database Emp;
Use Emp;


Create table Departments(
       Department_id int Primary key unique,
       Department_Name Varchar(100) Unique Not Null
);

Create table Location(
       Location_id int Auto_increment primary key,
       Location_name varchar(100)Unique Not Null
	);

    Create table Employees( 
    Employee_id int primary key, 
    Employee_Name Varchar(50) Not NULL,
    Department_id int,
	Location_id int,
    Gender enum ('M','F'),
    Age int check(Age >= 18), 
    Hire_date Date Default(Current_date), 
    Designation varchar(100), 
    salary Decimal(10,2), 
    Foreign key(department_id) References Departments(department_id), 
    Foreign key(location_id) References Location(location_id) 
    );
    
    Select * FROM Departments;
    Select * FROM Location;
    Select * FROM Employees;
   Use Emp;
   Insert into Departments
   Values   (11,'Petro chemical'),
			(12,'Sales'),
			(13,'Automotive'),
            (14,'EEE'),
            (15,'ECE');
         
         Select * FROM Departments;
         
		Insert into location(location_name)
		Values ('TIRUNELVELI'),
	    ('TRICHY'),
        ('Cuddalore'),
        ('Neyveli'),
        ('Tambaram');
        
		Select * FROM Location;
        
        Insert into Employees (Employee_id, Employee_Name, Department_id, location_id,Gender, Age, Hire_date, Designation, salary)
					Values ( '01','Naveen', 11, 1,'M', 18,'2023-05-12','Senior QA Analyst',50000.00),
						   ('02', 'Angeline', 12, 2,'F', 23,'2023-08-17','Data Analyst',40000.00),
						   ('03', 'Surya', 13, 3, 'F', 20,'2023-10-07','Senior data engineer',50000.00),
                           ('04', 'Priya', 14, 4, 'F' , 28, '2023-11-25','Data engineer',70000.00),
                           ('05', 'Jerusha', 15, 5,'F', 30, '2025-6-30','Gaming Engineer',80000.00);    
    
	    Select * FROM Employees; 
         