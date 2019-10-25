-- CROSS JOIN : 카티시안 곱
select * from employees, departments;
select * from employees cross join departments; -- 111 * 27

select * from jobs;
select * from job_history;

-- NATURAL JOIN
SELECT * from jobs NATURAL JOIN job_history;

-- #.1 employees, departments 테이블에서 사원명, 부서번호, 부서명을 NATURAL JOIN을 이용하여 조회
-- (사원명 순으로 조회)
SELECT first_name "사원명", department_id "부서번호", department_name "부서명" 
FROM employees NATURAL JOIN departments
ORDER BY 1;
-- NATURAL JOIN 은 공통적으로 사용하는 컬럼에는 테이블 별칭을 사용할 수 없음.
-- (컬럼이 중복되기 때문에 사용불가
 
-- #.2 departments, locations 테이블을 NATURAL JOIN하여 부서번호, 부서명, 지역코드, 근무도시 조회
-- (단, 10, 30번 부서만 조회)
SELECT d.department_id "부서번호", d.department_name "부서명", location_id "지역코드", l.city "근무도시"
FROM departments d NATURAL JOIN locations l
WHERE department_id IN(10, 30);

-- #.3 사원명, 급여, 부서번호, 부서명, 근무도시를 NATURAL JOIN을 이용하여 조회 (사원명 순으로 정렬)
select first_name, salary, department_id, city
from employees e natural join departments natural join locations
order by 1;



-- #.4
