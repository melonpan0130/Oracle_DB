-- 다중 행 서브쿼리
-- 부서별 최대치와 겹치는 사람들 구하기
select employee_id, first_name, salary, department_id
from employees
where salary IN (select max(salary) from employees group by department_id)
order by department_id;

-- #.1 업무가 Sales인 최소 한 명 이상의 사원보다 급여를 많이 받는 사원의 
-- 이름, 급여, 업무코드를 급여 순으로 조회
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


-- 다중 열 서브쿼리
-- 다중 행으로 출력해보기
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

-- #.1 각 부서별로 최대급여를 받는 사원과 최소급여를 받는 사원의 부서번호, 사원번호, 사원이름, 급여 조회
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
