SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE delete_package AS

	FUNCTION delete_project(pid IN NUMBER)
	RETURN NUMBER;
END delete_package;
/

CREATE OR REPLACE PACKAGE BODY delete_package AS

	FUNCTION delete_project(pid IN NUMBER)
	RETURN NUMBER
	IS 
        p_s_id int;
        flag int := 0;

        Not_valid_project_id EXCEPTION;
	BEGIN
        for R in (select * from p_status_link_view) loop
            IF pid = R.project_id then
                p_s_id := R.status_id;
                flag := 1;
            end if;
        end loop;

        IF flag = 0 then
            RAISE Not_valid_project_id;
        END if;

        if p_s_id = 1 then
            delete from project_status_link where project_id = pid and status_id = p_s_id;
            delete from project_running where project_id = pid;
        elsif p_s_id = 2 then
            delete from project_status_link@site1 where project_id = pid and status_id = p_s_id;
            delete from project_completed@site1 where project_id = pid;
        elsif p_s_id = 3 then
            delete from project_status_link where project_id = pid and status_id = p_s_id;
            delete from project_started where project_id = pid;
        elsif p_s_id = 4 then
            delete from project_status_link@site1 where project_id = pid and status_id = p_s_id;
            delete from project_archived@site1 where project_id = pid;
        END IF; 
        DBMS_OUTPUT.PUT_LINE('Data deleted.');
        commit;
        return 1;
    EXCEPTION
    when Not_valid_project_id then
        DBMS_OUTPUT.PUT_LINE('Project id is not valid. Please re run the file.');
    when NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found. Please re run the file');

	END delete_project;
	
END delete_package;
/

-- DECLARE
-- 	D number;
-- BEGIN
-- 	D := delete_package.delete_project(2);
-- END;
-- /