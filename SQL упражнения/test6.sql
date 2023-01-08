use soft_uni;

-- Problem 1

select employee_id, job_title, a.address_id, address_text 
from employees as e
join addresses as a on a.address_id=e.address_id
order by address_id limit 5;

-- Problem 2

select employee_id, first_name, last_name, name
from employees as e
join departments as d on d.department_id=e.department_id
where name='Sales'
order by employee_id desc;

-- Problem 3

select employee_id, first_name, salary, name
from employees as e 
join departments as d on d.department_id=e.department_id
where salary  > 15000
order by e.department_id desc;

-- Problem 4

select employee_id, first_name 
from employees as e
where employee_id not in (select distinct employee_id 
from employees_projects)
order by employee_id desc
Limit 3;

-- Problem 5 

select e.employee_id, e.first_name, e.manager_id, em.first_name as 'manager_name' 
from employees as e
join employees as em on e.manager_id=em.employee_id
where em.employee_id= 3 or em.employee_id=7
order by e.first_name asc;

-- Problem 6

select salary, name
from employees as e
join departments as d on d.department_id=e.department_id
order by salary asc
limit 1;

-- Problem 7

use geography;

select country_name
from countries
where country_code not in (select distinct country_code
from mountains_countries);

