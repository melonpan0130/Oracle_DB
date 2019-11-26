-- Subquery - ������ ��������
-- employee_id�� 120�� ����� job_id�� ������ job_id�� ���� ������� �̸��� job_id ��ȸ
select first_name, job_id
from employees
where job_id = (select job_id from employees where employee_id=120);

-- #.1 150�� ������� �޿��� ���� ����� �̸��� �޿��� 
-- �޿��� ���� ������ ��ȸ
select first_name, salary
from employees
where salary > (select salary from employees where employee_id = 150)
order by 2 desc;

-- #.2 �޿��� ���� ���� �޴� ����� �̸�, �μ���ȣ, �޿�, �Ի��� ��ȸ
select first_name, department_id, salary, hire_date
from employees
where salary = (select MAX(salary) from employees);

-- ���� ���� �޿�
select first_name, department_id, salary, hire_date
from employees
where salary = (select MIN(salary) from employees);
-- ��պ��� ���� ���
select first_name, department_id, salary, hire_date
from employees
where salary > (select AVG(salary) from employees);

-- #.3 �����ȣ�� 126�� ����� ������ ����, �޿��� Clara���� ���� �����
-- �����ȣ, �̸�, ��������, �Ի�����, �޿� ��ȸ

-- ����'s ���
SELECT employee_id, first_name, job_title, hire_date, salary
FROM employees NATURAL JOIN jobs
WHERE job_id = (SELECT job_id FROM employees WHERE employee_id = 162)
      AND salary > (SELECT salary FROM employees WHERE first_name='Clara');

-- ����'s ���
SELECT e.employee_id,e.first_name,jobs.job_title,e.hire_date,e.salary 
FROM employees e,jobs
WHERE jobs.job_id= e.job_id 
      AND e.job_id = (SELECT job_id FROM employees WHERE employee_id=162) 
      AND e.salary > (SELECT salary FROM employees WHERE first_name = 'Clara');

-- �̸�'s ���
SELECT employee_id,first_name,(SELECT job_title FROM jobs WHERE job_id = e.job_id), hire_date, salary 
FROM employees e 
WHERE job_id = (SELECT job_id FROM employees WHERE employee_id=162) 
      AND salary > (SELECT salary FROM employees WHERE first_name = 'Clara');

-- ����'s ���
SELECT employee_id, first_name, job_title, hire_date, salary
FROM employees, jobs
where employees.job_id = jobs.job_id
      AND job_title = (SELECT job_title FROM jobs,employees WHERE employees.job_id = jobs.job_id and employee_id = 162)
      AND salary > (SELECT salary FROM employees WHERE first_name = 'Clara');

-- #.4 �μ��� �ּ� �޿��� 80���� �μ��� �ּ� �޿����� ���� �μ��� �μ���ȣ�� �ּұ޿� ��ȸ
SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (SELECT MIN(salary) FROM employees
                      WHERE department_id = 80)
ORDER BY 1;



