Drop database if exists EMP;

Create database Employee;

Use Employee;
-- Table creation -- Departments
Create table Departments(
       Department_id int Primary key unique,
       Department_Name Varchar(100) Unique Not Null
       );
-- Table creation -- Location
Create table Location(
       Location_id int Auto_increment primary key,
       Location_name varchar(100)Unique Not Null
	);
-- Table creation  -- Employees
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
   
   -- Insertion -- values into Departments table
    
INSERT INTO departments (department_id, department_name) 
VALUES
(1, 'Software Development'),
(2, 'Marketing'),
(3, 'Data Science'),
(4, 'Human Resources'),
(5, 'Product Management'),
(6, 'Content Creation'),
(7, 'Finance'),
(8, 'Design'),
(9, 'Research and Development'),
(10, 'Customer Support'),
(11, 'Business Development'),
(12, 'IT'),
(13, 'Operations');

-- Insertion -- values into Location table

  INSERT INTO location (location_name) 
  VALUES
  ('Chennai'),
  ('Bangalore'),
  ('Hyderabad'),
  ('Pune');
  
  -- Insertion -- values into Employees table
  
INSERT INTO employees (employee_id, employee_name, department_id, location_id,gender, age, hire_date, designation, salary) 
VALUES
(5001, 'Vihaan Singh',3, 4, 'M', 27, '2015-01-20', 'Data Analyst', 60000),
(5002, 'Reyansh Singh',12, 1, 'M', 31, '2015-03-10', 'Network Engineer', 80000),
(5003, 'Aaradhya Iyer',10, 2, 'F', 26, '2015-05-20', 'Customer Support Executive', 45000),
(5004, 'Kiara Malhotra',8, 3, 'F', 29, '2015-07-05', NULL, 70000),
(5005, 'Anvi Chaudhary', 11, 1,'F', 25, '2015-09-11', 'Business Development Executive', 55000),
(5006, 'Dhruv Shetty', 8, 2,'M', 28, '2015-11-20', 'UI Developer', 65000),
(5007, 'Anushka Singh', 2, 3, 'F', 32, '2016-01-15', 'Marketing Manager',90000),
(5008, 'Diya Jha',8, 4, 'F', 27, '2016-03-05', 'Graphic Designer', 70000),
(5009, 'Kiaan Desai',11, 3, 'M', 30, '2016-05-20', 'Sales Executive', 55000),
(5010, 'Atharv Yadav',12, 4, 'M', 29, '2016-07-10', 'Systems Administrator', 80000),
(5011, 'Saanvi Patel',2, 1, 'F', 28, '2016-09-20', 'Marketing Analyst', 60000),
(5012, 'Myra Verma',13, 2, 'F', 26, '2016-11-05', 'Operations Manager', 95000),
(5013, 'Arnav Rao', 10, 3, 'M', 33, '2017-01-20', 'Customer Success Manager', 75000),
(5014, 'Vihaan Mohan',10, 2,'M', 30, '2017-03-10', 'Supply Chain Analyst', 60000),
(5015, 'Ishaan Kumar',7, 1,'M', 27, '2017-05-20', 'Financial Analyst',  85000),
(5016, 'Zoya Khan', 4, 4, 'F', 31, '2017-07-05', 'Legal Counsel', 100000),
(5017, 'Kabir Nair',12, 2, 'M', 28, '2017-09-11', 'IT Support Specialist', 80000),
(5018, 'Ishan Mishra', 9, 3,'M', 25, '2017-11-20', 'Research Scientist', 75000),
(5019, 'Ishika Patel', 4, 4,'F', 29, '2018-01-15', 'Talent Acquisition Specialist', 55000),
(5020, 'Aarav Nair', 1, 1,'M', 32, '2018-03-05', 'Software Engineer',  90000),
(5021, 'Advik Kapoor', 7, 3,'M', 26, '2018-05-20', 'Finance Analyst',  85000),
(5022, 'Aadhya Iyengar', 4, 4,'F', 28, '2018-07-10', 'HR Specialist',  60000),
(5023, 'Anika Paul', 2, 2,'F', 30, '2018-09-20', 'Public Relations Specialist',70000),
(5024, 'Aryan Shetty', 5, 1,'M', 27, '2018-11-05', 'Product Manager', 95000),
(5025, 'Avni Iyengar', 3, 4,'F', 31, '2019-01-20', 'Data Scientist', 100000),
(5026, 'Vivaan Singh', 3, 2, 'M', 29, '2019-03-10', 'Business Analyst', 75000),
(5027, 'Ananya Paul', 6, 3,'F', 32, '2019-05-20', 'Content Writer', 60000),
(5028, 'Anaya Kapoor', 6, 1, 'F', 26, '2019-07-05', 'Event Coordinator', 60000),
(5029, 'Arjun Kumar', 12, 2,'M', 33, '2019-09-11', 'Quality Assurance Analyst', 80000),
(5030, 'Sara Iyer', 5, 1, 'F', 28, '2019-11-20', 'Project Manager',  90000);

    Select * FROM Departments;
    Select * FROM Location;
    Select * FROM Employees;
    
    -- Distinct values
    Select Distinct Salary From Employees;
    
    -- Alias AS
    
Select age AS Employee_age FROM Employees;
Select Salary AS Employee_salary FROM Employees;

-- Where clause & Operators

Select * FROM EMPLOYEES where salary > 50000 AND Hire_Date < '2016-01-01';

Select * FROM Employees where designation IS NULL;

UPDATE Employees
Set designation  = "Data scientist" where EMPLOYEE_ID =5004;
 
 Select * FROM Employees;


			
    

    