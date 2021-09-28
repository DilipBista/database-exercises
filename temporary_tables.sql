use hopper_1552;

CREATE TEMPORARY TABLE hopper_1552.employees_with_departments AS 
SELECT first_name, last_name, dept_name 
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;
select database();
select * FROM employees_with_departments;
-- 1a. 
ALTER TABLE employees_with_departments ADD COLUMN full_name VARCHAR(50) NOT NULL;
UPDATE employees_with_departments
	SET full_name = CONCAT(first_name,' ',last_name);

-- 1b. 
select * FROM employees_with_departments;

-- 1c. Remove the first_name and last_name columns from the table.
ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;
ALTER TABLE employees_with_departments DROP COLUMN payment;

-- 1d What is another way you could have ended up with this same table? 


-- 2.
 /*Create a temporary table based on the payment table from the sakila database.

Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.*/

use hopper_1552;


CREATE TEMPORARY TABLE hopper_1552.payments AS 
SELECT customer_id, payment_id, amount
FROM sakila.payment
LIMIT 50;
select database();
select * FROM payments
ALTER TABLE payments ADD amount_round INT;
UPDATE payments 
	SET amount_round = amount *100;
	

/* 3. Find out how the current average pay in each department compares to the overall, historical average pay. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst? 
*/



use hopper_1552;
USE employees;
CREATE TEMPORARY TABLE hopper_1552.departments_salary AS (
SELECT emp_no, first_name, last_name, dept_name, salary
FROM employees 
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
JOIN employees.salaries using(emp_no));
use hopper_1552;
select database();
select * FROM departments_salary;
ALTER TABLE departments_salary ADD amount_round INT; # 
-- solutions 
USE employees;
CREATE TEMPORARY TABLE hopper_1552.departments_name AS (
SELECT  avg(salary), dept_name # current avg  salary 
FROM salaries 
JOIN dept_emp using (emp_no)
JOIN departments using (dept_no)
WHERE salaries.to_date >now()
GROUP BY dept_name);
USE hopper_1552;
select database();
select * FROM departments_name;
USE employees;
SELECT avg(salary) from salaries; # historic average 

-- avg 63810.7448 
use hopper_1552;
SELECT STDDEV(salary) from salaries;
-- sd 16904.8282800014
ALTER TABLE departments_name ADD avg_sal float;
ALTER TABLE departments_name ADD std_sal float;
update departments_name
	set avg_sal = 63810.7448; 
update departments_name
	set std_sal = 16904.8282800014;
	select * from departments_name;

ALTER TABLE departments_name ADD z_zcore float; 
update departments_name 
set z_zcore = (`avg(salary)`- avg_sal) / std_sal; # ( (current average - historic average) / standard deviation of salaries )
select * from departments_name
ORDER BY  z_zcore DESC;
	








