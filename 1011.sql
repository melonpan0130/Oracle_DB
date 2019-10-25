-- CROSS JOIN : īƼ�þ� ��
select * from employees, departments;
select * from employees cross join departments; -- 111 * 27

select * from jobs;
select * from job_history;

-- NATURAL JOIN
SELECT * from jobs NATURAL JOIN job_history;

-- #.1 employees, departments ���̺��� �����, �μ���ȣ, �μ����� NATURAL JOIN�� �̿��Ͽ� ��ȸ
-- (����� ������ ��ȸ)
SELECT first_name "�����", department_id "�μ���ȣ", department_name "�μ���" 
FROM employees NATURAL JOIN departments
ORDER BY 1;
-- NATURAL JOIN �� ���������� ����ϴ� �÷����� ���̺� ��Ī�� ����� �� ����.
-- (�÷��� �ߺ��Ǳ� ������ ���Ұ�
 
-- #.2 departments, locations ���̺��� NATURAL JOIN�Ͽ� �μ���ȣ, �μ���, �����ڵ�, �ٹ����� ��ȸ
-- (��, 10, 30�� �μ��� ��ȸ)
SELECT d.department_id "�μ���ȣ", d.department_name "�μ���", location_id "�����ڵ�", l.city "�ٹ�����"
FROM departments d NATURAL JOIN locations l
WHERE department_id IN(10, 30);

-- #.3 �����, �޿�, �μ���ȣ, �μ���, �ٹ����ø� NATURAL JOIN�� �̿��Ͽ� ��ȸ (����� ������ ����)
select first_name, salary, department_id, city
from employees e natural join departments natural join locations
order by 1;



-- #.4
