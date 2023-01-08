use bsc1;

-- 01
select id, username
from users
order by id;

-- 02
select * 
from repositories_contributors
where repository_id=contributor_id
order by repository_id;

-- 03
select i.id, concat(username, ':', title) as issue_assignee
from users as u
join issues as i on i.assignee_id=u.id
order by i,id desc;

-- 04
select id, name, concat(size, 'KB') as size
from files
where id not in (select distinct parent_id from files where parent_id is not null)
order by id;

-- 05
select r.id, name, count(*) as issues
from repositories as r
join issues as i on i.repository_id=r.id
group by r.id, r.name
ORDER BY issues desc, r.id asc
limit 5;

-- 06
select repository_id, 
(select name from repositories where id=repository_id) as name,
(select count(*) from commits where repository_id=rc.repository_id
group by repository_id) as commits, 
count(*) as contributors
from repositories_contributors as rc
group by repository_id
order by contributors desc, repository_id
limit 1;

-- 07
select r.id, r.name, (select count(distinct contributor_id)from commits where repository_id=r.id) as users
from repositories as r
left join issues as c on c.repository_id=r.id
group by name, r.id
order by users desc, r.id asc;