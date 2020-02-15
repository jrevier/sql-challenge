DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE departments (
  dept_no character varying(20),
  dept_name character varying(60) NOT NULL,
  PRIMARY KEY (dept_no)
  );

CREATE TABLE employees (
    emp_no integer NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(45) NOT NULL, 
	last_name character varying(45) NOT NULL, 
	gender character varying(20) NOT NULL, 
	hire_date date NOT NULL,
	PRIMARY KEY (emp_no)
); 

CREATE TABLE dept_emp (
  emp_no integer NOT NULL,
  dept_no character varying(20) NOT NULL,
  from_date date NOT NULL,
  to_date date NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
  dept_no character varying(20),
  emp_no integer NOT NULL,
  from_date date NOT NULL,
  to_date date NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries (
  emp_no integer NOT NULL,
  salary integer NOT NULL,
  from_date date NOT NULL,
  to_date date NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
  emp_no integer NOT NULL,
  title character varying(255) NOT NULL,
  from_date date NOT NULL,
  to_date date NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


copy departments from '/Users/Julia/departments.csv'
with (format CSV, header);

copy dept_emp from '/Users/Julia/dept_emp.csv'
with (format CSV, header);

copy employees from '/Users/Julia/employees.csv'
with (format CSV, header);

copy dept_manager from '/Users/Julia/dept_manager.csv'
with (format CSV, header);

copy salaries from '/Users/Julia/salaries.csv'
with (format CSV, header);

copy titles from '/Users/Julia/titles.csv'
with (format CSV, header);



