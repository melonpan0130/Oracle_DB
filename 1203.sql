-- 상호연관 서브쿼리
-- #.1 소속부서의 평균 급여보다 많은 급여를 받는 사원의 
--     이름 급여 부서번호, 입사일, 업무코드 조회
SELECT first_name, salary, department_id, hire_date, job_id
FROM employees e
WHERE salary > (SELECT AVG(salary) 
                FROM employees 
                WHERE department_id = e.department_id)
ORDER BY 3;

