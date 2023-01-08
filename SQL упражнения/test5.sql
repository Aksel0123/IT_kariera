use soft_UNI;

SELECT concat_ws(' ', e.first_name, e.middle_name, e.last_name) as 'Full name', 
t.name as 'Town'
from Employees as e
join addresses as a on a.address_id=e.address_id
join towns as t on t.town_id=a.town_id;

use geography;

select country_name, c.currency_code, description, co.continent_name
from countries as c
join currencies as cu on cu.currency_code=c.currency_code
join continents as co on co.continent_code=c.continent_code;
    
use soft_uni;    

select * 
from addresses as a
right join towns as t on t.town_id=a.town_id
order by t.town_id;

SELECT *
from towns;

insert into towns(name) values ('Dorkovo'),('Ruse'),('Velingrad')


