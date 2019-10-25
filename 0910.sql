-- #.1 Manager Job(Stock Manager, Purchasing Manager ...)�� ���� ������� �μ���, �̸�, ������ ��ȸ
SELECT department_name, e.first_name, j.job_title 
FROM employees e, jobs j, departments d 
WHERE e.job_id = j.job_id AND e.department_id = d.department_id AND j.job_title LIKE '%Manager%';

-- #.2 Michael�� �̸� ����city ����state_province ��ȸ
SELECT e.first_name, l.city, l.state_province
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id AND d.location_id = l.location_id AND e.first_name='Michael';

-- #.3 �μ���� �μ��� �����ڵ� �� �� �μ��� CLERK �����ڵ带 ���� ����� �� ��ȸ(�μ��� ������ ����)
SELECT d.department_name, e.job_id, COUNT(*)
FROM employees e, departments d
WHERE e.department_id = d.department_id AND e.job_id LIKE '%CLERK'
GROUP BY d.department_name, e.job_id
ORDER BY 1;

-- #.4 �� �μ��� ��� �޿� ��ȸ(�μ��� ������ ����)
SELECT d.department_name, TRUNC(AVG(salary))
FROM employees e, departments d
WHERE e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY 1;

-- NON-EQUI JOIN (WHERE ���� =�� �ƴ� JOIN)
-- #.1 �޿��� �ּұ޿��� �ִ� �޿� ������ ����� �����ȣ, �����, �����ڵ�, �޿�, ������, ������ �ּұ޿�, ������ �ִ�޿��� �����ڵ� ������ ��ȸ
SELECT e.employee_id, first_name, e.job_id, e.salary, j.job_title, j.min_salary, j.max_salary
FROM employees e, jobs j
WHERE e.job_id = j.job_id AND e.salary BETWEEN j.min_salary AND j.max_salary
ORDER BY e.employee_id;

-- OUTER JOIN
-- INNER JOIN : ������ ��ġ�ϴ� �͸� ����
SELECT e.employee_id, first_name, e.job_id, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id; -- ������� ���� ������ ������ ���� ������ 110��

-- departments ����
SELECT e.employee_id, first_name, e.job_id, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id; -- ����� �Ҽӵ��� ���� departments�鵵 ��� ���� (126��)

-- employees ����
SELECT e.employee_id, first_name, e.job_id, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+); -- ����Ա��� ���� (111��)

-- #.1 departments, locations ���̺��� �̿��Ͽ� �μ���ȣ, �μ���, �ش� �μ��� city ������ ��ȸ
-- (�ٹ����ð� �������� ���� �μ���ȣ, �μ��� ��ȸ)
SELECT d.department_id, d.department_name, l.city
FROM departments d, locations l
WHERE d.location_id = l.location_id(+)
ORDER BY 1;