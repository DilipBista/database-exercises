
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

SELECT COUNT(*),
	CASE 
	WHEN birth_date LIKE '195%' THEN '50s'
	WHEN birth_date LIKE '196%' THEN '60s'
	ELSE 0
	end as decade
from employees as old
GROUP BY decade;

/*
select COUNT(*)
FROM 
	(SELECT 
	CASE 
		WHEN birth_date LIKE '195%' THEN '50s' 
		WHEN birth_date LIKE '196%' THEN '60s' 
		ELSE 'Null'
	end as decade
from employees)as ts
group By decade;
*/
/*
SELECT 
	CASE 
		WHEN birth_date LIKE '195%' THEN '50s' 
		WHEN birth_date LIKE '196%' THEN '60s' 
		ELSE 'Null'
	end as decade
from employees;
*/

-- BONUS 
-- 1. What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?


SELECT dept_name, avg(salary)
From departments
JOIN dept_emp USING (dept_no)
JOIN salaries USING (emp_no)
group By dept_name;

SELECT 
	CASE
		  WHEN dept_name IN ('research', 'development') THEN 'R&D'
           WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing' 
           WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
           WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
           ELSE dept_name
           END AS dept_group,
           	ROUND (avg(salary),2)as avg_salary
           FROM departments
           JOIN dept_emp USING (dept_no)
		JOIN salaries USING (emp_no)
		WHERE salaries.to_date >now()
		GROUP BY dept_group;
	

/* checking dept_name and avg(salary)

select dept_name, avg(salary)
 FROM departments
         JOIN dept_emp USING (dept_no)
		JOIN salaries USING (emp_no)
		group by dept_name;
*/

/*
Individual average 
Marketing	71913.2000
Finance	70489.3649
Human Resources	55574.8794
Production	59605.4825
Development	59478.9012
Quality Management	57251.2719
Sales	80667.6058
Research	59665.1817
Customer Service	58770.3665

not current average 
78235.8136	Sales & Marketing
62960.5156	Finance & HR
59101.7450	Prod & QM
59515.8784	R&D
58770.3665	Customer Service
*/

