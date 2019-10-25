select e.first_name, em.first_name
from employees e, employees em
where e.first_name='Ellen' AND e.manager_id=em.employee_id