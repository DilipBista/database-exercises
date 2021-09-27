# use employees;
SELECT * from salaries 
WHERE to_date >NOW();
SELECT current_salary.emp_no, current_salary.salary # outer query 
FROM (select *FROM salaries WHERE to_date>now()) as current_salary # inner query 
JOIN employees using (emp_no);



-- example 
-- current average salary 
select avg(salary)
from salaries 
where to_date > now();

-- find all employees whose current salary > average salary 
select emp_no, salary
from salaries 
where Salary > 
	(select avg(salary)
from salaries 
where to_date > now());

-- find all employees whose current salary > average salary   join 
select emp_no, salary
-- JOIN 
from salaries 
where Salary > 
	(select avg(salary)
from salaries 
where to_date > now());





-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
SELECT hire_date
FROM employees
WHERE emp_no = '101010';

SELECT  first_name, last_name, hire_date
from employees 
WHERE  hire_date =  (
		SELECT hire_date
		FROM employees
		WHERE emp_no = '101010'	
		
);



-- Find all the titles ever held by all current employees with the first name Aamod.
select emp_no
from employees 
JOIN titles using (emp_no)
where first_name = 'Aamod'
and  to_date> NOW()
; 

SELECT title, last_name, first_name 
from titles
JOIN employees using (emp_no)
where first_name IN  (
		select first_name
		from employees 
		where first_name = 'Aamod')
		AND 	to_date >CURDATE();



-- 3 How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT *
from dept_emp
JOIN employees using (emp_no)
where to_date > CURDATE(); 

SELECT COUNT(*)
FROM employees 
Where emp_no 
NOT IN  ( SELECT emp_no 
FROM dept_emp
WHERE to_date > NOW());

-- 4 Find all the current department managers that are female. List their names in a comment in your code.

select  *
FROM employees 
JOIN dept_manager USING(emp_no)
JOIN departments USING (dept_no)
WHERE gender = 'F' and dept_manager.to_date > CURDATE();




-- 5 Find all the employees who currently have a higher salary than the companies overall, historical average salary.

SELECT avg(salary) from salaries;

SELECT CONCAT(emp.first_name,' ',emp.last_name) as 'Employee Name', s.to_date, s.salary from salaries as s  
	JOIN  employees as emp on s.emp_no = emp.emp_no
		WHERE to_date > NOW()
 		AND salary > (SELECT avg(salary) from salaries) ;





-- 6 How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?

SELECT MAX(Salary) from salaries
WHERE to_date> NOW();
-- 158220


SELECT stddev(salary) from salaries 
	WHERE to_date > NOW();
-- 17309.96


--  lower limit 
select max(salary) - (select stddev(salary) from salaries
where to_date > NOW()) from salaries
where to_date > NOW();
-- 140910



-- # salaries in range 


/*
Hint Number 1 You will likely use a combination of different kinds of subqueries.
Hint Number 2 Consider that the following code will produce the z score for current salaries. */


-- 8 Hint Number 2 Consider that the following code will produce the z score for current salaries.

SELECT salary, 
    (salary - (SELECT AVG(salary) FROM salaries)) 
    / 
    (SELECT stddev(salary) FROM salaries) AS zscore
FROM salaries;


-- BONUS 
-- Find all the department names that currently have female managers.

select d.dept_name from departments as d 
join dept_manager as dm USING (dept_no) 
join employees USING (emp_no) 
where gender = 'F' and dm.to_date > curdate();

-- Find the first and last name of the employee with the highest salary.

select first_name, last_name, salary from salaries as s
join employees USING (emp_no)
where salary = (select max(salary) from salaries where to_date > curdate());


-- Find the department name that the employee with the highest salary works in.

select dept_name from departments as d 
join dept_emp using (dept_no) 
join employees USING (emp_no)
join salaries USING (emp_no)
where salary = (select max(salary) from salaries where to_date > curdate());
