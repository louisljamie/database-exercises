

/* Use the employees database.
write a query that shows 
each department along with the name of the current manager for that department. 
first check out each table needed to use
manger table - manager number
dept_manager table 
employee table - employee name
employees table
department table - department name
dept_emp table
*/

USE employees;

SELECT d.dept_name AS 'Department Name', 
    CONCAT(e.first_name, ' ', e.last_name) AS 'Manager Name'
FROM employees AS e
JOIN dept_manager AS dm
    ON dm.emp_no = e.emp_no ON e.emp_no = dm.emp_no
    AND to_date > CURDATE()
JOIN departments AS d
    ON d.dept_no = dm.dept_no


/*
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;
*/


-- Find the name of all departments currently managed by women.

USE employees;

SELECT d.dept_name AS 'Department Name', 
    CONCAT(e.first_name, ' ', e.last_name) AS 'Manager Name'
FROM employees AS e

JOIN dept_manager AS dm
    ON dm.emp_no = e.emp_no ON e.emp_no = dm.emp_no
    AND to_date > CURDATE()
    AND e.gender = 'F'

JOIN departments AS d
    ON d.dept_no = dm.dept_no



-- Find the current titles of employees currently working in the Customer Service department.


USE employees;

SELECT  CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name', 
        COUNT(de.emp_no) AS 'Number of Titles',
        t.title AS 'Title'
FROM employees AS e

JOIN dept_emp AS de
    ON de.emp_no = t.emp_no

JOIN titles AS t
    ON t.emp_no = e.emp_no

JOIN departments AS d
    ON d.dept_no = de.dept_no

WHERE de.to_date > CURDATE() 
    AND d.dept_name = 'Customer Service' 
    AND t.to_date > CURDATE()

GROUP BY t.title



-- Find the current salary of all current managers.

USE employees;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name', 
    dm.dept_no AS 'Department Number', 
    s.salary AS 'Salary'
FROM employees AS e

JOIN dept_manager AS dm
    ON dm.emp_no = e.emp_no

JOIN salaries AS s
    ON s.emp_no = e.emp_no
WHERE dm.to_date > CURDATE() 
    AND s.to_date > CURDATE()



-- Find the number of current employees in each department.

USE employees;

SELECT d.dept_name AS 'Department Name', 
    COUNT(de.emp_no) AS 'Number of Employees'
FROM employees AS e

JOIN dept_emp AS de
    ON de.emp_no = e.emp_no

JOIN departments AS d
    ON d.dept_no = de.dept_no

WHERE de.to_date > CURDATE()

GROUP BY d.dept_name




-- Which department has the highest average salary? Hint: Use current not historic information.

USE employees;

SELECT d.dept_name AS 'Department Name', 
    AVG(s.salary) AS 'Average Salary'
FROM employees AS e

JOIN dept_emp AS de
    ON de.emp_no = e.emp_no

JOIN salaries AS s
    ON s.emp_no = e.emp_no

JOIN departments AS d
    ON d.dept_no = de.dept_no

WHERE de.to_date > CURDATE() 
    AND s.to_date > CURDATE()

GROUP BY d.dept_name
ORDER BY AVG(s.salary) DESC
LIMIT 1


-- Who is the highest paid employee in the Marketing department?

USE employees;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name', 
    d.dept_name AS 'Department Name', 
    s.salary AS 'Salary'
FROM employees AS e

JOIN dept_emp AS de
    ON de.emp_no = e.emp_no

JOIN salaries AS s
    ON s.emp_no = e.emp_no

JOIN departments AS d
    ON d.dept_no = de.dept_no

WHERE de.to_date > CURDATE() 
    AND s.to_date > CURDATE() 
    AND d.dept_name = 'Marketing'

ORDER BY s.salary DESC
LIMIT 1




-- Which current department manager has the highest salary?

USE employees;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name', 
    d.dept_name AS 'Department Name', 
    s.salary AS 'Salary'
FROM employees AS e

JOIN dept_manager AS dm
    ON dm.emp_no = e.emp_no

JOIN salaries AS s
    ON s.emp_no = e.emp_no

JOIN departments AS d
    ON d.dept_no = dm.dept_no

WHERE dm.to_date > CURDATE() AND s.to_date > CURDATE()

ORDER BY s.salary DESC
LIMIT 1




-- Determine the average salary for each department. Use all salary information and round your results.

USE employees;

SELECT d.dept_name AS 'Department Name', 
    ROUND(AVG(s.salary), 2) AS 'Average Salary'
FROM employees AS e

JOIN dept_emp AS de
    ON de.emp_no = e.emp_no

JOIN salaries AS s
    ON s.emp_no = e.emp_no

JOIN departments AS d
    ON d.dept_no = de.dept_no

GROUP BY d.dept_name
ORDER BY AVG(s.salary) DESC





--****** Bonus Find the names of all current employees, their department name, and their current manager's name.  *********


-- Bonus Who is the highest paid employee within each department. -- 

USE employees;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name', 
    d.dept_name AS 'Department Name', 
    s.salary AS 'Salary'
FROM employees AS e

JOIN dept_emp AS de
    ON de.emp_no = e.emp_no

JOIN salaries AS s
    ON s.emp_no = e.emp_no

JOIN departments AS d
    ON d.dept_no = de.dept_no

WHERE de.to_date > CURDATE() AND s.to_date > CURDATE()

GROUP BY d.dept_name, s.salary
ORDER BY s.salary DESC

--last

--1
