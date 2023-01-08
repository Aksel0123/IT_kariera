-- Problem 1

use gringotts;

select deposit_group, sum(deposit_amount) as total_sum
from wizzard_deposits
where magic_wand_creator like 'Ollivander%'
group by deposit_group 
order by deposit_group;

-- Problem 2

select deposit_group, sum(deposit_amount) as total_sum
from wizzard_deposits
where magic_wand_creator like 'Ollivander%'
group by deposit_group 
having total_sum<150000
order by deposit_group