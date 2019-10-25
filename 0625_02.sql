SELECT * FROM hremp WHERE first_name='Jack';

-- CREATE INDEX IDX_SHOP_FIRSTNAME ON HREMP (FIRST_NAME);

/*
CREATE VIEW SHOPDIV.MEMBER_ADDRESS_VIEW
AS SELECT 
    membername, memberaddress
FROM shopdiv.membertbl;
*/

SELECT first_name, employees.department_id, departments.department_id, departments.department_id, departments.department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id;