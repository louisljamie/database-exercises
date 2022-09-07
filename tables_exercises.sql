-- 1 Open MySQL Workbench and login to the database server 
-- 2 Save your work in a file named tables_exercises.sql 
-- 3 Use the employees database. Write the SQL code necessary to do this. 
USE employees;

-- 4 List all the tables in the database. Write the SQL code necessary to accomplish this.
SHOW TABLES;

-- 5 Explore the employees table. What different data types are present on this table?
/*
Date
Enum
Int
varchar(14)
varchar(16)
*/

-- 6 Which table(s) do you think contain a numeric type column? (Write this question and your answer in a comment)
-- saleries
/*
dept_emp
dept_manager
employees
salaries
titles
*/
-- 7 Which table(s) do you think contain a string type column? (Write this question and your answer in a comment)
/* 
departments
dept_emp
dept_manager
employees
titles
 */

-- 8 Which table(s) do you think contain a date type column? (Write this question and your answer in a comment)
/*
dept_emp
dept_manager
employees
employees
salaries
titles
*/

-- 9 What is the relationship between the employees and the departments tables? (Write this question and your answer in a comment)
-- There is no relation between the two. The information which links them is in the dept_emp

-- 10 Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.

SHOW CREATE TABLE dept_manager;

CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1