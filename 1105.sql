-- ���� �� ��������

-- #.1 ������ Sales�� �ּ� �� �� �̻��� ������� �޿��� ���� �޴� ����� 
-- �̸�, �޿�, �����ڵ带 �޿� ������ ��ȸ
SELECT first_name, salary, department_id
FROM employees
WHERE salary > (SELECT MIN(salary)
    FROM employees natural join jobs
    where job_title like '%Sales%')
ORDER BY salary;

SELECT first_name, salary, department_id
FROM employees
WHERE salary > ANY (SELECT salary
    FROM employees natural join jobs
    where job_title like '%Sales%')
ORDER BY salary;


-- ���� �� ��������
-- #.1
