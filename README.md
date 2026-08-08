# MY-SQL-Assignments
Using Mysql work bench ,design and manage this employee database using MySQL DDL commands, focusing on creating, modifying, and managing database objects while enforcing appropriate constraints to ensure data integrity and consistency.
# Employee Database Management System

## **1. Project Overview**

This project demonstrates MySQL DDL commands and constraints.

The database contains three tables:

* **Departments**
* **Locations**
* **Employees**

The project covers:

• Database creation
• Table creation
• Table alteration
• Table renaming
• Table truncation
• Table dropping
• Primary keys
• Foreign keys
• Unique constraints
• Not-null constraints
• Check constraints
• Default values
• Auto-increment

---

## **2. Database Structure**

### **Departments Table**

➤ `department_id` – Primary Key
➤ `department_name` – Department name

### **Locations Table**

➤ `location_id` – Primary Key
➤ `location_name` – Location name

### **Employees Table**

➤ `employee_id` – Primary Key
➤ `employee_name` – Employee name
➤ `gender` – Employee gender
➤ `age` – Employee age
➤ `hire_date` – Employee joining date
➤ `designation` – Job designation
➤ `salary` – Employee salary
➤ `department_id` – Foreign Key
➤ `location_id` – Foreign Key

---

# **Part A – DDL Commands**

## **3. Create Database**

Create the database:

```sql
CREATE DATABASE employee;
```

Select the database:

```sql
USE employee;
```

**Purpose:**

→ Creates a new database.
→ `USE` selects the database for further operations.

---

## **4. Create Departments Table**

```sql
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
```

**Key Points:**

▪ `department_id` uniquely identifies a department.
▪ `PRIMARY KEY` prevents duplicate and NULL values.
▪ `department_name` stores the department name.

---

## **5. Create Location Table**

```sql
CREATE TABLE Location (
    location_id INT PRIMARY KEY,
    location_name VARCHAR(100)
);
```

**Key Points:**

◆ `location_id` identifies each location.
◆ `location_name` stores the location name.
◆ Primary key prevents duplicate IDs.

---

## **6. Create Employees Table**

```sql
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    gender CHAR(1),
    age INT,
    hire_date DATE,
    designation VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    location_id INT,

    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),

    FOREIGN KEY (location_id)
        REFERENCES Location(location_id)
);
```

**Relationships:**

➜ `department_id` → References `Departments`
➜ `location_id` → References `Location`

---

## **7. Add Email Column**

```sql
ALTER TABLE Employees
ADD email VARCHAR(150);
```

**Purpose:**

• Adds an `email` column to Employees.
• Stores employee email addresses.

Example:

```text
john@gmail.com
```

---

## **8. Modify Designation**

```sql
ALTER TABLE Employees
MODIFY designation VARCHAR(200);
```

**Purpose:**

→ Increases the size of the designation column.
→ Allows longer job titles.

Example:

```text
Senior Software Development Manager
```

---

## **9. Drop Age Column**

```sql
ALTER TABLE Employees
DROP COLUMN age;
```

**Result:**

▪ The `age` column is removed.
▪ Existing age data is also removed.

---

## **10. Rename Hire Date**

```sql
ALTER TABLE Employees
RENAME COLUMN hire_date TO date_of_joining;
```

**Result:**

`hire_date` → `date_of_joining`

---

## **11. Rename Departments Table**

```sql
RENAME TABLE Departments TO Departments_Info;
```

**Result:**

`Departments` → `Departments_Info`

---

## **12. Rename Location Table**

```sql
RENAME TABLE Location TO Locations;
```

**Result:**

`Location` → `Locations`

---

## **13. Truncate Employees**

```sql
TRUNCATE TABLE Employees;
```

**Important Points:**

◆ Removes all records.
◆ Keeps the table structure.
◆ Keeps the columns.
◆ Keeps the constraints.

---

## **14. Drop Employees Table**

```sql
DROP TABLE Employees;
```

**Result:**

✦ Removes the Employees table.
✦ Removes its data.
✦ Removes its structure.

---

## **15. Drop Database**

```sql
DROP DATABASE employee;
```

**Warning:**

⚠ This permanently removes the database and its tables.

---

# **Part B – Constraints**

## **16. Recreate Database**

First remove the existing database:

```sql
DROP DATABASE IF EXISTS employee;
```

Create the database:

```sql
CREATE DATABASE employee;
```

Select it:

```sql
USE employee;
```

---

## **17. Departments Table with Constraints**

```sql
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);
```

**Constraints:**

✓ `PRIMARY KEY` → Unique department ID
✓ `NOT NULL` → Department name is mandatory
✓ `UNIQUE` → Duplicate department names are not allowed

---

## **18. Insert Departments**

```sql
INSERT INTO Departments
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing');
```

**Example Data:**

| ID | Department |
| -- | ---------- |
| 1  | IT         |
| 2  | HR         |
| 3  | Finance    |
| 4  | Marketing  |

Duplicate example:

```sql
INSERT INTO Departments
VALUES (5, 'IT');
```

✘ This fails because `IT` already exists.

---

## **19. Locations Table with Constraints**

```sql
CREATE TABLE Locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL UNIQUE
);
```

**Constraints:**

➤ `AUTO_INCREMENT` → Generates IDs automatically.
➤ `PRIMARY KEY` → Ensures unique IDs.
➤ `NOT NULL` → Location name is mandatory.
➤ `UNIQUE` → Duplicate locations are prevented.

---

## **20. Location Auto Increment**

```sql
INSERT INTO Locations (location_name)
VALUES ('Chennai');

INSERT INTO Locations (location_name)
VALUES ('Bangalore');

INSERT INTO Locations (location_name)
VALUES ('Mumbai');
```

MySQL generates:

```text
1 | Chennai
2 | Bangalore
3 | Mumbai
```

**Advantage:**

→ No need to manually enter `location_id`.

---

## **21. Duplicate Location**

```sql
INSERT INTO Locations (location_name)
VALUES ('Chennai');
```

✘ This fails because `location_name` is `UNIQUE`.

---

## **22. Employees Table with Constraints**

```sql
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    gender CHAR(1) NOT NULL,
    age INT NOT NULL,
    hire_date DATE DEFAULT (CURRENT_DATE),
    designation VARCHAR(200),
    salary DECIMAL(10,2),
    department_id INT,
    location_id INT,

    CONSTRAINT chk_gender
        CHECK (gender IN ('M', 'F')),

    CONSTRAINT chk_age
        CHECK (age >= 18),

    CONSTRAINT fk_department
        FOREIGN KEY (department_id)
        REFERENCES Departments(department_id),

    CONSTRAINT fk_location
        FOREIGN KEY (location_id)
        REFERENCES Locations(location_id)
);
```

---

## **23. Employee ID Constraint**

```sql
employee_id INT PRIMARY KEY
```

**Purpose:**

▪ Every employee must have a unique ID.
▪ Duplicate IDs are not allowed.
▪ NULL IDs are not allowed.

Example:

```sql
INSERT INTO Employees
(employee_id, employee_name, gender, age)
VALUES
(101, 'Arun', 'M', 25);
```

---

## **24. Employee Name Constraint**

```sql
employee_name VARCHAR(100) NOT NULL
```

**Purpose:**

→ Employee name must always be provided.
→ NULL names are not allowed.

Invalid example:

```sql
INSERT INTO Employees
(employee_id, employee_name, gender, age)
VALUES
(102, NULL, 'F', 25);
```

✘ The database rejects this record.

---

## **25. Gender Constraint**

```sql
CHECK (gender IN ('M', 'F'))
```

**Allowed:**

✓ `M`
✓ `F`

**Not Allowed:**

✘ `X`
✘ `Male`
✘ `Female`

Example:

```sql
INSERT INTO Employees
(employee_id, employee_name, gender, age)
VALUES
(103, 'Rahul', 'X', 25);
```

✘ This violates the gender constraint.

---

## **26. Age Constraint**

```sql
CHECK (age >= 18)
```

**Allowed:**

→ 18
→ 25
→ 30
→ 40

**Not Allowed:**

→ 17
→ 16
→ 15

Example:

```sql
INSERT INTO Employees
(employee_id, employee_name, gender, age)
VALUES
(104, 'John', 'M', 17);
```

✘ This violates the age constraint.

---

## **27. Default Hire Date**

```sql
hire_date DATE DEFAULT (CURRENT_DATE)
```

If the hire date is not provided, MySQL automatically assigns the current date.

Example:

```sql
INSERT INTO Employees
(employee_id, employee_name, gender, age)
VALUES
(105, 'Priya', 'F', 25);
```

**Result:**

`hire_date` → Current date

---

## **28. Department Foreign Key**

```sql
FOREIGN KEY (department_id)
REFERENCES Departments(department_id)
```

**Purpose:**

➜ Connects Employees with Departments.
➜ Ensures the department exists before assigning it to an employee.

Example:

```sql
INSERT INTO Employees
(employee_id, employee_name, gender, age, department_id)
VALUES
(106, 'Arun', 'M', 28, 1);
```

✓ Valid if department `1` exists.

---

## **29. Location Foreign Key**

```sql
FOREIGN KEY (location_id)
REFERENCES Locations(location_id)
```

**Purpose:**

➜ Connects Employees with Locations.
➜ Ensures the selected location exists.

Example:

```sql
INSERT INTO Employees
(employee_id, employee_name, gender, age, location_id)
VALUES
(107, 'Anitha', 'F', 26, 1);
```

✓ Valid if location `1` exists.

---

## **30. Sample Employee Data**

```sql
IInsert into Employees (Employee_id, Employee_Name, Department_id, location_id,Gender, Age, Hire_date, Designation, salary)
					Values ( '01','Naveen', 11, 1,'M', 18,'2023-05-12','Senior QA Analyst',50000.00),
						   ('02', 'Angeline', 12, 2,'F', 23,'2023-08-17','Data Analyst',40000.00),
						   ('03', 'Surya', 13, 3, 'F', 20,'2023-10-07','Senior data engineer',50000.00),
               ('04', 'Priya', 14, 4, 'F' , 28, '2023-11-25','Data engineer',70000.00),
               ('05', 'Jerusha', 15, 5,'F', 30, '2025-6-30','Gaming Engineer',80000.00);    
```

---

## **31. View Tables**

Display all tables:

```sql
SHOW TABLES;
```

---

## **32. View Table Structure**

```sql
DESCRIBE Departments;
```

```sql
DESCRIBE Locations;
```

```sql
DESCRIBE Employees;
```

---

## **33. View Data**

Departments:

```sql
SELECT * FROM Departments;
```

Locations:

```sql
SELECT * FROM Locations;
```

Employees:

```sql
SELECT * FROM Employees;
```

---


# **34. Constraints Summary**

| Constraint       | Purpose                     |
| ---------------- | --------------------------- |
| `PRIMARY KEY`    | Uniquely identifies records |
| `FOREIGN KEY`    | Creates relationships       |
| `NOT NULL`       | Prevents NULL values        |
| `UNIQUE`         | Prevents duplicate values   |
| `CHECK`          | Restricts values            |
| `DEFAULT`        | Provides automatic values   |
| `AUTO_INCREMENT` | Generates sequential IDs    |

---

# **35. DDL Commands Summary**

### **CREATE**

Creates a database or table.

```sql
CREATE DATABASE employee;
```

### **ALTER**

Modifies an existing table.

```sql
ALTER TABLE Employees
ADD email VARCHAR(150);
```

### **RENAME**

Renames a table.

```sql
RENAME TABLE Location TO Locations;
```

### **TRUNCATE**

Removes all records but keeps the table.

```sql
TRUNCATE TABLE Employees;
```

### **DROP**

Permanently removes a table or database.

```sql
DROP TABLE Employees;
```

```sql
DROP DATABASE employee;
```

---

# **36. Final Relationship**

```text
Departments
     |
     | department_id
     ↓
Employees
     ↑
     | location_id
     |
Locations
```

**Relationships:**

➤ One department can have many employees.
➤ One location can have many employees.
➤ Each employee belongs to a department.
➤ Each employee belongs to a location.
.......

![Image Alt](

![image Alt](https://github.com/itsmeangell30-cpu/MY-SQL-Assignments/blob/9bf2a64435acb14fa69549523307ce2176d5b774/DDL-Departmets-Output%20table.png)

37. Conclusion

This project demonstrates the use of MySQL DDL commands and constraints.

The final database provides:

◆ Unique employee identification
◆ Valid department relationships
◆ Valid location relationships
◆ Valid gender values
◆ Minimum age of 18
◆ Mandatory employee names
◆ Unique departments
◆ Unique locations
◆ Automatic location IDs
◆ Automatic hire dates

The database provides a simple and structured system for managing employee information.
