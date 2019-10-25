-- OUTER JOIN : 
-- #.1 department ���̺��� �μ���, �����ڵ�� location���̺��� �����ڵ�, ���ø� ��ȸ
-- (�ٹ������� �������� ���� �μ��� ��ȸ)
SELECT d.department_name, d.location_id, l.location_id, l.city
FROM departments d LEFT OUTER JOIN locations l ON d.location_id = l.location_id;

SELECT department_name, location_id, city
-- d.location_id�� l.location_id�� �ϳ��� �����ؾ� USING�� ����� �� �ִ�.
FROM departments LEFT OUTER JOIN locations USING (location_id);

-- #.2 department ���̺��� �μ���, �����ڵ�� location���̺��� �����ڵ�, ���ø� ��ȸ
-- (�μ����� �������� ���� �ٹ������� ��ȸ)
SELECT d.department_name, d.location_id, l.location_id, l.city
FROM departments d RIGHT OUTER JOIN locations l ON d.location_id = l.location_id;

-- #.3 department ���̺��� �μ���, �����ڵ�� location���̺��� �����ڵ�, ���ø� ��ȸ
-- (�ٹ������� �������� ���� �μ���� �μ����� �������� ���� �ٹ����� ��� ��ȸ)
SELECT d.department_name, d.location_id, l.location_id, l.city
FROM departments d FULL OUTER JOIN locations l ON d.location_id = l.location_id;

-- #.4 �޿��� 2000���� �� ���� �޴� ����� �̸�, �޿�, �μ���ȣ, �μ����� ��ȸ
-- (����� ���� �μ���ȣ�� ��ȸ)
SELECT first_name, salary, d.department_id, department_name
FROM employees e right outer join departments d ON e.department_id=d.department_id AND salary(+) > 2000;
