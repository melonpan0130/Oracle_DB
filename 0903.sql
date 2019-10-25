select * from employees; -- 111개
select * from departments; -- 27개

-- Join에서 where절을 주지 않으면 데카르트의 곱(카타시안 곱)이 발생한다. (111 * 27 = 2997)
SELECT first_name,e.department_id, d.department_id, department_name
FROM employees e, departments d; -- 2997개

-- where절을 썼을 경우 (inner join, equijoin: 같은 것 찾기)
SELECT first_name,e.department_id, d.department_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id; -- 110개 (사장님 제외)

-- #.1 업무 코드가 FI_MGR인 사원의 사원번호, 이름, 급여, 부서코드, 근무지 코드 조회
SELECT employee_id, first_name, salary, e.department_id, d.location_id
FROM employees e, departments d
WHERE e.job_id = 'FI_MGR' AND e.department_id = d.department_id;

-- #.2 사원명, 부서명, 급여, 근무도시명 조회
SELECT first_name, d.department_name, salary, l.city
FROM employees e, locations l, departments d
WHERE e.department_id = d.department_id AND d.location_id = l.location_id
ORDER BY first_name;

-- #.3 Seattle에 근무하는 사원중 급여 5000 이상인 사원의 
-- 사원명(NAME), 급여(SALARY), 업무명(JOB), 입사일(HIREDATE), 보너스 비율(BONUS), 부서코드(DEPT), 도시명(CITY)를 
-- 사원명 순으로 정렬하여 조회
SELECT first_name NAME, salary SALARY, j.job_title JOB, hire_date HIREDATE, commission_pct BONUS, e.department_id DEPT, l.city CITY
FROM employees e, departments d, locations l, jobs j
WHERE e.department_id = d.department_id AND e.job_id = j.job_id AND d.location_id = l.location_id AND l.city = 'Seattle' AND salary >= 5000
ORDER BY first_name;

SELECT first_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;