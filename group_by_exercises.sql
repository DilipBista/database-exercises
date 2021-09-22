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


-- 4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
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



-- 6. Add a COUNT() to your results (the query above) to find the number of employees with the same last name. (  (189 +190+ 168 = 547) 

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

SELECT gender, first_name, count(first_name)
FROM employees 
WHERE (first_name = 'Irena' OR first_name = 'Vidya'  OR  first_name ='Maya')
AND gender = 'M' 
group by first_name;

-- Male Vidya 151, Irena 144, Maya 146 

-- Female  VIdya 81, Irena 97, Maya 90 
SELECT gender, first_name, count(first_name)
FROM employees 
WHERE (first_name = 'Irena' OR first_name = 'Vidya'  OR  first_name ='Maya')
AND gender = 'F' 
group by first_name;


-- 8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there? ( 6 duplicates) 

select DISTINCT concat(substr(lower(first_name), 1, 1), 
substr(lower(last_name), 1, 4), 
substr(birth_date, 6, 2), 
substr(birth_date, 3, 2)) AS  username, 
first_name, last_name, birth_date from employees;

-- 9. More practice with aggregate functions:
/* Find the historic average salary for all employees. Now determine the current average salary.
Now find the historic average salary for each employee. Reminder that when you hear "for each" in the problem statement, you'll probably be grouping by that exact column.
Find the current average salary for each employee.
Find the maximum salary for each current employee.
Now find the max salary for each current employee where that max salary is greater than $150,000.
Find the current average salary for each employee where that average salary is between $80k and $90k.*/



