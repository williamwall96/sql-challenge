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
		
--4.List the department of each employee with the following information:
----employee number, last name, first name, and department name.
select * from employees;
select * from employee_dept;
select * from departments;
select e.emp_num, e.last_name, e.first_name, d.dept_name, ed.dept_num 
from employees as e
left join employee_dept as ed
	on e.emp_num=ed.emp_num
left join departments as d
	on ed.dept_num=d.dept_num;
	
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select * from employees;
SELECT e.first_name, e.last_name, e.sex
from employees as e
WHERE first_name = 'Hercules' AND last_name like 'B%';

-- 6. List all employees in the Sales department, 
---including their employee number, last name, first name, and department name.

select e.emp_num, e.last_name, e.first_name, d.dept_name,ed.dept_num
from employees as e
left join employee_dept as ed
	on e.emp_num=ed.emp_num
left join departments as d
	on ed.dept_num=d.dept_num
	where d.dept_name = 'Sales';
	
-- 7.List all employees in the Sales and Development departments
---, including their employee number, last name, first name, and department name.

select e.emp_num, e.last_name, e.first_name, d.dept_name,ed.dept_num
from employees as e
left join employee_dept as ed
	on e.emp_num=ed.emp_num
left join departments as d
	on ed.dept_num=d.dept_num
	where d.dept_name = 'Sales' or d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee 
---last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;