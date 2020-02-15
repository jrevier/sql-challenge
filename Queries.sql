--List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
from salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

--List employees who were hired in 1986.

SELECT * 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';


--List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name, and start and end employment dates.--

SELECT departments.dept_name, dept_manager.emp_no, dept_manager.dept_no, dept_manager.from_date, 
dept_manager.to_date, employees.last_name, employees.first_name  
FROM departments
left join dept_manager on 
dept_manager.dept_no=departments.dept_no
left join employees on 
dept_manager.emp_no=employees.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name,dept_emp.dept_no, departments.dept_name  
FROM employees
right join dept_emp on 
employees.emp_no=dept_emp.emp_no
right join departments on 
dept_emp.dept_no=departments.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."

select *
from employees
where first_name = 'Hercules' AND 
last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
right join dept_emp on 
employees.emp_no=dept_emp.emp_no
right join departments on 
dept_emp.dept_no=departments.dept_no 
where dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
right join dept_emp on 
employees.emp_no=dept_emp.emp_no
right join departments on 
dept_emp.dept_no=departments.dept_no 
where dept_name = 'Sales' or dept_name ='Development';

--In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "name count"
FROM employees
GROUP BY last_name
ORDER BY "name count" DESC; 

select * from employees 
where emp_no = 499942; 

