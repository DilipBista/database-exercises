 functions_exercises.sql

 USE employees;



 # 1 Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.
  -- Ans.: - A file named order_by_exercises.sql has been created abd copying of contents as requested has been performed.

 # 2 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
 SELECT * FROM employees
 WHERE first_name IN ('Irena', 'Vidya', 'Maya')
 ORDER BY first_name;

 /*
 First Row: Irena Reutenauer
 Last Row: Vidya Simmen
 */


 # 3 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
 SELECT * FROM employees
 WHERE first_name IN ('Irena', 'Vidya', 'Maya')
 ORDER BY first_name, last_name;
 /*
 First Row: Irena Acton
 Last Row: Vidya Zweizig
 */

 # 4 Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
 SELECT * FROM employees
 WHERE first_name IN ('Irena', 'Vidya', 'Maya')
 ORDER BY last_name, first_name;
 /*
 First Row: Irena Acton
 Last Row:  Maya Zyda
 */

 # 5 Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
 SELECT * FROM employees
 WHERE last_name LIKE 'E%' and last_name LIKE '%E'
 ORDER BY emp_no;

 SELECT count(*) FROM employees
 WHERE last_name LIKE 'E%' and last_name LIKE '%E'
 ORDER BY emp_no;
 /*
 899
 First Row: Irena Acton
 Last Row:  Maya Zyda
 */

 # 6 Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest emmployee.
 SELECT * FROM employees
 WHERE last_name LIKE 'E%' and last_name LIKE '%E'
 ORDER BY hire_date desc;

 SELECT count(*) FROM employees
 WHERE last_name LIKE 'E%' and last_name LIKE '%E'
 ORDER BY hire_date desc;

 /*
 899
 First Row: Teiji Eldridge
 Last Row:  Sergi Erde
 */

 # 7 Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest emmployee who was hired first.
 SELECT * FROM employees
 WHERE (hire_date between '1990-01-01' and '1999-12-31')
      and birth_date like '%-12-25'
      order by hire_date;

 SELECT count(*) FROM employees
 WHERE (hire_date between '1990-01-01' and '1999-12-31')
      and birth_date like '%-12-25'
      order by hire_date;

 /*
 362
 First Row: Aselmn Cappello
 Last Row: Khun Bernini
*/

# 1. Copy the order by exercise and save it as functions_exercises.sql.
-- Ans.: - Performed.

# 2 Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
 SELECT concat(first_name, ' ' ,last_name) as Full_Name FROM employees
 WHERE last_name LIKE 'E%' and last_name LIKE '%E';


# 3. Convert the names produced in your last query to all uppercase.
SELECT upper(concat(first_name, ' ' ,last_name)) as Full_Name_Upper FROM employees
 WHERE last_name LIKE 'E%' and last_name LIKE '%E';


# 4. Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),

 SELECT datediff(curdate(), hire_date) as DAYS_IN_OFFICE FROM employees
 WHERE (hire_date between '1990-01-01' and '1999-12-31')
      and birth_date like '%-12-25';

# 5. Find the smallest and largest current salary from the salaries table.

SELECT min(salary) as smallest_salary, max(salary) as largest_salary FROM salaries;
# 6. Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:

select concat(substr(lower(first_name), 1, 1), 
substr(lower(last_name), 1, 4), 
substr(birth_date, 6, 2), 
substr(birth_date, 3, 2))      as username,
first_name, last_name, birth_date from employees;
