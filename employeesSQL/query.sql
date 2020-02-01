--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
--select only the columns needed. tables defined for each column to reflect where data is coming from
emp.emp_no,
emp.last_name,
emp.first_name,
emp.gender,
salaries.salary
FROM employees as emp
INNER JOIN salaries on emp.emp_no = salaries.emp_no;

--2. List employees who were hired in 1986.
SELECT 
*
FROM employees
--extract used to pull the year only from hire date
WHERE extract(year from hire_date) = 1986;

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.

SELECT 
deptm.dept_no,
dept.dept_name,
deptm.emp_no,
emp.last_name,
emp.first_name,
deptm.from_date,
deptm.to_date
FROM dept_manager AS deptm
INNER JOIN departments AS dept on deptm.dept_no = dept.dept_no 
INNER JOIN employees AS EMP on deptm.emp_no = emp.emp_no;

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
--contains duplicate employee data as they moved departments
SELECT 
--select only the columns needed. tables defined for each column to reflect where data is coming from
emp.emp_no,
emp.last_name,
emp.first_name,
dept.dept_name
FROM employees as emp
INNER JOIN dept_emp AS depte on depte.emp_no = emp.emp_no
INNER JOIN departments as DEPT on depte.dept_no = dept.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees
--where statement with equal sign to find exact match
WHERE first_name = 'Hercules'
--wildcard search used to find last names that start with "B"
AND last_name LIKE 'B%';

--6. List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT 
emp.emp_no,
emp.last_name,
emp.first_name,
dept.dept_name
FROM employees AS emp
INNER JOIN dept_emp AS depte on depte.emp_no = emp.emp_no
INNER JOIN departments as DEPT on depte.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales';
--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT 
emp.emp_no,
emp.last_name,
emp.first_name,
dept.dept_name
FROM employees AS emp
INNER JOIN dept_emp AS depte on depte.emp_no = emp.emp_no
INNER JOIN departments as DEPT on depte.dept_no = dept.dept_no
--or statement used to consider both arguements correct
WHERE dept.dept_name = 'Sales' OR dept.dept_name = 'Development' ;

--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
--choosing last name, then counting the last name
--group by ensures it shows each last name onces
SELECT
last_name,
COUNT(last_name) AS "Count of last name"
FROM Employees
GROUP BY
Last_name
ORDER BY "Count of last name" DESC;