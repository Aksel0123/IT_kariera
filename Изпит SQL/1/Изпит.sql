create database CJMS;

USE CJMS;

-- Data Definition Language (DDL) – 30pts
-- planets

create table planets
(
id int primary key auto_increment,
name varchar(30) not null
);

-- spaceports

create table spaceports
(
id int primary key auto_increment,
name varchar(50) not null,
planet_id int not null,
constraint fk_spaceports_planets
foreign key (planet_id)
references planets(id)
);

-- spaceships

create table spaceships
(
id int primary key auto_increment,
name varchar(50) not null,
manufacturer varchar(30) not null,
light_speed_rate int default 0
);

-- colonists, -- check (len(ucn)=10),

create table colonists
(
id int primary key auto_increment,
first_name varchar(20) not null,
last_name varchar(20) not null,
ucn char(10) unique not null,
birth_date date not null
);

-- journeys

create table journeys
(
id int primary key auto_increment,
journey_start datetime not null,
journey_end datetime not null,
purpose enum('Medical','Technical','Educational','Military'),
destination_spaceport_id int not null,
spaceship_id int not null,
constraint fk_journeys_spaceports
foreign key (destination_spaceport_id)
references spaceports(id),
constraint fk_journeys_spaceships
foreign key (spaceship_id)
references spaceships(id)
);

-- travel_cards

create table travel_cards
(
id int primary key auto_increment,
card_number char(10) unique not null check (len(ucn)=10),
job_during_journey enum('Pilot','Engineer','Trooper','Cleaner','Cook'),
colonist_id int not null,
journey_id int not null,
constraint fk_travel_cards_Colonists
foreign key (colonist_id)
references colonists(id),
constraint fk_travel_cards_journeys
foreign key (journey_id)
references journeys(id)
);

-- 2 Data Manipulation Language (DML) – 30 pts

 insert into travel_cards (card_number, job_during_journey, colonist_id, journey_id)
select case 
when c.birth_date>'1980-01-01' then concat(year(c.birth_date), day(c.birth_date), left(c.ucn,4))
else concat(year(c.birth_date), month(c.birth_date), right(c.ucn,4))
end as card_number,
case
when c.id%2=0 then 'Pilot'
when c.id%3=0 then 'Cook'
else 'Engineer'
end as job_during_journey,
c.id as colonist_id,
left(c.ucn,1) as journey_id
from colonists as c
where c.id between 96 and 100;

-- 3 Вмъкване на данни

update journeys
set purpose='Medical'
where id%2=0;
update journeys
set purpose='Technical'
where id%3=0;
update journeys
set purpose='Educational'
where id%5=0;
update journeys
set purpose='Military'
where id%7=0;

-- 4 Изтриване на данни

delete from colonist
where id not in (select colonist_id from travel_cards);

-- 5 Извлечете всички карти за пътуване

select  card_number, job_during_journey
from travel_cards
order by card_number;

-- 6 Извлечете всички колонисти

select id, concat(first_name, ' ', last_name) as 'full_name',ucn
from colonists
order by first_name, last_name, id;

-- 7 Извличане на всички

select id, journey_start, journey_end 
from journeys
where purpose='Military'
order by journey_start;

-- 8 Най-бърз пилот

select id, concat(first_name, ' ', last_name) as 'full_name',ucn
from colonists
where id in 
(
select colonist_id
from travel_cards
where job_during_journey='Pilot'
)
order by id asc;

-- 9 Най-бързия кораб
select s.name as spaceship_name, sp.name as spaceport_name
from spaceships as s
join journeys as j on j.spaceship_id=s.id
join spaceports as sp on sp.id=j.destination_spaceport_id
order by light_speed_rate desc
limit 1;

-- 10

select sp.name as sapceport_nmae, p.name as planet_name  
from planets as p
join spaceships as s on s.planet_id=p.id
join journeys as j on j.destination_sapceport_id=s.id
where purpose = 'Educational'
order by s.name desc;

-- 11

select p.name as planet_name, count(*) as journeys_count
from planets as p
join spaceports as s on s.planet_id=p.id
join journeys as j on j.destination_spaceport_id=s.id
group by p.name
order by journeys_count desc