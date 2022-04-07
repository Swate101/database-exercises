SELECT first_name, last_name
FROM employees
ORDER BY last_name;

SELECT first_name, last_name
FROM employees
ORDER BY last_name DESC;

SELECT first_name, last_name
FROM employees
Where first_name in ('Irena', 'Vidya', 'Maya')
ORDER BY First_name;
-- Irena Reutenuer, Vidya Simmen--
SELECT first_name, last_name
FROM employees
Where first_name in ('Irena', 'Vidya', 'Maya')
ORDER BY First_name , Last_name ;
-- Irena Action , Vidya Zweizig -- 
SELECT first_name, last_name
FROM employees
Where first_name in ('Irena', 'Vidya', 'Maya')
ORDER BY last_name , first_name ;
-- Irena Action, Maya Zyda

shift
Select *
From employees
where last_name Like "e%e"
Order by emp_no Desc;
