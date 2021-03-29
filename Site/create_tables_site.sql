clear screen;

drop table project_type CASCADE CONSTRAINTS;
drop table project_status CASCADE CONSTRAINTS;

create table project_type (
    type_id int Not Null,
    type_name varchar2(30) not null,
    description varchar(100),
    created_at DATE,
    PRIMARY KEY(type_id)
);

create table project_status (
    status_id int not null,
    status_name varchar2(30) not null,
    created_at DATE,
    PRIMARY KEY(status_id)
);

insert into project_type values(1, 'Art', 'Art project for the Gallery', CURRENT_DATE);
insert into project_type values(2, 'Personal Development', 'Self development projects', CURRENT_DATE);
insert into project_type values(3, 'Web Development', 'Web deb projects for work', CURRENT_DATE);
insert into project_type values(4, 'Presentation', 'Presentation work for workshops', CURRENT_DATE);


insert into project_status values(1, 'Running', CURRENT_DATE);
insert into project_status values(2, 'Completed', CURRENT_DATE);
insert into project_status values(3, 'Started', CURRENT_DATE);
insert into project_status values(4, 'Archived', CURRENT_DATE);

SET linesize 300
SET pagesize 300

column description format A40
column created_at format A40

commit;

--for site

drop table project_completed CASCADE CONSTRAINTS;
drop table project_archived CASCADE CONSTRAINTS;
drop table project_type_link CASCADE CONSTRAINTS;
drop table project_status_link CASCADE CONSTRAINTS;

create table project_completed (
    project_id int not null,
    project_name varchar2(30) not null,
    project_description varchar2(30),
    created_at Date,
    estimated_end_date Date,
    PRIMARY KEY(project_id) 
);

create table project_archived (
    project_id int not null,
    project_name varchar2(30) not null,
    project_description varchar2(30),
    created_at Date,
    estimated_end_date Date,
    PRIMARY KEY(project_id) 
);

create table project_type_link (
    project_id int Not Null,
    type_id int not null
);

create table project_status_link (
    project_id int not null,
    status_id int not null
);


insert into project_completed values(1, 'Project A', 'lorem ipsum dolor sample', TO_DATE('2019-12-15', 'YYYY-MM-DD'), TO_DATE('2020-4-1', 'YYYY-MM-DD'));
insert into project_completed values(2, 'Project B', 'lorem ipsum dolor sample', TO_DATE('2019-12-20', 'YYYY-MM-DD'), TO_DATE('2020-4-5', 'YYYY-MM-DD'));
insert into project_completed values(3, 'Project C', 'lorem ipsum dolor sample', TO_DATE('2019-12-25', 'YYYY-MM-DD'), TO_DATE('2020-4-10', 'YYYY-MM-DD'));
insert into project_completed values(4, 'Project D', 'lorem ipsum dolor sample', TO_DATE('2019-12-30', 'YYYY-MM-DD'), TO_DATE('2020-4-15', 'YYYY-MM-DD'));
insert into project_completed values(5, 'Project E', 'lorem ipsum dolor sample', TO_DATE('2020-10-10', 'YYYY-MM-DD'), TO_DATE('2021-4-2', 'YYYY-MM-DD'));
insert into project_completed values(6, 'Project F', 'lorem ipsum dolor sample', TO_DATE('2020-10-15', 'YYYY-MM-DD'), TO_DATE('2021-4-4', 'YYYY-MM-DD'));
insert into project_completed values(7, 'Project G', 'lorem ipsum dolor sample', TO_DATE('2020-10-20', 'YYYY-MM-DD'), TO_DATE('2021-4-5', 'YYYY-MM-DD'));
insert into project_completed values(8, 'Project H', 'lorem ipsum dolor sample', TO_DATE('2020-10-25', 'YYYY-MM-DD'), TO_DATE('2021-4-7', 'YYYY-MM-DD'));



insert into project_archived values(9, 'Project I', 'lorem ipsum dolor sample', TO_DATE('2015-12-15', 'YYYY-MM-DD'), TO_DATE('2016-4-1', 'YYYY-MM-DD'));
insert into project_archived values(10, 'Project J', 'lorem ipsum dolor sample', TO_DATE('2015-12-20', 'YYYY-MM-DD'), TO_DATE('2016-4-5', 'YYYY-MM-DD'));
insert into project_archived values(11, 'Project K', 'lorem ipsum dolor sample', TO_DATE('2015-12-25', 'YYYY-MM-DD'), TO_DATE('2016-4-10', 'YYYY-MM-DD'));
insert into project_archived values(12, 'Project L', 'lorem ipsum dolor sample', TO_DATE('2015-12-30', 'YYYY-MM-DD'), TO_DATE('2016-4-15', 'YYYY-MM-DD'));
insert into project_archived values(13, 'Project M', 'lorem ipsum dolor sample', TO_DATE('2018-10-10', 'YYYY-MM-DD'), TO_DATE('2019-4-2', 'YYYY-MM-DD'));
insert into project_archived values(14, 'Project N', 'lorem ipsum dolor sample', TO_DATE('2018-10-15', 'YYYY-MM-DD'), TO_DATE('2019-4-4', 'YYYY-MM-DD'));
insert into project_archived values(15, 'Project O', 'lorem ipsum dolor sample', TO_DATE('2018-10-20', 'YYYY-MM-DD'), TO_DATE('2019-4-5', 'YYYY-MM-DD'));
insert into project_archived values(16, 'Project P', 'lorem ipsum dolor sample', TO_DATE('2018-10-15', 'YYYY-MM-DD'), TO_DATE('2019-4-7', 'YYYY-MM-DD'));


insert into project_type_link values(1, 1);
insert into project_type_link values(2, 2);
insert into project_type_link values(3, 3);
insert into project_type_link values(4, 4);
insert into project_type_link values(5, 1);
insert into project_type_link values(6, 2);
insert into project_type_link values(7, 3);
insert into project_type_link values(8, 4);
insert into project_type_link values(9, 1);
insert into project_type_link values(10, 2);
insert into project_type_link values(11, 3);
insert into project_type_link values(12, 4);
insert into project_type_link values(13, 1);
insert into project_type_link values(14, 2);
insert into project_type_link values(15, 3);
insert into project_type_link values(16, 4);

insert into project_status_link values(1, 2);
insert into project_status_link values(2, 2);
insert into project_status_link values(3, 2);
insert into project_status_link values(4, 2);
insert into project_status_link values(5, 2);
insert into project_status_link values(6, 2);
insert into project_status_link values(7, 2);
insert into project_status_link values(8, 2);

insert into project_status_link values(9, 4);
insert into project_status_link values(10, 4);
insert into project_status_link values(11, 4);
insert into project_status_link values(12, 4);
insert into project_status_link values(13, 4);
insert into project_status_link values(14, 4);
insert into project_status_link values(15, 4);
insert into project_status_link values(16, 4);


select * from project_type;
select * from project_status;
select * from project_completed;
select * from project_archived;
select * from project_type_link;
select * from project_status_link;

--end site

--for server
/*
drop table project_running CASCADE CONSTRAINTS;
drop table project_started CASCADE CONSTRAINTS;
drop table project_type_link CASCADE CONSTRAINTS;
drop table project_status_link CASCADE CONSTRAINTS;

create table project_running (
    project_id int not null,
    project_name varchar2(30) not null,
    project_description varchar2(30),
    created_at Date,
    estimated_end_date Date,
    PRIMARY KEY(project_id) 
);

create table project_started (
    project_id int not null,
    project_name varchar2(30) not null,
    project_description varchar2(30),
    created_at Date,
    estimated_end_date Date,
    PRIMARY KEY(project_id) 
);

create table project_type_link (
    project_id int Not Null,
    type_id int not null
);

create table project_status_link (
    project_id int not null,
    status_id int not null
);


insert into project_running values(17, 'Project Q', 'lorem ipsum dolor sample', TO_DATE('2021-1-15', 'YYYY-MM-DD'), TO_DATE('2021-4-1', 'YYYY-MM-DD'));
insert into project_running values(18, 'Project R', 'lorem ipsum dolor sample', TO_DATE('2021-1-20', 'YYYY-MM-DD'), TO_DATE('2021-4-5', 'YYYY-MM-DD'));
insert into project_running values(19, 'Project S', 'lorem ipsum dolor sample', TO_DATE('2021-1-25', 'YYYY-MM-DD'), TO_DATE('2021-4-10', 'YYYY-MM-DD'));
insert into project_running values(20, 'Project T', 'lorem ipsum dolor sample', TO_DATE('2021-1-30', 'YYYY-MM-DD'), TO_DATE('2021-4-15', 'YYYY-MM-DD'));
insert into project_running values(21, 'Project U', 'lorem ipsum dolor sample', TO_DATE('2021-2-10', 'YYYY-MM-DD'), TO_DATE('2021-5-2', 'YYYY-MM-DD'));
insert into project_running values(22, 'Project V', 'lorem ipsum dolor sample', TO_DATE('2021-2-15', 'YYYY-MM-DD'), TO_DATE('2021-5-4', 'YYYY-MM-DD'));
insert into project_running values(23, 'Project W', 'lorem ipsum dolor sample', TO_DATE('2021-2-20', 'YYYY-MM-DD'), TO_DATE('2021-5-5', 'YYYY-MM-DD'));
insert into project_running values(24, 'Project X', 'lorem ipsum dolor sample', TO_DATE('2021-2-25', 'YYYY-MM-DD'), TO_DATE('2021-5-7', 'YYYY-MM-DD'));



insert into project_started values(25, 'Project Y', 'lorem ipsum dolor sample', TO_DATE('2021-2-15', 'YYYY-MM-DD'), TO_DATE('2021-4-1', 'YYYY-MM-DD'));
insert into project_started values(26, 'Project Z', 'lorem ipsum dolor sample', TO_DATE('2021-2-20', 'YYYY-MM-DD'), TO_DATE('2021-4-5', 'YYYY-MM-DD'));
insert into project_started values(27, 'Project 1', 'lorem ipsum dolor sample', TO_DATE('2021-2-25', 'YYYY-MM-DD'), TO_DATE('2021-4-10', 'YYYY-MM-DD'));
insert into project_started values(28, 'Project 2', 'lorem ipsum dolor sample', TO_DATE('2021-2-28', 'YYYY-MM-DD'), TO_DATE('2021-4-15', 'YYYY-MM-DD'));
insert into project_started values(29, 'Project 3', 'lorem ipsum dolor sample', TO_DATE('2021-3-10', 'YYYY-MM-DD'), TO_DATE('2021-5-2', 'YYYY-MM-DD'));
insert into project_started values(30, 'Project 4', 'lorem ipsum dolor sample', TO_DATE('2021-3-15', 'YYYY-MM-DD'), TO_DATE('2021-5-4', 'YYYY-MM-DD'));
insert into project_started values(31, 'Project 5', 'lorem ipsum dolor sample', TO_DATE('2021-3-20', 'YYYY-MM-DD'), TO_DATE('2021-5-5', 'YYYY-MM-DD'));
insert into project_started values(32, 'Project 6', 'lorem ipsum dolor sample', TO_DATE('2021-3-15', 'YYYY-MM-DD'), TO_DATE('2021-5-7', 'YYYY-MM-DD'));


insert into project_type_link values(17, 1);
insert into project_type_link values(18, 2);
insert into project_type_link values(19, 3);
insert into project_type_link values(20, 4);
insert into project_type_link values(21, 1);
insert into project_type_link values(22, 2);
insert into project_type_link values(23, 3);
insert into project_type_link values(24, 4);
insert into project_type_link values(25, 1);
insert into project_type_link values(26, 2);
insert into project_type_link values(27, 3);
insert into project_type_link values(28, 4);
insert into project_type_link values(29, 1);
insert into project_type_link values(30, 2);
insert into project_type_link values(31, 3);
insert into project_type_link values(32, 4);

insert into project_status_link values(17, 1);
insert into project_status_link values(18, 1);
insert into project_status_link values(19, 1);
insert into project_status_link values(20, 1);
insert into project_status_link values(21, 1);
insert into project_status_link values(22, 1);
insert into project_status_link values(23, 1);
insert into project_status_link values(24, 1);

insert into project_status_link values(25, 3);
insert into project_status_link values(26, 3);
insert into project_status_link values(27, 3);
insert into project_status_link values(28, 3);
insert into project_status_link values(29, 3);
insert into project_status_link values(30, 3);
insert into project_status_link values(31, 3);
insert into project_status_link values(32, 3);

select * from project_type;
select * from project_status;
select * from project_running;
select * from project_started;
select * from project_type_link;
select * from project_status_link;
*/
--end server

commit;