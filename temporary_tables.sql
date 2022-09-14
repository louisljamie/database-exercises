-- Exercises:

CREATE TEMPORARY TABLE temp_table(
    temp_col INT UNSIGNED NOT NULL 
    )


INSERT INTO temp_table(temp_col) 
	VALUES (1), (2), (3), (4), (5);



-- Changing info:

-- Adds 1 to each COLUMN

UPDATE temp_table 
    SET temp_col = temp_col + 1;

DELETE FROM temp_table WHEN temp_col % 2 = 0;


/* 1 Using the example from the lesson, create a temporary table called employees_with_departments
 that contains first_name, last_name, and dept_name for employees currently with that department. 
 Be absolutely sure to create this table on your own database. If you see "Access denied for user ...",
 it means that the query was attempting to write a new table to a database that you can only read. */





