-- OUTER JOIN : 
-- #.1 department 테이블의 부서명, 지역코드와 location테이블의 지역코드, 도시명 조회
-- (근무지역이 설정되지 않은 부서명도 조회)
SELECT d.department_name, d.location_id, l.location_id, l.city
FROM departments d LEFT OUTER JOIN locations l ON d.location_id = l.location_id;

SELECT department_name, location_id, city
-- d.location_id과 l.location_id를 하나로 통일해야 USING을 사용할 수 있다.
FROM departments LEFT OUTER JOIN locations USING (location_id);

-- #.2 department 테이블의 부서명, 지역코드와 location테이블의 지역코드, 도시명 조회
-- (부서명이 설정되지 않은 근무지역도 조회)
SELECT d.department_name, d.location_id, l.location_id, l.city
FROM departments d RIGHT OUTER JOIN locations l ON d.location_id = l.location_id;

-- #.3 department 테이블의 부서명, 지역코드와 location테이블의 지역코드, 도시명 조회
-- (근무지역이 설정되지 않은 부서명과 부서명이 설정되지 않은 근무지역 모두 조회)
SELECT d.department_name, d.location_id, l.location_id, l.city
FROM departments d FULL OUTER JOIN locations l ON d.location_id = l.location_id;

-- #.4 급여를 2000보다 더 많이 받는 사원의 이름, 급여, 부서번호, 부서명을 조회
-- (사원이 없는 부서번호도 조회)
SELECT first_name, salary, d.department_id, department_name
FROM employees e right outer join departments d ON e.department_id=d.department_id AND salary(+) > 2000;
