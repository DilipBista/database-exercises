show databases;
use employees;

-- 2 Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

Select dept_name as 'Department Name', CONCAT(emp.first_name, ' ',emp.last_name) as 'Department Manager'
from employees AS emp 
JOIN dept_manager as dm USING (emp_no)
JOIN departments as d USING (dept_no)
WHERE dm.to_date > NOW()
order by dept_name;

/* 
  Department Name    | Department Manager
 --------------------+--------------------
  Customer Service   | Yuchang Weedman
  Development        | Leon DasSarma
  Finance            | Isamu Legleitner
  Human Resources    | Karsten Sigstam
  Marketing          | Vishwani Minakawa
  Production         | Oscar Ghazalie
  Quality Management | Dung Pesch
  Research           | Hilary Kambil
  Sales              | Hauke Zhang
  */
  
  -- 3. Find the name of all departments currently managed by women. 
  
 /* 
 Department Name | Manager Name
----------------+-----------------
Development     | Leon DasSarma
Finance         | Isamu Legleitner   dept_name as 'Departent Name', 
Human Resources | Karsetn Sigstam
Research        | Hilary Kambil
*/

SELECT dept_name as 'Department Name' , CONCAT(emp.first_name, ' ', emp.last_name) AS 'Department Manager', gender 
FROM employees as emp
JOIN dept_manager as dm USING (emp_no)
JOIN departments as d USING (dept_no)
WHERE dm.to_date > CURDATE() and gender ='F'
ORDER BY dept_name; 

-- 4. Find the current titles of employees currently working in the Customer Service department.
/* Title              | Count
-------------------+------
Assistant Engineer |    68
Engineer           |   627
Manager            |     1
Senior Engineer    |  1790
Senior Staff       | 11268
Staff              |  3574
Technique Leader   |   241 , COUNT(title)
*/


SELECT title, COUNT(*) as Count 
FROM titles as t 
JOIN dept_emp as dm USING (emp_no)
JOIN departments as d USING (dept_no)
WHERE t.to_date > NOW() 
AND dept_name = 'Customer Service'
GROUP BY title;

-- 5 Find the current salary of all current managers.
/* 
Department Name    | Name              | Salary
-------------------+-------------------+-------
Customer Service   | Yuchang Weedman   |  58745
Development        | Leon DasSarma     |  74510
Finance            | Isamu Legleitner  |  83457
Human Resources    | Karsten Sigstam   |  65400
Marketing          | Vishwani Minakawa | 106491
Production         | Oscar Ghazalie    |  56654
Quality Management | Dung Pesch        |  72876
Research           | Hilary Kambil     |  79393.     dept_name as 'Department Name',  
Sales              | Hauke Zhang       | 101987
*/


SELECT dept_name as 'Department Name', CONCAT(first_name, ' ', last_name) as 'NAME', Salary 
from salaries as S 
Join dept_manager as dm using (emp_no)
JOIN departments as d using (dept_no)
JOIN employees as emp USING (emp_no)
WHERE S.to_date > CURDATE()
AND dm.to_date > curdate()
ORDER BY dept_name;


-- 6. Find the number of current employees in each department. 

/* 
+---------+--------------------+---------------+
| dept_no | dept_name          | num_employees |
+---------+--------------------+---------------+
| d001    | Marketing          | 14842         |
| d002    | Finance            | 12437         |
| d003    | Human Resources    | 12898         |
| d004    | Production         | 53304         |
| d005    | Development        | 61386         |
| d006    | Quality Management | 14546         |
| d007    | Sales              | 37701         |
| d008    | Research           | 15441         |
| d009    | Customer Service   | 17569         |
+---------+--------------------+---------------+
*/

SELECT dept_no, dept_name, COUNT(*) as 'num_employees'
from employees 
JOIN dept_emp as de USING (emp_no) 
JOIN departments as d using (dept_no)
WHERE de.to_date > NOW()
GROUP BY dept_no;

-- 7 Which department has the highest average salary? Hint: Use current not historic information.
/*
+-----------+----------------+
| dept_name | average_salary |
+-----------+----------------+
| Sales     | 88852.9695     |
+-----------+----------------+
*/

SELECT dept_name, avg(salary) as 'average_salary'
FROM salaries as s
JOIN dept_emp as de USING (emp_no)
JOIN departments as d USING (dept_no)
WHERE s.to_date > CURDATE()
AND de.to_date > CURDATE()
group by dept_name
ORDER BY avg(salary) DESC
limit 1;


-- 8 Who is the highest paid employee in the Marketing department?

/*
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Akemi      | Warwick   |
+------------+-----------+
*/

SELECT first_name, last_name, salary 
from salaries as s 
JOIN employees USING (emp_no)
JOIN dept_emp as de USING (emp_no)
JOIN departments as d USING (dept_no)
WHERE s.to_date > NOW()
AND de.to_date > NOW()
AND dept_name = 'Marketing'
ORDER by salary DESC
Limit 1;

-- 9 Which current department manager has the highest salary
SELECT first_name, last_name, salary, dept_name 
FROM salaries as s 
JOIN dept_manager as dm USING (emp_no)
JOIN employees as emp USING (emp_no)
JOIN departments as d using (dept_no)
WHERE s.to_date >now() 
AND dm.to_date > NOW() 
ORDER by salary DESC
LIMIT 1;

-- 10 Determine the average salary for each department. Use all salary information and round your results.
SELECT dept_name,  ROUND (AVG(Salary)) as average_salary
FROM departments as d
JOIN dept_emp as de using (dept_no)
JOIN salaries using (emp_no)
group by dept_name; 

-- 11 BONUS Bonus Find the names of all current employees, their department name, and their current manager's name.

SELECT DISTINCT CONCAT(first_name, ' ',last_name) as 'Employee Name', dept_name as 'Department Name'
FROM employees 
JOIN dept_emp as de using (emp_no)
JOIN departments as d using (dept_no)
ORDER by dept_name;

Select CONCAT(first_name, ' ', last_name) AS 'Manager Name'
FROM dept_manager
JOIN employees as e USING (emp_no);


-- 11. Bonus Find the names of all current employees, their department name, and their current manager's name.


 






 
 





