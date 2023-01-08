use soft_uni;
-- Problem 1

select first_name,last_name, salary
from employees
where salary=
(
select salary 
from Employees
order by salary
limit 1
);

-- Problem 2

select first_name,last_name, salary
from employees
where salary <=
(
select salary 
from Employees
order by salary
limit 1
)*1.1;

-- Problem 3

select first_name, last_name, job_title
from Employees where employee_id in 
(
select manager_id from departments
)
order by first_name asc, last_name asc;

-- Problem 4

select first_name, last_name
from employees
where address_id in
(
  select address_id
  from Addresses where town_id = 
  (
   select town_id
   from towns 
   where name = 'San Francisco'
  )
);



