-- departments
DROP TABLE departments;
CREATE TABLE departments(
    dept_no TEXT NOT NULL,
    dept_name TEXT NOT NULL,
    PRIMARY KEY (dept_no)
);
SELECT * FROM departments;

-- titles
DROP TABLE titles;
CREATE TABLE titles(
    title_id TEXT NOT NULL,
    title TEXT NOT NULL,
    PRIMARY KEY (title_id)
);
SELECT * FROM titles;

-- employees
DROP TABLE employees;
CREATE TABLE employees(
    emp_no INT   NOT NULL,
    emp_title_id TEXT NOT NULL REFERENCES titles(title_id),
    birth_date DATE NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (emp_no)
);
SELECT * FROM employees;

-- dept_emp
DROP TABLE dept_emp;
CREATE TABLE dept_emp(
    emp_no INT NOT NULL REFERENCES employees(emp_no),
    dept_no TEXT NOT NULL REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no,dept_no)
);
SELECT * FROM dept_emp;

-- dept_manager
DROP TABLE dept_manager;
CREATE TABLE dept_manager(
    dept_no TEXT NOT NULL REFERENCES departments(dept_no),
    emp_no INT NOT NULL REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no,emp_no)
);
SELECT * FROM dept_manager;

-- salaries
DROP TABLE salaries;
CREATE TABLE salaries(
    emp_no INT NOT NULL PRIMARY KEY REFERENCES employees(emp_no),
    salary INT NOT NULL
);
SELECT * FROM salaries;
