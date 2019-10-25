SELECT first_name, employees.department_id, departments.department_id, departments.department_id, departments.department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id;

SELECT * FROM departments;
select * from employees;