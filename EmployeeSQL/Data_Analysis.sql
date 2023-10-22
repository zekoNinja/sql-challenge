-- Querying all thee tables following importing csv files to each respective table

select * from departments
select * from dept_emp
select * from dept_manager
select * from employees
select * from salaries
select * from titles


-- Using an "inner Join" to list employee nuumber, last name, first name, sex and salary of each employee by 
-- joining "Employees" and "salaries" tables (ask #1)

SELECT employees.emp_no, employees.last_name,employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
order by salaries.emp_no;

-- Extracting the columns : first name, last name and hire date based on a filter condition where employees 
-- where only hired in year of 1986 (ask #2)
SELECT first_name, last_name, hire_date from employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986
ORDER BY hire_date;

--- Joining 3 tables (departments, dep_manager and employees) to list department number, department name, 
-- employee number, last name, and first name. Ask #3

SELECT departments.dept_no,departments.dept_name,dept_manager.emp_no, employees.last_name,employees.first_name
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no =  employees.emp_no
ORDER BY dept_no;


-- Joining 3 tables (det_emp, departments and employees) to list,department number, employee number, last name, first name, and department name.
-- #ASK 4
SELECT dept_emp.emp_no, dept_emp.dept_no,departments.dept_name, employees.last_name,employees.first_name
FROM dept_emp
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN employees ON dept_emp.emp_no = employees.emp_no
ORDER BY dept_emp.emp_no;


-- ask #5
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
