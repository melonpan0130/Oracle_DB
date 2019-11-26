-- Subquery - 단일행 서브쿼리
-- employee_id가 120인 사원의 job_id와 동일한 job_id를 가진 사원들의 이름과 job_id 조회
select first_name, job_id
from employees
where job_id = (select job_id from employees where employee_id=120);

-- #.1 150번 사원보다 급여가 많은 사원의 이름과 급여를 
-- 급여가 많은 순으로 조회
select first_name, salary
from employees
where salary > (select salary from employees where employee_id = 150)
order by 2 desc;

-- #.2 급여를 가장 많이 받는 사원의 이름, 부서번호, 급여, 입사일 조회
select first_name, department_id, salary, hire_date
from employees
where salary = (select MAX(salary) from employees);

-- 가장 적은 급여
select first_name, department_id, salary, hire_date
from employees
where salary = (select MIN(salary) from employees);
-- 평균보다 많은 사람
select first_name, department_id, salary, hire_date
from employees
where salary > (select AVG(salary) from employees);

-- #.3 사원번호가 126인 사원과 업무가 같고, 급여가 Clara보다 많은 사원의
-- 사원번호, 이름, 담당업무명, 입사일자, 급여 조회

-- 은주's 방법
SELECT employee_id, first_name, job_title, hire_date, salary
FROM employees NATURAL JOIN jobs
WHERE job_id = (SELECT job_id FROM employees WHERE employee_id = 162)
      AND salary > (SELECT salary FROM employees WHERE first_name='Clara');

-- 예빈's 방법
SELECT e.employee_id,e.first_name,jobs.job_title,e.hire_date,e.salary 
FROM employees e,jobs
WHERE jobs.job_id= e.job_id 
      AND e.job_id = (SELECT job_id FROM employees WHERE employee_id=162) 
      AND e.salary > (SELECT salary FROM employees WHERE first_name = 'Clara');

-- 미림's 방법
SELECT employee_id,first_name,(SELECT job_title FROM jobs WHERE job_id = e.job_id), hire_date, salary 
FROM employees e 
WHERE job_id = (SELECT job_id FROM employees WHERE employee_id=162) 
      AND salary > (SELECT salary FROM employees WHERE first_name = 'Clara');

-- 윤지's 방법
SELECT employee_id, first_name, job_title, hire_date, salary
FROM employees, jobs
where employees.job_id = jobs.job_id
      AND job_title = (SELECT job_title FROM jobs,employees WHERE employees.job_id = jobs.job_id and employee_id = 162)
      AND salary > (SELECT salary FROM employees WHERE first_name = 'Clara');

-- #.4 부서별 최소 급여가 80번인 부서의 최소 급여보다 많은 부서의 부서번호와 최소급여 조회
SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (SELECT MIN(salary) FROM employees
                      WHERE department_id = 80)
ORDER BY 1;



