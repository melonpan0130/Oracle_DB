-- SELF-JOIN
-- manager �߿� steven�� �������� �ʴ� ���
select m.employee_id,m.first_name, count(*) 
from employees e, employees m 
where m.manager_id != 100 AND e.manager_id = m.employee_id 
GROUP BY (m.employee_id, m.first_name);

select m.employee_id,m.first_name, count(*) 
from employees e, employees m 
where m.manager_id != 100 AND e.manager_id = m.employee_id 
GROUP BY (m.employee_id, m.first_name);

-- #.1 ����� �ڿ� ' �����ڴ� '���ڿ��� �����Ͽ� �����ڸ�(����������)�� �������� ��ȸ
-- (�����ڰ� ���� ����� ����� �������� �Ѵ�)�Ͽ� ����� ������ ����
select e.first_name||'�� �����ڴ� '|| NVL(m.first_name, '����') "����������"
from employees e, employees m
where e.manager_id = m.employee_id(+)
order by e.first_name;

-- ANSI-JOIN

-- 1) NATURAL JOIN : ���� �÷��� ���� ���� ���� ã��
select * from employees NATURAL JOIN departments;

select * from employees e, departments d -- ����� ����
where e.department_id = d.department_id AND e.manager_id = d.manager_id;

-- 2) JOIN USING
select * from employees JOIN departments USING(department_id); -- manager�� �޶� department_id�� ������ ��ȸ

-- 3) JOIN ON & (RIGHT/LEFT) OUTER JOIN (���̺� �̸� �¿� ����)
SELECT * FROM employees LEFT OUTER JOIN departments ON -- LEFT
employees.department_id = departments.department_id;

SELECT * FROM employees e, departments d -- ����� ����
where e.department_id = d.department_id(+);

SELECT * FROM employees RIGHT OUTER JOIN departments ON -- RIGHT
employees.department_id = departments.department_id;

SELECT * FROM employees e, departments d -- ����� ����
where e.department_id(+) = d.department_id;

-- FULL OUTER JOIN (�¿� ��� ����)
SELECT * FROM employees FULL OUTER JOIN departments ON
employees.department_id = departments.department_id; -- 127��