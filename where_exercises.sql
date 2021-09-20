USE employees;
-- 2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
SELECT *
FROM employees 
Where first_name IN ('Irena', 'Vidya', 'Maya');



-- 709 records 



-- 3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?

SELECT *
FROM employees 
Where first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
-- 709 records 

-- 4 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned. 

SELECT *
FROM employees 
Where (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya')
AND gender = 'M';
-- 441 records 

-- 5. Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
SELECT *
FROM employees 
WHERE last_name LIKE 'e%';
-- 7330 records 

-- 6. Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?


SELECT * FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%E';
-- 30723

SELECT COUNT(*) FROM employees
WHERE (NOT last_name LIKE 'E%') AND last_name LIKE '%E';
-- 23393

-- 7. Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?
SELECT *
from employees 
WHERE last_name like '%e' AND last_name like 'e%';

SELECT COUNT(*) FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E';

-- 899
SELECT *
from employees 
WHERE last_name like '%e' ;
-- 24292 



-- 8. Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
SELECT *
FROM employees 
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
-- 135214

-- 9. Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
SELECT *
FROM employees 
WHERE birth_date like '%12-25';
-- 842

-- 10. Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.

SELECT *
FROM employees 
WHERE (hire_date BETWEEN '1990-01-01' AND '1999-12-31')
AND birth_date LIKE '%12-25';

-- 362

-- 11. Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.

SELECT *
FROM employees 
WHERE last_name LIKE '%q%';
-- 1873 

-- 12. Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
SELECT *
FROM employees 
WHERE last_name LIKE '%q%' AND NOT last_name LIKE '%qu%';
-- 547



 