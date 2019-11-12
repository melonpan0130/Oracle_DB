-- 다중 행 서브쿼리

-- #.1 업무가 Sales인 최소 한 명 이상의 사원보다 급여를 많이 받는 사원의 
-- 이름, 급여, 업무코드를 급여 순으로 조회
SELECT first_name, salary, department_id
FROM employees
WHERE salary > (SELECT MIN(salary)
    FROM employees natural join jobs
    where job_title like '%Sales%')
ORDER BY salary;
