-- OUTER-JOIN

-- employee테이블과 department테이블에서 departments테이블에 있는 모든 자료를 기준으로
-- 사원번호, 이름, 업무코드, 부서번호(employees), 부서번호(departments) 부서명 조회
select e.employee_id, e.first_name, e.department_id, d.department_id
from employees e, departments d
where e.department_id=d.department_id; -- 110개 나옴

-- employee테이블과 department테이블에서 departments테이블에 있는 모든 자료를 기준으로
-- 사원번호, 이름, 업무코드, 부서번호(employees), 부서번호(departments) 부서명 조회
select e.employee_id, e.first_name, e.department_id, d.department_id
from employees e, departments d
where e.department_id = d.department_id(+); -- 111개 나옴 (employee 기준)

select e.employee_id, e.first_name, e.department_id, d.department_id
from employees e, departments d
where e.department_id(+) = d.department_id; -- 126개 나옴 (department 기준)

select * from employees order by department_id; -- department_id는 110번까지 있음.

-- #.1 departments 테이블과 location테이블을 이용하여
-- 부서번호, 부서명, 해당 부서의 city 정보를 조회(근무도시가 지정되지 않은 부서번호, 부서명도 표시) 조회
select d.department_id, d.department_name, l.city
from departments d, locations l
where d.location_id = l.location_id(+);

-- #.1 departments 테이블과 location테이블을 이용하여
-- 부서번호, 부서명, 해당 부서의 city 정보를 조회(부서번호가 지정되지 않은 부서번호, 부서명도 표시) 조회
select d.department_id, d.department_name, l.city
from departments d, locations l
where d.location_id(+) = l.location_id;

-- 에러 발생(오직 하나의 outer-join밖에 할 수 없음
select d.department_id, d.department_name, l.city
from departments d, locations l
where d.location_id(+) = l.location_id(+);

-- employees departments 다 나옴 (UNION) -> 127개 출력 (사장님
select e.employee_id, e.first_name, e.department_id, d.department_id
from employees e, departments d
where e.department_id = d.department_id(+) 
union
select e.employee_id, e.first_name, e.department_id, d.department_id
from employees e, departments d
where e.department_id(+) = d.department_id;

-- #.2 급여를 2000보다 많이 받는 사원들의
-- 이름, 급여, 부서번호, 부서명 조회(모든 부서테이블 조인)
select e.first_name, e.salary, e.department_id, d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id AND e.salary(+) > 2000; 
-- salary는 employees소속이므로 (+) 붙여야 함
