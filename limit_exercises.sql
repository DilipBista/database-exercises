use employees;

-- 2. MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. For example, to find all the unique titles within the company, we could run the following query:

-- List the first 10 distinct last name sorted in descending order.

SELECT DISTINCT last_name 
FROM employees 
ORDER BY last_name DESC
LIMIT 10;
 /* Zykh
Zyda
Zwicker
Zweizig
Zumaque
Zultner
Zucker
Zuberek
Zschoche
Zongker */

-- 3. Find all previous or current employees hired in the 90s and born on Christmas. Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. Write a comment in your code that lists the five names of the employees returned.

SELECT*
FROM employees 
WHERE birth_date LIKE '%12-25'
AND (hire_date BETWEEN '1990-01-001' AND '1999-12-31')
ORDER BY hire_date
LIMIT 5;

-- Last name : Cappello, mandell, Schreiter, Kushner, Stroustrup 

-- 4. Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results.

SELECT  first_name, last_name, emp_no
FROM employees
WHERE hire_date LIKE '199%' 
AND birth_date LIKE '%-12-25'
ORDER BY hire_date
LIMIT 5 OFFSET 45;
 
