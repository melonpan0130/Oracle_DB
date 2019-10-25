-- #.1 Manager Job(Stock Manager, Purchasing Manager ...)을 가진 사람들의 부서명, 이름, 업무명 조회
SELECT department_name, e.first_name, j.job_title 
FROM employees e, jobs j, departments d 
WHERE e.job_id = j.job_id AND e.department_id = d.department_id AND j.job_title LIKE '%Manager%';

-- #.2 Michael의 이름 도시city 지역state_province 조회
SELECT e.first_name, l.city, l.state_province
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id AND d.location_id = l.location_id AND e.first_name='Michael';

-- #.3 부서명과 부서별 업무코드 및 각 부서별 CLERK 업무코드를 가진 사람의 수 조회(부서명 순으로 정렬)
SELECT d.department_name, e.job_id, COUNT(*)
FROM employees e, departments d
WHERE e.department_id = d.department_id AND e.job_id LIKE '%CLERK'
GROUP BY d.department_name, e.job_id
ORDER BY 1;

-- #.4 각 부서별 평균 급여 조회(부서명 순으로 정렬)
SELECT d.department_name, TRUNC(AVG(salary))
FROM employees e, departments d
WHERE e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY 1;

-- NON-EQUI JOIN (WHERE 절이 =이 아닌 JOIN)
-- #.1 급여가 최소급여와 최대 급여 사이인 사원의 사원번호, 사원명, 업무코드, 급여, 업무명, 업무의 최소급여, 업무의 최대급여를 업무코드 순으로 조회
SELECT e.employee_id, first_name, e.job_id, e.salary, j.job_title, j.min_salary, j.max_salary
FROM employees e, jobs j
WHERE e.job_id = j.job_id AND e.salary BETWEEN j.min_salary AND j.max_salary
ORDER BY e.employee_id;

-- OUTER JOIN
-- INNER JOIN : 양측이 일치하는 것만 나옴
SELECT e.employee_id, first_name, e.job_id, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id; -- 사장님이 없기 때문에 데이터 열의 갯수는 110개

-- departments 기준
SELECT e.employee_id, first_name, e.job_id, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id; -- 사람이 소속되지 않은 departments들도 모두 나옴 (126개)

-- employees 기준
SELECT e.employee_id, first_name, e.job_id, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+); -- 사장님까지 나옴 (111개)

-- #.1 departments, locations 테이블을 이용하여 부서번호, 부서명, 해당 부서의 city 정보를 조회
-- (근무도시가 지정되지 않은 부서번호, 부서명도 조회)
SELECT d.department_id, d.department_name, l.city
FROM departments d, locations l
WHERE d.location_id = l.location_id(+)
ORDER BY 1;