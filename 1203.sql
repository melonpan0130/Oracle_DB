-- ��ȣ���� ��������
-- #.1 �ҼӺμ��� ��� �޿����� ���� �޿��� �޴� ����� 
--     �̸� �޿� �μ���ȣ, �Ի���, �����ڵ� ��ȸ
SELECT first_name, salary, department_id, hire_date, job_id
FROM employees e
WHERE salary > (SELECT AVG(salary) 
                FROM employees 
                WHERE department_id = e.department_id)
ORDER BY 3;

