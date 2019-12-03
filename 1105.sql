-- ���� �� ��������
-- �μ��� �ִ�ġ�� ��ġ�� ����� ���ϱ�
select employee_id, first_name, salary, department_id
from employees
where salary IN (select max(salary) from employees group by department_id)
order by department_id;

-- #.1 ������ Sales�� �ּ� �� �� �̻��� ������� �޿��� ���� �޴� ����� 
-- �̸�, �޿�, �����ڵ带 �޿� ������ ��ȸ
SELECT first_name, salary, department_id
FROM employees
WHERE salary > ANY (SELECT salary
    FROM employees NATURAL JOIN jobs
    WHERE job_title LIKE '%Sales%')
ORDER BY 2;

SELECT first_name, salary, department_id
FROM employees
WHERE salary > (SELECT MIN(salary)
    FROM employees NATURAL JOIN jobs
    WHERE job_title LIKE '%Sales%')
ORDER BY 2;


-- ���� �� ��������
-- ���� ������ ����غ���
SELECT first_name, manager_id, department_id
FROM employees
WHERE manager_id IN (SELECT manager_id FROM employees WHERE first_name IN ('Diana', 'Adam'))
AND department_id IN (SELECT department_id FROM employees WHERE first_name IN ('Diana', 'Adam'))
AND first_name NOT IN ('Diana', 'Adam');

SELECT first_name, manager_id, department_id
FROM employees
WHERE first_name NOT IN ('Diana', 'Adam')
AND (manager_id, department_id)
    IN (SELECT manager_id, department_id FROM employees WHERE first_name in('Diana', 'Adam'));
-- pairwise

-- #.1 �� �μ����� �ִ�޿��� �޴� ����� �ּұ޿��� �޴� ����� �μ���ȣ, �����ȣ, ����̸�, �޿� ��ȸ
SELECT department_id, employee_id, first_name, salary
FROM employees 
WHERE (department_id, salary) IN (SELECT department_id, MIN(salary)
        FROM employees
        GROUP BY department_id
        UNION
        SELECT department_id, MAX(salary)
        FROM employees
        GROUP BY department_id)
ORDER BY 1;
-- pairwise

SELECT department_id, employee_id, first_name, salary
FROM employees e
WHERE salary IN (SELECT MIN(salary)
        FROM employees where department_id = e.department_id)
   OR salary IN (SELECT MAX(salary)
        FROM employees where department_id = e.department_id)
ORDER BY 1;
