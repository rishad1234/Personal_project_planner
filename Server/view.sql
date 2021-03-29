

-- A view that contains all projects
CREATE OR REPLACE VIEW all_projects AS
select pr.project_id, pr.project_name, pr.project_description, pr.created_at, pr.estimated_end_date, pt.type_name, pt.type_id from project_running pr 
join project_type_link link1 on pr.project_id = link1.project_id join project_type pt on link1.type_id = pt.type_id
Union
select ps.project_id, ps.project_name, ps.project_description, ps.created_at, ps.estimated_end_date, pt.type_name, pt.type_id from project_started ps 
join project_type_link link2 on ps.project_id = link2.project_id join project_type pt on link2.type_id = pt.type_id
Union
select pc.project_id, pc.project_name, pc.project_description, pc.created_at, pc.estimated_end_date, pt.type_name, pt.type_id from project_completed@site1 pc 
join project_type_link@site1 link3 on pc.project_id = link3.project_id join project_type pt on link3.type_id = pt.type_id
Union
select pa.project_id, pa.project_name, pa.project_description, pa.created_at, pa.estimated_end_date, pt.type_name, pt.type_id from project_archived@site1 pa 
join project_type_link@site1 link4 on pa.project_id = link4.project_id join project_type pt on link4.type_id = pt.type_id;



--select all from project types and the count of the projects with that

CREATE OR REPLACE VIEW all_project_type_with_count AS
select pt.type_id, pt.type_name, pt.description, count(link.project_id) as project_count from project_type pt
join (select * from project_type_link Union select * from project_type_link@site1) link on pt.type_id = link.type_id
group by pt.type_id, pt.type_name, pt.description;


--select projects with estimated end time in desc
CREATE OR REPLACE VIEW all_project_with_est_desc AS
select project_name, project_description, created_at, estimated_end_date from project_started
union 
select project_name, project_description, created_at, estimated_end_date from project_running
union 
select project_name, project_description, created_at, estimated_end_date from project_archived@site1 
union
select project_name, project_description, created_at, estimated_end_date from project_completed@site1
order by estimated_end_date desc;

--select projects with created desc
CREATE OR REPLACE VIEW all_project_with_created_desc AS
select project_name, project_description, created_at, estimated_end_date from project_started
union 
select project_name, project_description, created_at, estimated_end_date from project_running
union 
select project_name, project_description, created_at, estimated_end_date from project_archived@site1 
union
select project_name, project_description, created_at, estimated_end_date from project_completed@site1
order by created_at desc;


--select projects with estimated time asc
CREATE OR REPLACE VIEW all_project_with_est_asc AS
select project_name, project_description, created_at, estimated_end_date from project_started
union 
select project_name, project_description, created_at, estimated_end_date from project_running
union 
select project_name, project_description, created_at, estimated_end_date from project_archived@site1 
union
select project_name, project_description, created_at, estimated_end_date from project_completed@site1
order by estimated_end_date;


--select projects with created asc
CREATE OR REPLACE VIEW all_project_with_created_asc AS
select project_name, project_description, created_at, estimated_end_date from project_started
union 
select project_name, project_description, created_at, estimated_end_date from project_running
union 
select project_name, project_description, created_at, estimated_end_date from project_archived@site1 
union
select project_name, project_description, created_at, estimated_end_date from project_completed@site1
order by created_at;


--select all projects based on project status
CREATE OR REPLACE VIEW all_project_with_status AS
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



--select all project_status_link
CREATE OR REPLACE VIEW p_status_link_view  AS
select * from project_status_link union select * from project_status_link@site1;

commit;