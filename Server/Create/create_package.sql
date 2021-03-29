SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE create_package AS
	
	PROCEDURE create_p_type(t_name in varchar2, t_description in varchar2);
    PROCEDURE create_project(pname in varchar2, pdescription in varchar2, pestimated varchar2, t_id in int, p_status_id in int);
END create_package;
/

CREATE OR REPLACE PACKAGE BODY create_package AS

	
	PROCEDURE create_p_type(t_name in varchar2, t_description in varchar2)
	IS
        t_id int;
	BEGIN
        for R in (select * from project_type@site1 order by type_id) loop
            t_id := R.type_id;
        end loop;
        t_id  := t_id + 1;
        DBMS_OUTPUT.PUT_LINE(t_id);

        insert into project_type values(t_id, t_name, t_description, CURRENT_DATE);
        insert into project_type@site1 values(t_id, t_name, t_description, CURRENT_DATE);
        commit;
    EXCEPTION 
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('An error occurred. Please re run the file');
	END create_p_type;

    PROCEDURE create_project(pname in varchar2, pdescription in varchar2, pestimated varchar2, t_id in int, p_status_id in int)
    IS
        p_id int;
    BEGIN
        for R in (select * from all_projects order by project_id) loop
            p_id := R.project_id;
        end loop;
        p_id := p_id + 1;

        if p_status_id = 1 then
            insert into project_running values(p_id, pname, pdescription, CURRENT_DATE, TO_DATE(pestimated, 'YYYY-MM-DD'));
            insert into project_type_link values(p_id, t_id);
            insert into project_status_link values(p_id, p_status_id);
        elsif p_status_id = 2 then
            insert into project_completed@site1 values(p_id, pname, pdescription, CURRENT_DATE, TO_DATE(pestimated, 'YYYY-MM-DD'));
            insert into project_type_link@site1 values(p_id, t_id);
            insert into project_status_link@site1 values(p_id, p_status_id);
        elsif p_status_id = 3 then
            insert into project_started values(p_id, pname, pdescription, CURRENT_DATE, TO_DATE(pestimated, 'YYYY-MM-DD'));
            insert into project_type_link values(p_id, t_id);
            insert into project_status_link values(p_id, p_status_id);
        elsif p_status_id = 4 then
            insert into project_archived@site1 values(p_id, pname, pdescription, CURRENT_DATE, TO_DATE(pestimated, 'YYYY-MM-DD'));
            insert into project_type_link@site1 values(p_id, t_id);
            insert into project_status_link@site1 values(p_id, p_status_id);
        END IF;
        commit;
    EXCEPTION 
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('An error occurred. Please re run the file');
    END create_project;
	
END create_package;
/

--SELECT mypack.F1(20) FROM DUAL;
--EXEC mypack.P1(21);
-- DECLARE
-- 	D number;
-- BEGIN
-- 	-- create_package.create_p_type('Science1', 'Science Projects1');
--     -- create_package.create_project('ramdom', 'asdgsgfd fdsa', '2021-3-1', 6, 4);
-- END;
-- /


