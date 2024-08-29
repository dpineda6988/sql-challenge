--1. List the employee number, last name, first name, sex, and salary of each employee
--Join 'employees' and 'salaries' tables on 'emp_no' in order to select the desired fields (emp_no, last_name, first_name, sex, and salary)
SELECT e.emp_no as "employee number", last_name as "last name", first_name as "first name", sex, salary
FROM employees as e
JOIN salaries as s
ON e.emp_no = s.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986
--Select the desired fields (first_name, last_name, and hire_date) from the 'employees' table, using WHERE to show data where 'hire_date falls' within 1986-01-01 to 1986-12-31
SELECT first_name as "first name", last_name as "last name", hire_date as "hire date"
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name
--Since the table 'dept_manager' exclusively contains all managers, JOIN 'employees', 'dept_manager', and 'departments' tables using 'emp_no' and 'dept_no' to select the desired fields (dept_no, dept_name, emp_no, last_name, and first_name)
SELECT dep.dept_no as "department number", dept_name as "department name", e.emp_no as "manager's employee number", last_name as "last name", first_name as "first name"
FROM employees as e
JOIN dept_manager as dm ON dm.emp_no = e.emp_no
JOIN departments as dep ON dep.dept_no = dm.dept_no;

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name
--JOIN 'employees', 'dept_emp', and 'departments' tables using 'emp_no' and 'dept_no' to select the desired fields (dept_no, emp_no, last_name, first_name, and dept_name) 
--Note: Some employees work in more than one department so they will appear in the view more than once
SELECT dep.dept_no as "department number", e.emp_no as "employee number", last_name as "last name", first_name as "first name", dept_name as "department name"
FROM employees as e
JOIN dept_emp as demp ON demp.emp_no = e.emp_no
JOIN departments as dep ON dep.dept_no = demp.dept_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
--Select the desired fields (first_name, last_name, and sex) from the 'employees' table using WHERE to show data where first_name = 'Hercules' and last_name starts with B using LIKE operator
SELECT first_name as "first name", last_name as "last name", sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name
--SELECT emp_no, last_name, and first_name from the table 'employees' where 'emp_no' values for employees in the Sales Department are determined by a series of subqueries
SELECT emp_no as "Sales employee number", last_name as "last name", first_name as "first name"
FROM employees
WHERE emp_no IN
	--Subquery that returns the values of 'emp_no' from the 'dept_emp' table where 'dept_no' equals the values returned by the embedded subquery
	(
		SELECT emp_no
		FROM dept_emp
		WHERE dept_no IN
		--Subquery that returns the values of 'dept_no' from the 'departments' table where 'dept_name' equals 'Sales'
		(
			SELECT dept_no
			FROM departments
			WHERE dept_name = 'Sales'
		)
	)

--ALTERNATIVE SOLUTION: Join tables 'employees', 'dept_emp', and 'departments' on 'emp_no' and 'dept_no' in order to select the desired fields (emp_no, last_name, and first_name) where 'dept_name' equals 'Sales'
SELECT e.emp_no as "Sales employee number", last_name as "last name", first_name as "first name"
FROM employees as e
JOIN dept_emp as demp ON demp.emp_no = e.emp_no
JOIN departments as d ON d.dept_no = demp.dept_no
WHERE dept_name = 'Sales'


--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
--Join tables 'employees', 'dept_emp', and 'departments' on 'emp_no' and 'dept_no' in order to select the desired fields (emp_no, last_name, first_name, and dept_name) where 'dept_name' equals 'Sales' or 'Development'
SELECT e.emp_no as "employee number", last_name as "last name", first_name as "first name", dept_name as "department name"
FROM employees as e
JOIN dept_emp as demp ON demp.emp_no = e.emp_no
JOIN departments as d ON d.dept_no = demp.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'


--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
-- From the 'employees' table, select 'last_name' and use the COUNT aggregate function and GROUP BY clause to count the rows with a given last name (alias as 'frequency count')
-- ORDER BY is used to display the data in descending order based on the calculated 'frequency count'
SELECT last_name as "last name", COUNT(last_name) as "frequency count"
FROM employees
GROUP BY last_name
ORDER BY "frequency count" DESC