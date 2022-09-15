/*
Different Types of SQL JOINs
Here are the different types of the JOINs in SQL:
	•	(INNER) JOIN: Returns records that have matching values in both tables
	•	LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
	•	RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
	•	FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table 
*/

-- Explore the indexes in the employees database

USE employees;
SHOW INDEXES FROM employees

-- Explore the indexes in the employees database

USE employees;
DESCRIBE departments

-- Add a unique constraint to our test database, We can use the ALTER statement to update a table.

ALTER TABLE quotes
ADD UNIQUE (content);

-- Use the join_example_db. Select all the records from both the users and roles tables.

USE join_example_db;

SELECT *
FROM users a
INNER JOIN 
	roles b
	ON 
    a.role_id = b.id;


/* Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson.
Before you run each query, guess the expected number of results. */

USE join_example_db;
SELECT *
FROM users a
LEFT JOIN 
	roles b
	ON 
    a.role_id = b.id;



---------------------------------------------------------------------

USE join_example_db;
SELECT *
FROM users a
RIGHT JOIN 
	roles b
	ON 
    a.role_id = b.id;


/* Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries.
Use count and the appropriate join type to get a list of roles along 
with the number of users that has the role. Hint: You will also need to use group by in the query. */

SELECT roles.name AS role_name, 
    COUNT(users.name) AS user_count
FROM users
RIGHT JOIN roles
    ON users.role_id = roles.id
GROUP BY roles.name;


/* 
INNER JOIN - where there is a match in both tables.
LEFT JOIN - 
RIGHT JOIN 
*/





/* Use the employees database.
write a query that shows 
each department along with the name of the current manager for that
department. 
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
JOIN departments AS -- d USING (dept_no) -- same as ON d.dept_no = dm.dept_no because they are the same column name and table, 
                    -- so we can use USING to make it easier to read and cannot be used anywhere else
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

JOIN departments AS -- d USING (dept_no) -- same as ON d.dept_no = dm.dept_no because they are the same column name and table, 
                    -- so we can use USING to make it easier to read and cannot be used anywhere else
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
    --ROUND(AVG(s.salary), 2) DESC
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
