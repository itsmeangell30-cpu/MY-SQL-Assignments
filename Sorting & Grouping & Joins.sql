Use Employee;

-- Sorting & Grouping data

-- ORDER BY

Select * From Employees;

Select * FROM Employees  Order by Department_id ASC , Salary DESC;

select * FROM Employees Order by Salary DESC; 

-- Limit 

Select * FROM Employees Limit 5 offset 18;


-- Aggregate Function

Select * FROM Departments;
SELECT * From Employees;

-- SUM Function -Sum of all salaries in Finance department

Select D.department_name, sum(E.salary) AS Total_salary 
FROM Employees E
JOIN Departments D 
ON E.department_id = D.Department_id
where D.Department_name = 'Finance'
Group by D.Department_name;

-- MIN Function -To find Min age among all Employees

     Select MIN(AGE) FROM Employees;

-- Group by Location wise Max salary using joins and Group by 

Select * from location;
Select * From Employees;

Select L.Location_name, MAX(e.SALARY) Maximum_salary
FROM Employees e
JOIN location L
ON e.location_id = l.location_id
GROUP BY L.Location_name;

-- AVG -average salary for each designation containing the word Analyst.
Use Employee;
Select * From Employees;

Select Designation,AVG(SALARY) Average_salary 
From Employees
Where Designation like "%Analyst%"
Group BY Designation;

-- Having  -- departments with less than 3 employees.
 Select D.Department_Name , Count(*) AS Employee_Count FROM  Employees E
 Join Departments D
 ON E.Department_id = D.Department_id
 Group by D.Department_name Having Count(*)<3
 Order by Employee_Count DESC;
 
 -- locations with female employees whose average age is below 30.
 Select* FROM Employees;
 SELECT *
 FROM Employees
 WHERE Gender = 'F';

SELECT L.Location_Name,AVG(E.Age) AS Average_Age
FROM Employees E
JOIN Location L
ON E.Location_id = L.Location_id
WHERE E.Gender = 'F'
GROUP BY L.Location_name
HAVING AVG(E.Age) < 30;

-- Joins
-- Inner Join -List employee names, their designations, and department names where employees are assigned to a department.
 select e.Employee_name, E.Designation,D.Department_name
 FROM Employees As E
 Inner JOIN Departments D
 ON E.Department_id = D.Department_id;
 
 -- Left Join -- List all departments along with the total number of employees in each department, including departments with no employees.
 Select * FROM Employees;
 SELECT D.Department_Name, COUNT(E.Employee_id) AS Employee_Count
 FROM Departments D
 LEFT JOIN Employees E
 ON D.Department_id = E.Department_id
 GROUP BY D.Department_Name;
 
 -- Right JOIN -Display all locations along with the names of employees assigned to each location. If no employees are assigned to a location, display NULL for employee name.
 Select * FROM Employees;
 SELECT L.Location_Name, E.Employee_Name
 FROM Employees E
 RIGHT JOIN Location L
 ON E.Location_id = L.Location_id
 ORDER BY L.Location_Name;
 



