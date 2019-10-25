-- NATURAL JOIN �׽�Ʈ �ϱ�
create table test_join (
    test varchar2(20),
    no number(2)
);

create table test_natural_join (
    join_id varchar2(10),
    job_title varchar(25) not null,
    test number(10)
);

select * from tab;

INSERT INTO test_join VALUES('1000', 20);
INSERT INTO test_natural_join VALUES('10', 'TEST_JOB', 1000);

SELECT * FROM test_join NATURAL JOIN test_natural_join;
-- ������ Ÿ���� �޶� ���ڰ��� ������ ���������� �ν�

INSERT INTO test_join VALUES('ABC', 20);
-- ���ڰ� �ƴѰ��� �ϳ��� �����ϸ� NATURAL JOIN �� �Ͼ�� �ʴ´�.


-- JOIN ~ USING : SELF-JOIN�� ����
-- #.1 employees, departments ���̺��� �̿��� �����, �μ���ȣ, �μ����� USING ���� ����Ͽ� ��ȸ
SELECT first_name, emp.department_id, department_name
FROM employees emp JOIN departments USING (department_id);
-- select���� �����÷��� ��Ī�� ���� ����

-- #.2 departments, locations ���̺��� �̿��Ͽ� �μ���ȣ, �μ���, �����ڵ�, ����������
-- USING���� �̿��� ��ȸ(��, �μ���ȣ 20, 50, 80, 110���� �μ���ȣ ������ ��ȸ)
SELECT department_id, department_name, location_id, city
FROM departments JOIN locations USING (location_id)
WHERE department_id IN(20, 50, 80, 110)
ORDER BY 1;

-- #.3 �����, �μ���, �ٹ����� ���� ��ȸ(USING�� ���)
SELECT first_name, department_name, city
FROM employees JOIN departments USING(department_id) 
               JOIN locations USING (location_id);


-- JOIN ~ ON : SELF-JOIN ����
-- #.1 �����, �޿�, �ش����� �Ŵ�����, �Ŵ��� �޿� ��ȸ(JOIN ON ���� �̿�) -> SELF JOIN
SELECT e.first_name, e.salary, m.first_name, m.salary
FROM employees e JOIN employees m ON m.employee_id = e.manager_id;

-- #.2 �̸��� A, a���ڰ� ���� ����� �����, �μ���, �ٹ����� ���� ��ȸ(����� ������ ����)
SELECT e.first_name, e.department_id, l.city
FROM employees e JOIN departments d ON e.department_id = d.department_id 
                 JOIN locations l ON d.location_id = l.location_id
WHERE NOT(first_name LIKE '%A%' OR first_name LIKE '%a%')
-- WHERE first_name NOT LIKE '%A%' AND first_name NOT LIKE '%a%'
ORDER BY 1;