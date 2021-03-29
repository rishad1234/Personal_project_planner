SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE update_package AS

    FUNCTION update_p_description(id in number, description in varchar2)
    return NUMBER;

    procedure update_estimated(id in number, estimated in varchar2);

    procedure update_p_name(id in number, p_name in varchar2);

    procedure update_status(pid in number, sid in number);

END update_package;
/

CREATE OR REPLACE PACKAGE BODY update_package AS

    FUNCTION update_p_description(id in number, description in varchar2)
    return NUMBER
    IS
        p_id int;
        p_s_id int;

        invalid_project_id EXCEPTION;

        flag int := 1;
    BEGIN
        for R in (select * from p_status_link_view) loop
            IF id = R.project_id then
                p_s_id := R.status_id;
                flag := 0;
            end if;
        end loop;
        -- DBMS_OUTPUT.PUT_LINE(p_s_id);

        if flag = 1 then
            RAISE invalid_project_id;
        END if;

        if p_s_id = 1 then
            update project_running set project_description = description where project_id = id;
        elsif p_s_id = 2 then
            update project_completed@site1 set project_description = description where project_id = id;
        elsif p_s_id = 3 then
            update project_started set project_description = description where project_id = id;
        elsif p_s_id = 4 then
            update project_archived@site1 set project_description = description where project_id = id;
        end IF;
        
        commit;
        return 1;
    EXCEPTION
    when invalid_project_id THEN
        DBMS_OUTPUT.PUT_LINE('Invalid project id given');
    when NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found. Please re run the file');
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('An error occurred. Please re run the file');
    
    END update_p_description;

    procedure update_estimated(id in number, estimated in varchar2)
    IS
        p_id int;
        p_s_id int;

        flag int := 1;

        invalid_project_id EXCEPTION;
    BEGIN
        for R in (select * from p_status_link_view) loop
            IF id = R.project_id then
                p_s_id := R.status_id;
                flag := 0;
            end if;
        end loop;

        if flag = 1 then
            RAISE invalid_project_id;
        END if;

        if p_s_id = 1 then
            update project_running set estimated_end_date = TO_DATE(estimated, 'YYYY-MM-DD') where project_id = id;
        elsif p_s_id = 2 then
            update project_completed@site1 set estimated_end_date = TO_DATE(estimated, 'YYYY-MM-DD') where project_id = id;
        elsif p_s_id = 3 then
            update project_started set estimated_end_date = TO_DATE(estimated, 'YYYY-MM-DD') where project_id = id;
        elsif p_s_id = 4 then
            update project_archived@site1 set estimated_end_date = TO_DATE(estimated, 'YYYY-MM-DD') where project_id = id;
        end IF;

        commit;

    EXCEPTION
    when invalid_project_id THEN
        DBMS_OUTPUT.PUT_LINE('Invalid project id given');
    when NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found. Please re run the file');
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('An error occurred. Please re run the file');

    End  update_estimated;
	
    procedure update_p_name(id in number, p_name in varchar2)
    IS
        p_id int;
        p_s_id int;

        flag int := 1;
        invalid_project_id EXCEPTION;
    BEGIN
        for R in (select * from p_status_link_view) loop
            IF id = R.project_id then
                p_s_id := R.status_id;
                flag := 0;
            end if;
        end loop;

        if flag = 1 then
            RAISE invalid_project_id;
        END if;

        if p_s_id = 1 then
            update project_running set project_name = p_name where project_id = id;
        elsif p_s_id = 2 then
            update project_completed@site1 set project_name = p_name where project_id = id;
        elsif p_s_id = 3 then
            update project_started set project_name = p_name where project_id = id;
        elsif p_s_id = 4 then
            update project_archived@site1 set project_name = p_name where project_id = id;
        end IF;

        commit;

    EXCEPTION
    when invalid_project_id THEN
        DBMS_OUTPUT.PUT_LINE('Invalid project id given');
    when NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found. Please re run the file');
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('An error occurred. Please re run the file');

    end update_p_name;
    
    procedure update_status(pid in number, sid in number)
    IS
        p_s_id int;

        prj_id int;
        p_name varchar2(30);
        p_description varchar2(30);
        p_created date;
        p_estimated date;

        flag int := 1;
        invalid_project_id EXCEPTION;
    BEGIN
        for R in (select * from p_status_link_view) loop
            IF pid = R.project_id then
                p_s_id := R.status_id;
                flag := 0;
            end if;
        end loop;

        if flag = 1 then
            RAISE invalid_project_id;
        END if;

        if p_s_id = 1 then
            select project_id, project_name, project_description, created_at, estimated_end_date into prj_id, p_name, p_description, p_created, p_estimated from project_running where project_id = pid;
            
            delete from project_status_link where project_id = prj_id and status_id = p_s_id;
            delete from project_running where project_id = prj_id;

        elsif p_s_id = 2 then
            select project_id, project_name, project_description, created_at, estimated_end_date into prj_id, p_name, p_description, p_created, p_estimated from project_completed@site1 where project_id = pid;
            
            delete from project_status_link@site1 where project_id = prj_id and status_id = p_s_id;
            delete from project_completed@site1 where project_id = prj_id;
            
        elsif p_s_id = 3 then
            select project_id, project_name, project_description, created_at, estimated_end_date into prj_id, p_name, p_description, p_created, p_estimated from project_started where project_id = pid;
            
            delete from project_status_link where project_id = prj_id and status_id = p_s_id;
            delete from project_started where project_id = prj_id;

        elsif p_s_id = 4 then
            select project_id, project_name, project_description, created_at, estimated_end_date into prj_id, p_name, p_description, p_created, p_estimated from project_archived@site1 where project_id = pid;
            
            delete from project_status_link@site1 where project_id = prj_id and status_id = p_s_id;
            delete from project_archived@site1 where project_id = prj_id;
        end IF;

        if sid = 1 then
            insert into project_status_link values(prj_id, sid);
            insert into project_running values(prj_id, p_name, p_description, p_created, p_estimated);
        elsif sid = 2 then
            insert into project_status_link@site1 values(prj_id, sid);
            insert into project_completed@site1 values(prj_id, p_name, p_description, p_created, p_estimated);
        elsif sid = 3 then
            insert into project_status_link values(prj_id, sid);
            insert into project_started values(prj_id, p_name, p_description, p_created, p_estimated);
        elsif sid = 4 then
            insert into project_status_link@site1 values(prj_id, sid);
            insert into project_archived@site1 values(prj_id, p_name, p_description, p_created, p_estimated);
        End IF;

        commit;

    EXCEPTION
    when invalid_project_id THEN
        DBMS_OUTPUT.PUT_LINE('Invalid project id given');
    when NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found. Please re run the file');
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('An error occurred. Please re run the file');

    END update_status;
    

END update_package;
/

--SELECT mypack.F1(20) FROM DUAL;
--EXEC mypack.P1(21);
-- DECLARE
-- 	d int;
-- BEGIN
--     -- d := update_package.update_p_description(1, 'asdasdasdasd');
--     -- update_package.update_estimated(1, '2021-3-1');
--     -- update_package.update_p_name(1, 'New Project Name');
--     update_package.update_status(1, 1);
-- END;
-- /


