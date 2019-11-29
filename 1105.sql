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
select first_name, manager_id, department_id
from employees
where first_name NOT IN ('Diana', 'Adam')
 AND (manager_id, department_id) IN 
 (select manager_id, department_id from employees where first_name in('Diana', 'Adam'));


-- #.1

