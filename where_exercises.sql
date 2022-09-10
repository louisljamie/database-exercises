-- 1. Create a file named where_exercises.sql. Make sure to use the employees database.

USE employees;

-- 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

--709

/* 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. 
Enter a comment with the number of records returned. Does it match number of rows from Q2? (709 observations; it matches.) */

SELECT *
FROM employees
WHERE first_name = 'Irena' 
    OR first_name = 'Vidya' 
    OR first_name =  'Maya';

-- YES

-- 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', using OR, AND who is male. Enter a comment with the number of records returned.

FROM employees
WHERE gender = 'M'
AND 
    (first_name = 'Irena' 
     OR first_name = 'Vidya' 
     OR first_name = 'Maya');

--441
-- or 

SELECT *
FROM employees
WHERE 
    (first_name = 'Irena' 
     OR first_name = 'Vidya' 
     OR first_name = 'Maya')
AND gender = 'M';

-- 5. Find all employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E. 

SELECT *
FROM employees 
WHERE last_name LIKE 'E%';

--7330 

-- 6. Find all employees whose last name starts OR ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E.

SELECT *
FROM employees 
WHERE last_name LIKE 'E%' 
OR last_name LIKE '%E';

--30723

-- How many employees have a last name that ends with E, but does not start with E? ( observations)

SELECT *
FROM employees 
WHERE last_name LIKE '%E' 
AND NOT last_name LIKE 'E%';

--23_393

-- 7. Find all employees employees whose last name starts AND ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. 

SELECT *
FROM employees 
WHERE last_name LIKE 'E%' 
AND last_name LIKE '%E';

--899

-- We can also write our query like this... 

SELECT *
FROM employees
WHERE last_name LIKE 'E%E';

--899

-- How many employees' last names end with E, regardless of whether they start with E?

SELECT *
FROM employees 
WHERE last_name LIKE '%E';

--24292

-- 8. Find all employees hired in the 90s. Enter a comment with the number of employees returned.

SELECT * 
FROM employees
WHERE hire_date LIKE '199%';

--135214 

-- or

SELECT * 
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';

-- 9. Find all employees born on Christmas. Enter a comment with the number of employees returned. 
SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25';

--842 

-- 10. Find all employees hired in the 90s AND born on Christmas. Enter a comment with the number of employees returned.
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%-12-25';

--362

-- 11. Find all employees with a 'q' in their last name. Enter a comment with the number of records returned.

SELECT *
FROM employees
WHERE last_name LIKE '%q%';

-- 1873

-- 12. Find all employees with a 'q' in their last name but NOT 'qu'. How many employees are found? ( observations)

SELECT *
FROM employees
WHERE last_name LIKE '%q%' 
AND NOT last_name LIKE '%qu%';

-- 547

