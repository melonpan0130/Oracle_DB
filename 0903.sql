select * from employees; -- 111��
select * from departments; -- 27��

-- Join���� where���� ���� ������ ��ī��Ʈ�� ��(īŸ�þ� ��)�� �߻��Ѵ�. (111 * 27 = 2997)
SELECT first_name,e.department_id, d.department_id, department_name
FROM employees e, departments d; -- 2997��

-- where���� ���� ��� (inner join, equijoin: ���� �� ã��)
SELECT first_name,e.department_id, d.department_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id; -- 110�� (����� ����)

-- #.1 ���� �ڵ尡 FI_MGR�� ����� �����ȣ, �̸�, �޿�, �μ��ڵ�, �ٹ��� �ڵ� ��ȸ
SELECT employee_id, first_name, salary, e.department_id, d.location_id
FROM employees e, departments d
WHERE e.job_id = 'FI_MGR' AND e.department_id = d.department_id;

-- #.2 �����, �μ���, �޿�, �ٹ����ø� ��ȸ
SELECT first_name, d.department_name, salary, l.city
FROM employees e, locations l, departments d
WHERE e.department_id = d.department_id AND d.location_id = l.location_id
ORDER BY first_name;

-- #.3 Seattle�� �ٹ��ϴ� ����� �޿� 5000 �̻��� ����� 
-- �����(NAME), �޿�(SALARY), ������(JOB), �Ի���(HIREDATE), ���ʽ� ����(BONUS), �μ��ڵ�(DEPT), ���ø�(CITY)�� 
-- ����� ������ �����Ͽ� ��ȸ
SELECT first_name NAME, salary SALARY, j.job_title JOB, hire_date HIREDATE, commission_pct BONUS, e.department_id DEPT, l.city CITY
FROM employees e, departments d, locations l, jobs j
WHERE e.department_id = d.department_id AND e.job_id = j.job_id AND d.location_id = l.location_id AND l.city = 'Seattle' AND salary >= 5000
ORDER BY first_name;

SELECT first_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;