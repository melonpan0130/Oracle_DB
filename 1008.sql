-- SELF-JOIN
-- manager 중에 steven이 관리하지 않는 사람
select m.employee_id,m.first_name, count(*) 
from employees e, employees m 
where m.manager_id != 100 AND e.manager_id = m.employee_id 
GROUP BY (m.employee_id, m.first_name);

select m.employee_id,m.first_name, count(*) 
from employees e, employees m 
where m.manager_id != 100 AND e.manager_id = m.employee_id 
GROUP BY (m.employee_id, m.first_name);

-- #.1 사원명 뒤에 ' 관리자는 '문자열을 결합하여 관리자명(관리자정보)이 나오도록 조회
-- (관리자가 없는 사원도 결과에 나오도록 한다)하여 사원명 순으로 정렬
select e.first_name||'의 관리자는 '|| NVL(m.first_name, '없음') "관리자정보"
from employees e, employees m
where e.manager_id = m.employee_id(+)
order by e.first_name;

-- ANSI-JOIN

-- 1) NATURAL JOIN : 같은 컬럼의 값이 같은 놈을 찾음
select * from employees NATURAL JOIN departments;

select * from employees e, departments d -- 결과가 같다
where e.department_id = d.department_id AND e.manager_id = d.manager_id;

-- 2) JOIN USING
select * from employees JOIN departments USING(department_id); -- manager는 달라도 department_id가 같은거 조회

-- 3) JOIN ON & (RIGHT/LEFT) OUTER JOIN (테이블 이름 좌우 조심)
SELECT * FROM employees LEFT OUTER JOIN departments ON -- LEFT
employees.department_id = departments.department_id;

SELECT * FROM employees e, departments d -- 결과가 같다
where e.department_id = d.department_id(+);

SELECT * FROM employees RIGHT OUTER JOIN departments ON -- RIGHT
employees.department_id = departments.department_id;

SELECT * FROM employees e, departments d -- 결과가 같다
where e.department_id(+) = d.department_id;

-- FULL OUTER JOIN (좌우 상관 없음)
SELECT * FROM employees FULL OUTER JOIN departments ON
employees.department_id = departments.department_id; -- 127개