--USE farmers_market;
SELECT *
FROM market_date_info
WHERE market_min_temp < (
                        SELECT AVG (market_min_temp)
						FROM market_date_info
                        )
                            
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
JOIN dept_emp USING(emp_no)
WHERE to_date > CURDATE()
    AND hire_date = (SELECT hire_date
                    FROM employees
                    WHERE emp_no = 101010
                    );
                    

-- Find all the titles ever held by all current employees with the first name Aamod.

USE employees;

SELECT DISTINCT *
FROM titles
WHERE emp_no IN (SELECT emp_no
                FROM employees
                WHERE first_name = 'Aamod'
                AND to_date > CURDATE()
                );
             
-- there were to many duplicates so I used DISTINCT


/* How many people in the employees table are no longer working for the company? Give the answer in 
a comment in your code. */



USE employees;
SELECT emp_no, first_name
FROM employees
WHERE emp_no IN (SELECT emp_no
                FROM dept_emp
                WHERE to_date < CURDATE()
                );
                

-- 85108 people 


-- Find all the current department managers that are female. List their names in a comment in your code.


USE employees;

SELECT *
FROM dept_manager
WHERE to_date > CURDATE()
AND emp_no = (SELECT emp_no
	             FROM employees
	            WHERE gender LIKE '%F%'
                )
            

--13 from all time
-- 4 now

/* Find all the employees who currently have a higher salary than the companies overall, 
historical average salary. */

USE employees;

SELECT first_name, last_name
FROM employees 
WHERE to_date > CURDATE 
AND emp_no = (SELECT emp_no
				FROM salaries
				WHERE salary > (SELECT AVG(salary) 
                                FROM salaries)
                )
                
/*
SELECT *
FROM salaries
JOIN employees USING(emp_no)
WHERE to_date > CURDATE 
AND salary > (SELECT AVG(salary) 
                FROM salaries)
                AND to_date > CURDATE()
                */

--154543 people


/* How many current salaries are within 1 standard deviation of the current highest salary? 
    (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
	•	Hint You will likely use multiple subqueries in a variety of ways
	•	Hint It's a good practice to write out all of the small queries that you can. 
        Add a comment above the query showing the number of rows returned.
        You will use this number (or the query that produced it) in other, larger queries. */

/*
USE employees;

SELECT COUNT(salary)
FROM salaries
WHERE salary BETWEEN (
         SELECT AVG(salary) - STD(salary) FROM salaries)
    AND (SELECT AVG(salary) + STD(salary) FROM salaries)
    AND to_date > CURDATE();
    */


SELECT MAX(salary)
from salaries
where to_date > CURDATE()



SELECT COUNT(*)
from salaries
where to_date > CURDATE()
AND salary >= (
            SELECT MAX(salary)
            FROM salaries
            WHERE to_date > CURDATE() -
				SELECT STD(salary)
				FROM salaries
				WHERE to_date > CURDATE())
            





-- BONUS
-- Find all the department names that currently have female managers.


-- Find the first and last name of the employee with the highest salary.


-- Find the department name that the employee with the highest salary works in.