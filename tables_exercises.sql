-- Use the employees database 

USE employees;

SHOW TABLES;
-- Different type of table--
--int, date, varchar, enum, date 
describe employees;
-- which table contains numberical strings-- 
show tables; 
-- probably all of them, because all should have a primary key 


-- Which table(s) do you think contain a string type column?--
-- employees, titles, departments 

-- Which table(s) do you think contain a date type column?
-- dept_emp_latest_date, employee, titles, salaries, employees, dept_manager, departments, current_dep_emp 

 -- What is the relationship between the employees and the departments tables?
 -- There is no similar in colums between departments and employees but all employess belong to one of the departments. 
 
 -- Show the SQL that created the dept_manager table.
 SHOW CREATE TABLE dept_manager;
 
 