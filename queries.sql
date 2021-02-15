--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_num, e.last_name, e.first_name,e.sex, s.salary
FROM employees as e
LEFT JOIN salaries as s
ON e.emp_num = s.emp_num
ORDER BY salary desc;

select * from employees;
--2.List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date like '%%/%%/1986';

--3.List the manager of each department with the following information: 
----department number, department name, the manager's employee number, last name, first name.

select * from dept_managers;
select * from departments;

select dm.dept_num, d.dept_name, dm.emp_num, e.last_name, e.first_name
	from dept_managers as dm
	left join departments as d
		on dm.dept_num=d.dept_num
	left join employees as e
		on dm.emp_num=e.emp_num;