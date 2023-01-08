-- Problem 1

USE soft_uni;

SELECT first_name, last_name, salary 
FROM employees 
where salary>50000
ORDER BY salary DESC;

-- Problem 2

Select first_name, last_name
from employees
order by salary desc
limit 5;

-- Problem 3

select * 
from employees
order by salary desc, first_name ASC, last_name desc, middle_name ASC;

-- Problem 4

select * from Projects
order by start_date, name ASC
limit 10;

-- Problem 5

select first_name, last_name, hire_date 
from employees
order by hire_date desc
limit 7;

-- Problem 6

use geography;

select peak_name 
from peaks
order by peak_name;

-- Problem 7

select country_name, population
from countries
where continent_code='EU'
order by population desc, country_name asc
limit 30;

-- Problem 8

select country_name, country_code, 
CASE 
WHEN currency_code='EUR' 
Then 'Euro' else 'Not Euro' 
end as 'Currency'
from countries
order by country_name
