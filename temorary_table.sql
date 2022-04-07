-- Use the read_only database
-- This avoids needing to re-type the db_name in front of every table_name
USE employees;

-- Specify the db where you have permissions and add the temp table name.
-- Replace "my_database_with_permissions"" with the database name where you have appropriate permissions. It should match your username.
CREATE TEMPORARY TABLE my_database_with_permissions.employees_with_salaries AS 
SELECT * FROM employees JOIN salaries USING(emp_no);

-- Change the current db.
USE my_database_with_permissions;
SELECT * FROM employees_with_salaries;
