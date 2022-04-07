use employees;

 select lower(first_name), upper(last_name) from employees;


 select lower(concat(first_name,'_' ,last_name)) as username from employees;

 select concat(lower(first_name),'.' ,lower(last_name), '@company.com') as email from employees;



 select concat(substr(first_name,1,1), last_name) as username from employees;

 
 select lower(concat(substr(first_name,1,1), '_',last_name)) as username from employees;

 -- Replace
 SELECT REPLACE('abcdefgabc', 'abc', '123');


 
 select dayname("1970-01-01");
 select monthname("2022-03-31");


 select curdate();
 select current_time();
 select current_timestamp();

 select *, datediff(curdate(), hire_date)/365 as tenure from employees; 
 select unix_timestamp('1971-01-01');
 select *, dayname(birth_date) as day_of_birth from employees; 
 select avg(salary), min(salary), max(salary), stddev(salary) from salaries; 
 


 # 704 rows

 SELECT 
     CONCAT(first_name, ' ', last_name) AS full_name
 FROM
     employees
 WHERE
     first_name LIKE 'E%e';

 
 # 704 rows
 SELECT 
     UPPER(CONCAT(first_name, ' ', last_name)) AS full_name
 FROM
     employees
 WHERE
     first_name LIKE 'E%e';



 SELECT 
     first_name,
     last_name,
     DATEDIFF(NOW(), hire_date) AS days_with_company
 FROM
     employees
 WHERE
     hire_date LIKE '199%'
 	AND birth_date LIKE '%-12-25';

 select * from salaries;

 
 SELECT 
     MIN(salary), MAX(salary)
 FROM
     salaries
 WHERE
     to_date > CURDATE();



 select lower(concat(
     substr(first_name, 1, 1), # first initial of first name
     substr(last_name, 1, 4), # first 4 of last name
 		 "_",
 		 substr(birth_date, 6, 2), # month
 		 substr(birth_date, 3, 2) # 2 yr
 )) as username,first_name, last_name, birth_date