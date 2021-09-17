-- Use the employees database 

USE employees;

SHOW TABLES;
-- Different type of table--
-- Current_dep_emp, departments, dep_emp, dept_emp_latest_date, dep_manager, employees, salaries, title --

-- which table contains numberical strings-- 
-- empo_no, birth_data, hire_date

-- Which table(s) do you think contain a string type column?--
-- first_name, last_name, gender 

-- Which table(s) do you think contain a date type column?
-- birth_date

 -- What is the relationship between the employees and the departments tables?
 -- There is no similar in colums between departments and employees but all employess belong to one of the departments. 
 
 -- Show the SQL that created the dept_manager table.
 SHOW CREATE TABLE dept_manager;
 
 