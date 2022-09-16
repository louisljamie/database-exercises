-- Exercises:
-- 1. Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department.
CREATE temporary TABLE employees_with_departments AS t_emp (
    SELECT first_name, last_name, dept_name
    FROM employees.employees
    JOIN employees.dept_emp USING(emp_no)
    JOIN employees.departments USING(dept_no)
    WHERE to_date > curdate()
);


-- a Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
ALTER TABLE employees_with_departments add full_name VARCHAR(100);


-- b Update the full_name column to be the concatenation of the first_name and last_name columns

UPDATE employees_with_departments
SET full_name = concat(first_name, ' ', last_name);

-- c Remove the first_name and last_name columns from the table.

ALTER TABLE employees_with_departments DROP column first_name, DROP column last_name;


-- d What is another way you could have ended up with this same table?
CREATE temporary TABLE employees_with_departments AS t_emp
SELECT concat(first_name, " ", last_name) AS full_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
WHERE to_date > curdate();

/* Create a temporary table based on the payment table from the sakila database.
Write the SQL necessary to transform the amount column such that it is stored as an integer representing the 
number of cents of the payment. For example, 1.99 should become 199. */

CREATE temporary TABLE payments_in_cents AS t_emp
SELECT payment_id, customer_id, staff_id, rental_id, amount * 100 AS amount_in_cents, payment_date
FROM sakila.payment;



/* Find out how the current average pay in each department compares to the overall current 
pay for everyone at the company. In order to make the comparison easier, you should use the 
Z-score for salaries. In terms of salary, what is the best department right now to work for? The 
worst? */


SELECT AVG(salary), STD(salary) 
FROM employees.salaries 
WHERE to_date > NOW();

CREATE temporary TABLE overall_aggregates AS t_avg (
    SELECT AVG(salary) AS avg_salary, STD(salary) AS std_salary
    FOM employees.salaries  WHERE to_date > NOW()
);

SELECT dept_name, AVG(salary) AS avg_salary, 
    (AVG(salary) - (SELECT AVG(salary) 
                FROM employees.employees)) / (SELECT stddev(salary) 
                FROM employees.employees) AS z_score

FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
WHERE to_date > NOW()
GROUP BY dept_name
ORDER BY z_score DESC;


