-- 1
--select all projects from the database
/*
select pr.project_id, pr.project_name, pr.project_description, pr.created_at, pr.estimated_end_date, pt.type_name from project_running pr 
join project_type_link link1 on pr.project_id = link1.project_id join project_type pt on link1.type_id = pt.type_id
Union
select ps.project_id, ps.project_name, ps.project_description, ps.created_at, ps.estimated_end_date, pt.type_name from project_started ps 
join project_type_link link2 on ps.project_id = link2.project_id join project_type pt on link2.type_id = pt.type_id
Union
select pc.project_id, pc.project_name, pc.project_description, pc.created_at, pc.estimated_end_date, pt.type_name from project_completed@site1 pc 
join project_type_link@site1 link3 on pc.project_id = link3.project_id join project_type pt on link3.type_id = pt.type_id
Union
select pa.project_id, pa.project_name, pa.project_description, pa.created_at, pa.estimated_end_date, pt.type_name from project_archived@site1 pa 
join project_type_link@site1 link4 on pa.project_id = link4.project_id join project_type pt on link4.type_id = pt.type_id;
*/
-- 2
--select all projects where project type is 'Art'
/*
select pr.project_id, pr.project_name, pr.project_description, pr.created_at, pr.estimated_end_date, pt.type_name from project_running pr 
join project_type_link link1 on pr.project_id = link1.project_id join project_type pt on link1.type_id = pt.type_id where pt.type_name='Art'
Union
select ps.project_id, ps.project_name, ps.project_description, ps.created_at, ps.estimated_end_date, pt.type_name from project_started ps 
join project_type_link link2 on ps.project_id = link2.project_id join project_type pt on link2.type_id = pt.type_id where pt.type_name='Art'
Union
select pc.project_id, pc.project_name, pc.project_description, pc.created_at, pc.estimated_end_date, pt.type_name from project_completed@site1 pc 
join project_type_link@site1 link3 on pc.project_id = link3.project_id join project_type pt on link3.type_id = pt.type_id where pt.type_name='Art'
Union
select pa.project_id, pa.project_name, pa.project_description, pa.created_at, pa.estimated_end_date, pt.type_name from project_archived@site1 pa 
join project_type_link@site1 link4 on pa.project_id = link4.project_id join project_type pt on link4.type_id = pt.type_id where pt.type_name='Art';
*/

-- 3
-- select all projects where project type is 'Personal Development'
/*
select pr.project_id, pr.project_name, pr.project_description, pr.created_at, pr.estimated_end_date, pt.type_name from project_running pr 
join project_type_link link1 on pr.project_id = link1.project_id join project_type pt on link1.type_id = pt.type_id where pt.type_name='Personal Development'
Union
select ps.project_id, ps.project_name, ps.project_description, ps.created_at, ps.estimated_end_date, pt.type_name from project_started ps 
join project_type_link link2 on ps.project_id = link2.project_id join project_type pt on link2.type_id = pt.type_id where pt.type_name='Personal Development'
Union
select pc.project_id, pc.project_name, pc.project_description, pc.created_at, pc.estimated_end_date, pt.type_name from project_completed@site1 pc 
join project_type_link@site1 link3 on pc.project_id = link3.project_id join project_type pt on link3.type_id = pt.type_id where pt.type_name='Personal Development'
Union
select pa.project_id, pa.project_name, pa.project_description, pa.created_at, pa.estimated_end_date, pt.type_name from project_archived@site1 pa 
join project_type_link@site1 link4 on pa.project_id = link4.project_id join project_type pt on link4.type_id = pt.type_id where pt.type_name='Personal Development';
*/

-- 4
-- select all projects where project type is 'Web Development'
/*
select pr.project_id, pr.project_name, pr.project_description, pr.created_at, pr.estimated_end_date, pt.type_name from project_running pr 
join project_type_link link1 on pr.project_id = link1.project_id join project_type pt on link1.type_id = pt.type_id where pt.type_name='Web Development'
Union
select ps.project_id, ps.project_name, ps.project_description, ps.created_at, ps.estimated_end_date, pt.type_name from project_started ps 
join project_type_link link2 on ps.project_id = link2.project_id join project_type pt on link2.type_id = pt.type_id where pt.type_name='Web Development'
Union
select pc.project_id, pc.project_name, pc.project_description, pc.created_at, pc.estimated_end_date, pt.type_name from project_completed@site1 pc 
join project_type_link@site1 link3 on pc.project_id = link3.project_id join project_type pt on link3.type_id = pt.type_id where pt.type_name='Web Development'
Union
select pa.project_id, pa.project_name, pa.project_description, pa.created_at, pa.estimated_end_date, pt.type_name from project_archived@site1 pa 
join project_type_link@site1 link4 on pa.project_id = link4.project_id join project_type pt on link4.type_id = pt.type_id where pt.type_name='Web Development';
*/

-- 5
-- select all projects where project type is 'Presentation'
/*
select pr.project_id, pr.project_name, pr.project_description, pr.created_at, pr.estimated_end_date, pt.type_name from project_running pr 
join project_type_link link1 on pr.project_id = link1.project_id join project_type pt on link1.type_id = pt.type_id where pt.type_name='Presentation'
Union
select ps.project_id, ps.project_name, ps.project_description, ps.created_at, ps.estimated_end_date, pt.type_name from project_started ps 
join project_type_link link2 on ps.project_id = link2.project_id join project_type pt on link2.type_id = pt.type_id where pt.type_name='Presentation'
Union
select pc.project_id, pc.project_name, pc.project_description, pc.created_at, pc.estimated_end_date, pt.type_name from project_completed@site1 pc 
join project_type_link@site1 link3 on pc.project_id = link3.project_id join project_type pt on link3.type_id = pt.type_id where pt.type_name='Presentation'
Union
select pa.project_id, pa.project_name, pa.project_description, pa.created_at, pa.estimated_end_date, pt.type_name from project_archived@site1 pa 
join project_type_link@site1 link4 on pa.project_id = link4.project_id join project_type pt on link4.type_id = pt.type_id where pt.type_name='Presentation';
*/

-- 6
--select all from project types and the count of the projects with that
/*
select pt.type_id, pt.type_name, pt.description, count(link.project_id) as project_count from project_type pt
join (select * from project_type_link Union select * from project_type_link@site1) link on pt.type_id = link.type_id
group by pt.type_id, pt.type_name, pt.description;
*/

-- 7
-- select project type of 'Art' and the count of the projects with that
/*
select pt.type_id, pt.type_name, pt.description, count(link.project_id) as project_count from project_type pt
join (select * from project_type_link Union select * from project_type_link@site1) link on pt.type_id = link.type_id
where pt.type_name = 'Art'
group by pt.type_id, pt.type_name, pt.description;
*/

-- 8
-- select project type of 'Personal Development' and the count of the projects with that
/*
select pt.type_id, pt.type_name, pt.description, count(link.project_id) as project_count from project_type pt
join (select * from project_type_link Union select * from project_type_link@site1) link on pt.type_id = link.type_id
where pt.type_name = 'Personal Development'
group by pt.type_id, pt.type_name, pt.description;
*/

-- 9
-- select project type of 'Web Development' and the count of the projects with that
/*
select pt.type_id, pt.type_name, pt.description, count(link.project_id) as project_count from project_type pt
join (select * from project_type_link Union select * from project_type_link@site1) link on pt.type_id = link.type_id
where pt.type_name = 'Web Development'
group by pt.type_id, pt.type_name, pt.description;
*/

-- 10
-- select project type of 'Presentation' and the count of the projects with that
/*
select pt.type_id, pt.type_name, pt.description, count(link.project_id) as project_count from project_type pt
join (select * from project_type_link Union select * from project_type_link@site1) link on pt.type_id = link.type_id
where pt.type_name = 'Presentation'
group by pt.type_id, pt.type_name, pt.description;
*/

--11
--select all projects with the estimated end time in desc
/*
select project_name, project_description, created_at, estimated_end_date from project_started
union 
select project_name, project_description, created_at, estimated_end_date from project_running
union 
select project_name, project_description, created_at, estimated_end_date from project_archived@site1 
union
select project_name, project_description, created_at, estimated_end_date from project_completed@site1
order by estimated_end_date desc;
*/

--12
--select all projects with the created_at in desc
/*
select project_name, project_description, created_at, estimated_end_date from project_started
union 
select project_name, project_description, created_at, estimated_end_date from project_running
union 
select project_name, project_description, created_at, estimated_end_date from project_archived@site1 
union
select project_name, project_description, created_at, estimated_end_date from project_completed@site1
order by created_at desc;
*/

--13
--select all projects with the estimated end time in desc
/*
select project_name, project_description, created_at, estimated_end_date from project_started
union 
select project_name, project_description, created_at, estimated_end_date from project_running
union 
select project_name, project_description, created_at, estimated_end_date from project_archived@site1 
union
select project_name, project_description, created_at, estimated_end_date from project_completed@site1
order by estimated_end_date;
*/

--13
--select all projects with the created_at in desc
/*
select project_name, project_description, created_at, estimated_end_date from project_started
union 
select project_name, project_description, created_at, estimated_end_date from project_running
union 
select project_name, project_description, created_at, estimated_end_date from project_archived@site1 
union
select project_name, project_description, created_at, estimated_end_date from project_completed@site1
order by created_at;
*/

-- 14
--select all projects from the database
/*
select pr.project_id, pr.project_name, pr.project_description, pr.created_at, pr.estimated_end_date, pt.status_name from project_running pr 
join project_status_link link1 on pr.project_id = link1.project_id join project_status pt on link1.status_id = pt.status_id
Union
select ps.project_id, ps.project_name, ps.project_description, ps.created_at, ps.estimated_end_date, pt.status_name from project_started ps 
join project_status_link link2 on ps.project_id = link2.project_id join project_status pt on link2.status_id = pt.status_id
Union
select pc.project_id, pc.project_name, pc.project_description, pc.created_at, pc.estimated_end_date, pt.status_name from project_completed@site1 pc 
join project_status_link@site1 link3 on pc.project_id = link3.project_id join project_status pt on link3.status_id = pt.status_id
Union
select pa.project_id, pa.project_name, pa.project_description, pa.created_at, pa.estimated_end_date, pt.status_name from project_archived@site1 pa 
join project_status_link@site1 link4 on pa.project_id = link4.project_id join project_status pt on link4.status_id = pt.status_id;
*/