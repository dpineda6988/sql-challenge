-- Drop any previous versions of the tables that may exist
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;

--Create table called 'titles'
CREATE TABLE titles (
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR NOT NULL
);

--Create table called 'employees' that has foreign key 'emp_title_id' referencing 'title_id'from 'titles' table
CREATE TABLE employees (
	emp_no INTEGER PRIMARY KEY,
	emp_title_id VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

--Create table called 'salaries' that has foreign key 'emp_no' referencing 'emp_no' from 'employees' table
--Composite primary key formed from 'emp_no' and 'salary'
CREATE TABLE salaries (
	emp_no INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INTEGER,
	PRIMARY KEY (emp_no, salary)
);

--Create table called 'departments'
CREATE TABLE departments (
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR NOT NULL
);

--Create table called 'dept_emp' that has foreign key 'emp_no' referencing 'emp_no' from 'employees' table and foreign key 'dept_no' referencing 'dept_no' from 'departments' table
--Composite primary key formed from 'emp_no' and 'dept_no'
CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

--Create table called 'dept_manager' that has foreign key 'dept_no' referencing 'dept_no' from 'departments' table and foreign key 'emp_no' referencing 'emp_no' from 'employees' table
--Composite primary key formed from 'dept_no' and 'emp_no'
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);


--After importing data into the tables from their respective .csv files via the pgAdmin Import/Export tool, verify that the data populated correctly
--Verify data from 'titles.csv' populated table 'titles'
SELECT * FROM titles;

--Verify data from 'employees.csv' populated table 'employees'
SELECT * FROM employees;

--Verify data from 'salaries.csv' populated table 'salaries'
SELECT * FROM salaries;

--Verify data from 'departments.csv' populated table 'departments'
SELECT * FROM departments;

--Verify data from 'dept_emp.csv' populated table 'dept_emp'
SELECT * FROM dept_emp;

--Verify data from 'dept_manager.csv' populated table 'dept_manager'
SELECT * FROM dept_manager;