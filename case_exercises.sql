
-- case_exercise 


-- 1 Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. 

use employees;
select * from employees;



select emp_no, dept_no, from_date, to_date
from dept_emp;

SELECT emp_no, dept_no, from_date, to_date,
	case 
	WHEN to_date > CURDATE() THEN 1 
	ELSE 0
	END AS is_current_employee
	
from dept_emp;
	
-- 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

select * from employees;

SELECT first_name, last_name, 
	case 
	WHEN last_name BETWEEN 'A' AND 'H' THEN 'A-H'
	WHEN last_name BETWEEn 'I' AND 'Q' THEN 'I-Q'
	WHEN last_name BETWEEN 'R' AND 'Z' THEN 'R-Z'
	ELSE 'Other'
	END AS 'alpha_group'
FROM employees; 

-- 3. How many employees (current or previous) were born in each decade?
select * from employees;

SELECT first_name, last_name, birth_date,
	CASE 
	WHEN birth_date LIKE '195%' THEN '50s'
	WHEN birth_date LIKE '196%' THEN '60s'
	
	end as decade
from employees;

SELECT COUNT('50s'), COUNT('60s')
FROM 
	(SELECT first_name, last_name, birth_date,
	CASE 
	WHEN birth_date LIKE '195%' THEN '50s'
	WHEN birth_date LIKE '196%' THEN '60s'
	
	end as decade
from employees)as t;


-- BONUS 
-- 1. What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?


SELECT dept_name, salary
From departments
JOIN dept_emp USING (dept_no)
JOIN salaries USING (emp_no);








