/* #Write a query to to find all employees whose last name starts and ends with 
'E'. #Use concat() to combine their first and last name
 together as a single column #named full_name. */


SELECT CONCAT(first_name, ' ', last_name) 
AS full_name
FROM employees
WHERE last_name 
LIKE 'e%e';


/* --#Convert the names produced in your last query to all uppercase. */

SELECT CONCAT(UPPER(first_name), ' ', 
UPPER(last_name)) 
AS full_name
FROM employees
WHERE last_name 
LIKE 'e%e';


/*#Find all employees hired in the 90s and born on Christmas. Use datediff() 
function to #find 
how many days they have been working at the company (Hint: You will also need to 
#use NOW() or CURDATE()),*/


SELECT first_name, last_name, hire_date, birth_date, 
DATEDIFF(NOW(), hire_date)
AS working_dates
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' AND birth_date 
LIKE '%-12-25';



/* --#Find the smallest and largest current salary from the salaries table.*/

SELECT MIN(salary), MAX(salary)
FROM salaries
WHERE to_date = '9999-01-01';


/* #Use your knowledge of built in SQL functions to generate a username for all 
of 
the #employees. A username should be all 
lowercase, and consist of the first character of #the employees first name, the 
first 4 characters of the employees last name, an #underscore, 
the month the employee was born, and the last two digits of the year that #they 
were born. Below is an example of what the first 10 rows will look like */

SELECT CONCAT(LOWER(left(first_name, 1)), 
LOWER(left(last_name, 4)), '_', 
MONTH(birth_date), 
RIGHT(year(birth_date), 2)) 
AS username
FROM employees
LIMIT 10;


