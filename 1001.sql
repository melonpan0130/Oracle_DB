-- OUTER-JOIN

-- employee���̺�� department���̺��� departments���̺� �ִ� ��� �ڷḦ ��������
-- �����ȣ, �̸�, �����ڵ�, �μ���ȣ(employees), �μ���ȣ(departments) �μ��� ��ȸ
select e.employee_id, e.first_name, e.department_id, d.department_id
from employees e, departments d
where e.department_id=d.department_id; -- 110�� ����

-- employee���̺�� department���̺��� departments���̺� �ִ� ��� �ڷḦ ��������
-- �����ȣ, �̸�, �����ڵ�, �μ���ȣ(employees), �μ���ȣ(departments) �μ��� ��ȸ
select e.employee_id, e.first_name, e.department_id, d.department_id
from employees e, departments d
where e.department_id = d.department_id(+); -- 111�� ���� (employee ����)

select e.employee_id, e.first_name, e.department_id, d.department_id
from employees e, departments d
where e.department_id(+) = d.department_id; -- 126�� ���� (department ����)

select * from employees order by department_id; -- department_id�� 110������ ����.

-- #.1 departments ���̺�� location���̺��� �̿��Ͽ�
-- �μ���ȣ, �μ���, �ش� �μ��� city ������ ��ȸ(�ٹ����ð� �������� ���� �μ���ȣ, �μ��� ǥ��) ��ȸ
select d.department_id, d.department_name, l.city
from departments d, locations l
where d.location_id = l.location_id(+);

-- #.1 departments ���̺�� location���̺��� �̿��Ͽ�
-- �μ���ȣ, �μ���, �ش� �μ��� city ������ ��ȸ(�μ���ȣ�� �������� ���� �μ���ȣ, �μ��� ǥ��) ��ȸ
select d.department_id, d.department_name, l.city
from departments d, locations l
where d.location_id(+) = l.location_id;

-- ���� �߻�(���� �ϳ��� outer-join�ۿ� �� �� ����
select d.department_id, d.department_name, l.city
from departments d, locations l
where d.location_id(+) = l.location_id(+);

-- employees departments �� ���� (UNION) -> 127�� ��� (�����
select e.employee_id, e.first_name, e.department_id, d.department_id
from employees e, departments d
where e.department_id = d.department_id(+) 
union
select e.employee_id, e.first_name, e.department_id, d.department_id
from employees e, departments d
where e.department_id(+) = d.department_id;

-- #.2 �޿��� 2000���� ���� �޴� �������
-- �̸�, �޿�, �μ���ȣ, �μ��� ��ȸ(��� �μ����̺� ����)
select e.first_name, e.salary, e.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id AND e.salary(+) > 2000; 
-- salary�� employees�Ҽ��̹Ƿ� (+) �ٿ��� ��
