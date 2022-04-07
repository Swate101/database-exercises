
 SELECT DISTINCT
     title
 FROM
     titles;


 SELECT 
     last_name, COUNT(last_name)
 FROM
     employees
 WHERE
     last_name LIKE 'e%e'
 GROUP BY last_name;


 SELECT 
     first_name, last_name
 FROM
     employees
 WHERE
     last_name LIKE 'e%e'
 GROUP BY first_name , last_name;

 SELECT 
     last_name
 FROM
     employees
 WHERE
     last_name LIKE '%q%'
 	AND last_name NOT LIKE '%qu%'
 GROUP BY last_name;


 SELECT 
     last_name, COUNT(last_name) AS 'number_of_employees'
 FROM
     employees
 WHERE
     last_name LIKE '%q%'
 	AND last_name NOT LIKE '%qu%'
 GROUP BY last_name;


 SELECT 
     gender, first_name, COUNT(gender)
 FROM
     employees
 WHERE
     first_name IN ('Irene' , 'Vidya', 'Maya')
 GROUP BY gender , first_name;

 
 SELECT 
 	LOWER(
 			CONCAT(
 				SUBSTR(first_name, 1, 1),
 				SUBSTR(last_name, 1, 4),
 				'_',
 				SUBSTR(birth_date, 6, 2),
 				SUBSTR(birth_date, 3, 2)
 				)
 			) AS username,
             count(*) as count_of_users
 FROM employees
 group by username;


 SELECT 
 	LOWER(
 			CONCAT(
 				SUBSTR(first_name, 1, 1),
 				SUBSTR(last_name, 1, 4),
 				'_',
 				SUBSTR(birth_date, 6, 2),
 				SUBSTR(birth_date, 3, 2)
 				)
 			) AS username,
             count(*) as count_of_users
 FROM employees
 group by username
 having count_of_users > 1;


 select sum(t.count_of_users) as 'total_duplicates',
 count(t.count_of_users) as 'number_of_unique_duplicates'
 from (SELECT 
 	LOWER(
 			CONCAT(
 				SUBSTR(first_name, 1, 1),
 				SUBSTR(last_name, 1, 4),
 				'_',
 				SUBSTR(birth_date, 6, 2),
 				SUBSTR(birth_date, 3, 2)
 				)
 			) AS username,
             count(*) as count_of_users
 FROM employees
 group by username
 having count_of_users > 1) as t;

 