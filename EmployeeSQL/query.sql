--DATA ANALYSIS
-- Listing the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.last_name,
	employees.sex,
	salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no= salaries.emp_no;

-- Listing first name, last name and hire date for employees who were hired in 1986

SELECT first_name,
	last_name,
	hire_date
FROM employees 
WHERE hire_date BETWEEN '01/01/1986' AND '01/01/1987';

--Listing the manager of each department with the following information: department number, department name, the manager's employee number, last name and first name

SELECT dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.first_name,
	employees.last_name
FROM dept_manager
INNER JOIN departments 
ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees 
ON dept_manager.emp_no = employees.emp_no;

-- Listing the department of each employee with the following information: employee number, last name, first name, department name

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no

--Listing first name, last name and sex for employees whose first name is "Hercules" and last name begines with "B"

SELECT first_name,
	last_name,
	sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Listing all employees in the sales department including their employees number, last name, first name and department name

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp 
ON employees.emp_no= dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no;

-- Listing all employees in the sales department, including their employee number, last name, first name and department name

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--Listing all employees in Sales and Development departments, including their employee number, last name, first name and department name

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

-- In descending order, listing the frequency count of employee last names, i.e., how many employees share each last name

SELECT last_name,
COUNT(last_name) AS "freq"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;
