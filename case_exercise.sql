USE employees;

 
 SELECT
 	dept_name,
     dept_name = 'Research' AS is_research,
     dept_name LIKE '%Research%' AS like_research
 FROM departments;


 SELECT
     dept_name,
     CASE WHEN title = 'Senior Engineer' THEN title ELSE NULL END AS 'Senior Engineer',
     CASE WHEN title = 'Staff' THEN title ELSE NULL END AS 'Staff',
     CASE WHEN title = 'Engineer' THEN title ELSE NULL END AS 'Engineer',
     CASE WHEN title = 'Senior Staff' THEN title ELSE NULL END AS 'Senior Staff',
     CASE WHEN title = 'Assistant Engineer' THEN title ELSE NULL END AS 'Assistant Engineer',
     CASE WHEN title = 'Technique Leader' THEN title ELSE NULL END AS 'Technique Leader',
     CASE WHEN title = 'Manager' THEN title ELSE NULL END AS 'Manager'
 FROM departments
 JOIN dept_emp USING(dept_no)
 JOIN titles USING(emp_no);

 -- By using a COUNT() function on these columns, we can count the number of non-null entries and aggregate those by department using GROUP BY
 -- The output is a convenient pivot table showing counts by subcategory
 SELECT
     dept_name,
     COUNT(CASE WHEN title = 'Senior Engineer' THEN title ELSE NULL END) AS 'Senior Engineer',
     COUNT(CASE WHEN title = 'Staff' THEN title ELSE NULL END) AS 'Staff',
     COUNT(CASE WHEN title = 'Engineer' THEN title ELSE NULL END) AS 'Engineer',
     COUNT(CASE WHEN title = 'Senior Staff' THEN title ELSE NULL END) AS 'Senior Staff',
     COUNT(CASE WHEN title = 'Assistant Engineer' THEN title ELSE NULL END) AS 'Assistant Engineer',
     COUNT(CASE WHEN title = 'Technique Leader' THEN title ELSE NULL END) AS 'Technique Leader',
     COUNT(CASE WHEN title = 'Manager' THEN title ELSE NULL END) AS 'Manager'
 FROM departments
 JOIN dept_emp USING(dept_no)
 JOIN titles USING(emp_no)
 GROUP BY dept_name
 ORDER BY dept_name;

 -- We can add additional conditional statements for this query just like any other
 -- Here I filter in my JOINs for current employees who currently hold each title.
 SELECT
     dept_name,
     COUNT(CASE WHEN title = 'Senior Engineer' THEN title ELSE NULL END) AS 'Senior Engineer',
     COUNT(CASE WHEN title = 'Staff' THEN title ELSE NULL END) AS 'Staff',
     COUNT(CASE WHEN title = 'Engineer' THEN title ELSE NULL END) AS 'Engineer',
     COUNT(CASE WHEN title = 'Senior Staff' THEN title ELSE NULL END) AS 'Senior Staff',
     COUNT(CASE WHEN title = 'Assistant Engineer' THEN title ELSE NULL END) AS 'Assistant Engineer',
     COUNT(CASE WHEN title = 'Technique Leader' THEN title ELSE NULL END) AS 'Technique Leader',
     COUNT(CASE WHEN title = 'Manager' THEN title ELSE NULL END) AS 'Manager'
 FROM departments
 JOIN dept_emp
     ON departments.dept_no = dept_emp.dept_no AND dept_emp.to_date > CURDATE()
 JOIN titles
     ON dept_emp.emp_no = titles.emp_no AND titles.to_date > CURDATE()
 GROUP BY dept_name
 ORDER BY dept_name;

-- exercise-- 

 SELECT
     de.emp_no,
     de.dept_no,
     de.from_date AS start_date,
     de.to_date AS end_date,
     de.to_date > NOW() AS is_current_employee
 FROM dept_emp de
 ORDER BY emp_no
 LIMIT 100;

 SELECT
     LEFT(last_name, 1) = SUBSTR(last_name, 1, 1)
 FROM employees;

 SELECT
     first_name,
     last_name,
     LEFT(last_name, 1) AS first_letter_of_last_name,
     CASE
         WHEN LEFT(last_name, 1) <= 'H' THEN 'A-H'
         WHEN SUBSTR(last_name, 1, 1) <= 'Q' THEN 'I-Q'
         WHEN LEFT(last_name, 1) <= 'Z' THEN 'R-Z'
     END AS alpha_group
 FROM employees;


 SELECT
     COUNT(CASE WHEN birth_date BETWEEN '1950-01-01' AND '1959-12-31' THEN birth_date ELSE NULL END) AS '50s',
     COUNT(CASE WHEN birth_date BETWEEN '1960-01-01' AND '1969-12-31' THEN birth_date ELSE NULL END) AS '60s'
 FROM employees;

 SELECT
     CONCAT(SUBSTR(birth_date, 1, 3), '0') as decade,
     COUNT(*)
 FROM employees
 GROUP BY decade;


 SELECT
     CASE
         WHEN d.dept_name IN ('Research', 'Development') THEN 'R&D'
         WHEN d.dept_name IN ('Sales', 'Marketing') THEN 'Sales & Marketing'
         WHEN d.dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
         WHEN d.dept_name IN ('Finance', 'Human Resources') THEN 'Finanace & HR'
         ELSE d.dept_name
     END AS dept_group,
     AVG(s.salary) AS avg_salary
 FROM departments d
 JOIN dept_emp de USING (dept_no)
 JOIN salaries s USING (emp_no)
 WHERE s.to_date > NOW() AND de.to_date > NOW()
 GROUP BY dept_group;


 SELECT
     e.emp_no,
     de.dept_no,
     e.start_date,
     IF(e.end_date > NOW(), NULL, e.end_date),
     e.is_current_employee
 FROM dept_emp de
 JOIN (
     SELECT
         e.emp_no AS emp_no,
         e.hire_date AS start_date,
         MAX(de.to_date) AS end_date,
         MAX(de.to_date) > NOW() AS is_current_employee
     FROM employees e
     JOIN dept_emp de USING (emp_no)
     GROUP BY e.emp_no
 ) e ON de.emp_no = e.emp_no AND de.to_date = e.end_date;
