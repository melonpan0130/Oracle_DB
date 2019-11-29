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
select first_name, manager_id, department_id
from employees
where first_name NOT IN ('Diana', 'Adam')
 AND (manager_id, department_id) IN 
 (select manager_id, department_id from employees where first_name in('Diana', 'Adam'));


-- #.1

