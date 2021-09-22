USE employee; 


-- 2. In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file. ( 7 ) 
USE titles;
SELECT DISTINCT title 
FROM titles; 



-- 3 . Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
USE employees; 
SELECT last_name
FROM employees 
WHERE (last_name LIKE '%E' AND  last_name like 'E%')
GROUP BY last_name;


-- 4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'. 846
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name like '%e' AND last_name like 'e%'
GROUP BY full_name; 




-- 5  Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.

SELECT last_name  
FROM employees 
WHERE last_name like '%q%' 
AND last_name NOT LIKE '%qu%'
GROUP BY last_name;



-- 6. Add a COUNT() to your results (the query above) to find the number of employees with the same last name. (  (189 +190+ 168 = 54) 

SELECT last_name,  COUNT(last_name)
FROM employees 
WHERE last_name like '%q%' 
AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

-- 7. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

SELECT first_name, count(first_name)
FROM employees 
Where (first_name = 'Irena' OR first_name = 'Vidya'  OR  first_name ='Maya' ) 
GROUP BY first_name;

-- Total Vidya 232, Irena, 241, Maya 236 

SELECT first_name AS 'First Name',             # adding sum function helps to combine genders and shown each gender separetely 
sum(gender='M') AS 'MALES', 
sum(gender='F') AS 'FEMALES'
FROM employees 
WHERE first_name IN ('Irena' , 'Vidya', 'Maya')
group by first_name;

-- Male Vidya 151, Irena 144, Maya 146 
SELECT gender, first_name, count(first_name).  # this is my approach but it doesnot shows two gender separetly in one table 
FROM employees 
WHERE (first_name = 'Irena' OR first_name = 'Vidya'  OR  first_name ='Maya')
AND gender = 'M' 
group by first_name;

-- Female  VIdya 81, Irena 97, Maya 90 
SELECT gender, first_name, count(first_name)  # # this is my approach but it doesnot shows two gender separetly in one table 
FROM employees 
WHERE (first_name = 'Irena' OR first_name = 'Vidya'  OR  first_name ='Maya')
AND gender = 'F' 
group by first_name;


-- 8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there? ( 6 duplicates) 

SELECT COUNT(LOWER( CONCAT( 
		 SUBSTR(first_name,1,1), #first initial of first name 
		 SUBSTR(last_name,1,4),  #first 4 of last name
		'_', 
		DATE_FORMAT(birth_date, '%m'), # month
		DATE_FORMAT(birth_date, '%y') # last two digits of year
		)))
		AS ALL_Usernames,
		
		COUNT(DISTINCT LOWER( CONCAT( 
		 SUBSTR(first_name,1,1), #first initial of first name 
		 SUBSTR(last_name,1,4),  #first 4 of last name
		'_', 
		DATE_FORMAT(birth_date, '%m'), # month
		DATE_FORMAT(birth_date, '%y') # last two digits of year
		)))
		AS Unique_Usernames,
		
		300024-285872 AS Duplicate_Usernames
		
FROM employees;
		

-- 9. More practice with aggregate functions:
/* Find the historic average salary for all employees. Now determine the current average salary.
Now find the historic average salary for each employee. Reminder that when you hear "for each" in the problem statement, you'll probably be grouping by that exact column.
Find the current average salary for each employee.
Find the maximum salary for each current employee.
Now find the max salary for each current employee where that max salary is greater than $150,000.
Find the current average salary for each employee where that average salary is between $80k and $90k.*/

-- Find the historic average salary for all employees. Now determine the current average salary.
SELECT avg(Salary) AS Historical_Average
FROM salaries;

SELECT avg(Salary) AS CURRENT_Average
FROM Salaries 
WHERE to_date > CURDATE();

-- find the historic average salary for each employee. Reminder that when you hear "for each" in the problem statement, you'll probably be grouping by that exact column.

SELECT emp_no AS EMployess, avg(salary) AS AvG_salary
FROM salaries
GROUP BY emp_no;

-- Find the current average salary for each employee.
SELECT emp_no AS Employees, avg(salary) AS AVG_salary 
FROM salaries
WHERE to_date > CURDATE()
GROUP BY emp_no;

-- Find the maximum salary for each current employee.
SELECT emp_no AS Employees, MAX(salary) AS Max_Salary 
FROM salaries 
WHERE to_date > CURDATE()
GROUP BY emp_no;

-- Now find the max salary for each current employee where that max salary is greater than $150,000.

SELECT emp_no AS Employee, MAX(salary) AS Maximum_Salary
FROM salaries
WHERE to_date > NOW() AND salary > 150000
GROUP BY emp_no;

-- Find the current average salary for each employee where that average salary is between $80k and $90k
SELECT emp_no AS Employee, avg(salary) AS Average_Salary
FROM salaries
WHERE to_date > NOW() AND (salary BETWEEN 80000 AND 90000)
GROUP BY emp_no;




