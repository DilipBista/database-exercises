-- JOIN Example Database 
-- Create a file named join_exercise.sql 



-- 1. Use the join_example_db. Select all the records from both the users and roles tables.
Select * From users Join roles on 1=1;

--  OR 



-- 2. Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.


-- INNER JOIN 
SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;

-- LEFT JOIN 
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

-- RIGHT JOIN 
SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

-- 3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.

SELECT roles.name, COUNT(users.name) FROM roles
	JOIN users
GROUP BY roles.name;

-- EMPLOYEE DATABASE 

USE employees;

-- 2. Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

-- solution: CONCAT first_name and Last_name 
-- departments (dept_name + dept_no ) -------> Dept_manager (emp_no) ------> employee name  --

SELECT departments.dept_name, CONCAT(first_name, ' ', last_name) AS Full_name 
FROM employees as E 
	Join dept_manager AS dm
		ON dm.emp_no =E.emp_no 
	JOIN departments
		ON departments.dept_no = dm.dept_no;		
		
-- 3. Find the name of all departments currently managed by women.
	SELECT departments.dept_name AS 'Department Name', CONCAT(first_name,  ' ', last_name) AS 'Manager Name'
	FROM employees as E 
		JOIN dept_manager AS dm  USING (emp_no)
		JOIN departments 
			ON departments.dept_no = dm.dept_no
		WHERE dm.to_date > CURDATE() AND gender = 'F'; 
		
		
-- 4. Find the current titles of employees currently working in the Customer Service department.
	-- count (title) as Count 
	
		
	SELECT title, COUNT(title) AS Count
	FROM titles 
	 	JOIN dept_emp USING (emp_no)
			JOIN departments as D
			ON D.dept_no = dept_emp.dept_no
	WHERE titles.to_date > NOW() AND D.dept_name = 'Customer Service'
GROUP BY title;	


-- 5. Find the current salary of all current managers. 
-- SELECT DEPARTMENTS ---- > JOIN dep_manager -----> EMPloyee -------> salaries 
		
SELECT dep.dept_name, CONCAT(emp.first_name, ' ', emp.last_name) AS Name,
	MAX(sal.salary)
FROM departments AS dep
JOIN dept_manager AS dm
	ON dep.dept_no = dm.dept_no
JOIN employees AS emp
	ON emp.emp_no = dm.emp_no
JOIN salaries AS sal 
	ON sal.emp_no = emp.emp_no
WHERE dm.to_date > CURDATE()
GROUP BY dep.dept_name, Name;

-- 6 Find the number of current employees in each department.


SELECT dep.dept_no, dep.dept_name, count(emp_no) AS 'Num_employees '
	FROM dept_emp AS dp 
	JOIN departments as dep 
	ON dep.dept_no= dp.dept_no 
WHERE dp.to_date > CURDATE()
GROUP BY dep.dept_no, dept_name 
ORDER BY dep.dept_no;

-- 7. Which department has the highest average salary? Hint: Use current not historic information.
SELECT dp.dept_name, AVG(salary) AS average_salary
	FROM dept_emp AS de
		JOIN departments AS dp
	ON dp.dept_no = de.dept_no
		JOIN salaries s
	ON s.emp_no = de.emp_no
GROUP BY dp.dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- 8. Who is the highest paid employee in the Marketing department?
SELECT e.first_name AS first_name, e.last_name AS last_name
	FROM dept_emp AS de
		JOIN departments AS dp 
	ON de.dept_no = dp.dept_no
		JOIN employees AS e
	ON de.emp_no = e.emp_no
		JOIN salaries AS s
	ON s.emp_no = de.emp_no
WHERE dp.dept_name = 'Marketing'
GROUP BY first_name, last_name
ORDER BY MAX(salary) DESC
LIMIT 1;

-- 9. Which current department manager has the highest salary?
SELECT e.first_name, e.last_name,
		MAX(s.salary) AS salary, dp.dept_name
	FROM departments AS dp
		JOIN dept_manager AS dm
	ON dp.dept_no = dm.dept_no
		JOIN employees AS e
	ON e.emp_no = dm.emp_no
		JOIN salaries AS s
	ON s.emp_no = e.emp_no
WHERE dm.to_date > '2021-09-23'
GROUP BY e.first_name, e.last_name, dp.dept_name
ORDER BY salary DESC
LIMIT 1;




	






	
	








