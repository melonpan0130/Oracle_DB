-- NATURAL JOIN 테스트 하기
create table test_join (
    test varchar2(20),
    no number(2)
);

create table test_natural_join (
    join_id varchar2(10),
    job_title varchar(25) not null,
    test number(10)
);

select * from tab;

INSERT INTO test_join VALUES('1000', 20);
INSERT INTO test_natural_join VALUES('10', 'TEST_JOB', 1000);

SELECT * FROM test_join NATURAL JOIN test_natural_join;
-- 데이터 타입이 달라도 숫자값이 같으면 같은것으로 인식

INSERT INTO test_join VALUES('ABC', 20);
-- 숫자가 아닌것이 하나라도 존재하면 NATURAL JOIN 이 일어나지 않는다.


-- JOIN ~ USING : SELF-JOIN은 못함
-- #.1 employees, departments 테이블을 이용해 사원명, 부서번호, 부서명을 USING 절을 사용하여 조회
SELECT first_name, emp.department_id, department_name
FROM employees emp JOIN departments USING (department_id);
-- select문에 공통컬럼은 별칭을 쓰지 않음

-- #.2 departments, locations 테이블을 이용하여 부서번호, 부서명, 지역코드, 도시정보를
-- USING절을 이용해 조회(단, 부서번호 20, 50, 80, 110번만 부서번호 순으로 조회)
SELECT department_id, department_name, location_id, city
FROM departments JOIN locations USING (location_id)
WHERE department_id IN(20, 50, 80, 110)
ORDER BY 1;

-- #.3 사원명, 부서명, 근무도시 정보 조회(USING절 사용)
SELECT first_name, department_name, city
FROM employees JOIN departments USING(department_id) 
               JOIN locations USING (location_id);


-- JOIN ~ ON : SELF-JOIN 가능
-- #.1 사원명, 급여, 해당사원의 매니저명, 매니저 급여 조회(JOIN ON 구문 이용) -> SELF JOIN
SELECT e.first_name, e.salary, m.first_name, m.salary
FROM employees e JOIN employees m ON m.employee_id = e.manager_id;

-- #.2 이름에 A, a문자가 없는 사원의 사원명, 부서명, 근무도시 정보 조회(사원명 순으로 정렬)
SELECT e.first_name, e.department_id, l.city
FROM employees e JOIN departments d ON e.department_id = d.department_id 
                 JOIN locations l ON d.location_id = l.location_id
WHERE NOT(first_name LIKE '%A%' OR first_name LIKE '%a%')
-- WHERE first_name NOT LIKE '%A%' AND first_name NOT LIKE '%a%'
ORDER BY 1;