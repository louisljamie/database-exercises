--USE farmers_market;
SELECT *
FROM market_date_info
WHERE market_min_temp < (SELECT AVG (market_min_temp)
							FROM market_date_info)
                            
ORDER BY market_year;
    
    
--USE farmers_market;
SELECT *
FROM vendor_booth_assignments
WHERE market_date LIKE '2019%';

SELECT *
FROM vendor
WHERE VENDOR_ID IN (1)

-- Find all the current employees with the same hire date as employee 101010 using a sub-query.

USE employees;

SELECT *
FROM employees
WHERE hire_date = (SELECT hire_date
                    FROM employees
                    WHERE emp_no = 101010
                    );


-- Find all the titles ever held by all current employees with the first name Aamod.

USE employees;

SELECT *
FROM titles
WHERE emp_no IN (SELECT emp_no
                FROM employees
                WHERE first_name = 'Aamod'
             );  



/* How many people in the employees table are no longer working for the company? Give the answer in 
a comment in your code. */



USE employees;
SELECT emp_no, first_name
FROM employees
WHERE emp_no IN (
                SELECT emp_no
                FROM dept_emp
                WHERE to_date < CURDATE()
                );
                


-- Find all the current department managers that are female. List their names in a comment in your code.


USE employees;

SELECT *
FROM dept_manager
WHERE emp_no IN (SELECT emp_no
	             FROM employees
	            WHERE gender LIKE '%F%'
                )
            



/* Find all the employees who currently have a higher salary than the companies overall, 
historical average salary. */

USE employees;

SELECT first_name, last_name
FROM employees 
WHERE emp_no IN (SELECT emp_no
				FROM salaries
				WHERE salary > (SELECT AVG(salary) FROM salaries)
                )
                


/* How many current salaries are within 1 standard deviation of the current highest salary? 
    (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
	•	Hint You will likely use multiple subqueries in a variety of ways
	•	Hint It's a good practice to write out all of the small queries that you can. 
        Add a comment above the query showing the number of rows returned.
        You will use this number (or the query that produced it) in other, larger queries. */




-- BONUS
-- Find all the department names that currently have female managers.


-- Find the first and last name of the employee with the highest salary.


-- Find the department name that the employee with the highest salary works in.