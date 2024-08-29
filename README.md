# sql-challenge
# EmployeeSQL

An entity-relationship diagram(ERD), table schemata, and analysis queries for a PostgreSQL database created with pgAdmin

## Description

As a hypothetical data engineer at Pewlett Hackard (a fictional company), I've been tasked with doing a research project about people whom the company employed during the 1980s and 1990s. All that remains of the employee database from that period are six CSV files.  Using these files, I've modeled an entity-relationship diagram for a new database to house the file data.  Using pgAdmin, I then created a PostgreSQL database based on the ERD via pgAdmin and uploaded the data for analysis.  Several SQL queries were then created in order to display the following views:

1. List the employee number, last name, first name, sex, and salary of each employee.

2. List the first name, last name, and hire date for the employees who were hired in 1986.

3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

6. List each employee in the Sales department, including their employee number, last name, and first name.

7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).  


### Dependencies
* PostgreSQL
* pgAdmin
* The following .csv files are required in order to populate the database (contained in the 'data' folder ):
    * titles.csv
    * employees.csv
    * salaries.csv
    * dept_manager.csv
    * dept_emp.csv
    * departments.csv


### Installing & Execution
1. Open 'employeesql_table schemata.sql' in pgAdmin and run the queries in lines 1-60 to create the tables into a PostgreSQL database.

(**Note: While the tables can be created in an existing database, it is recommended to create a new dedicated database since the file includes code that will drop any duplicate named tables that may exist**)

2. Once the tables are created, use the Import/Export tool in pgAdmin to import the data from the .csv files located in the 'data' folder into their respective tables of the same name (ex: import data from 'departments.csv' into table 'departments).  To avoid errors, import the data in the same order as the corresponding tables were created and account for the headers when doing the imports.

3. Lines 63-80 of 'employeesql_table schemata.sql' can be run to verify that the data has been populated into the tables

4. Once the tables have been created and populated, open 'employeesql_analysis queries.sql' in pgAdmin.  The queries to create the several desired views can be run individually for analysis.

## Authors

Daniel Pineda

## Acknowledgments
EmployeeSQL was created as an assignment for the University of California, Irvine Data Analytics Bootcamp - June 2024 Cohort under the instruction and guidance of Melissa Engle (Instructor) and Mitchell Stone (TA).
The practical exercises and coding examples demonstrated through the bootcamp helped inform and inspire the code for this project.