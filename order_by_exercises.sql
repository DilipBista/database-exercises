use employees;

-- 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

SELECT *
from employees 
Where first_name = "Irena" OR first_name = 'Vidya' OR first_name = 'Maya'
ORDER BY first_name;

-- Irena Retenauer 
-- Vidya Simmen 

-- 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

SELECT*
FROM employees 
Where first_name = 'Irena' OR first_name= 'Vidya' OR first_name = 'Maya'
ORDER BY first_name, last_name;
-- Irena Acton 
-- Vidya Zweizig 

-- 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
SELECT *
FROM employees 
WHERE first_name = 'Irena' OR first_name= 'Vidya' OR first_name = 'Maya'
ORDER BY last_name, first_name; 
-- Irena Acton 
-- Maya Zyda 

-- 5. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.

SELECT*
FROM employees 
WHERE last_name like '%e' AND last_name like 'e%'
ORDER BY emp_no;

-- Rmzi Rrde 
-- Tadahiro Erde 


-- 6. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee.
SELECT *
FROM employees
WHERE last_name like '%e' AND last_name like 'e%'
ORDER BY hire_date DESC;

-- Teiji Eldridge 

SELECT *
FROM employees
WHERE last_name like '%e' AND last_name like 'e%'
ORDER BY birth_date DESC;
-- Piyush Erbe 

SELECT COUNT(*) FROM employees
WHERE last_name like '%e' AND last_name like 'e%'
ORDER BY hire_date ;

-- 899 

-- 7. Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first. 
SELECT *
FROM employees 
Where (hire_date BETWEEN '1990-01-01' AND '1999-12-31')
AND birth_date LIKE '%12-25'
ORDER BY  hire_date;

-- Aselmn Cappello 
--  KHUN Bernini 

 



