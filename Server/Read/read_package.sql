SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE read_package AS

    FUNCTION get_all_project
    RETURN NUMBER;

    PROCEDURE get_all_project_est_desc;

    PROCEDURE get_all_project_est_asc;

    PROCEDURE get_all_project_created_desc;

    PROCEDURE get_all_project_created_asc;

    PROCEDURE get_pt_list_p_count;

    PROCEDURE get_sel_p_with_type(project_type_id in int);

    procedure get_p_with_p_status(project_status_name in varchar2);

END read_package;
/

CREATE OR REPLACE PACKAGE BODY read_package AS


	FUNCTION get_all_project
	RETURN NUMBER
	IS 
        pid int;
        p_name varchar2(30);
        p_description varchar2(30);
        p_created date;
        p_estimated date;
	BEGIN
        DBMS_OUTPUT.PUT_LINE('All project list: ' || chr(10));
        FOR R in (select * from all_projects) LOOP
            pid := R.project_id;
            p_name := R.project_name;
            p_description := R.project_description;
            p_created := R.created_at;
            p_estimated := R.estimated_end_date;

            DBMS_OUTPUT.PUT_LINE('Project Id : ' || pid);
            DBMS_OUTPUT.PUT_LINE('Project Name: ' || p_name);
            DBMS_OUTPUT.PUT_LINE('Project Description: ' || p_description);
            DBMS_OUTPUT.PUT_LINE('Created At: ' || p_created);
            DBMS_OUTPUT.PUT_LINE('Estimated End Time: ' || p_estimated || chr(10));

        END LOOP;
        return 1;
	END get_all_project;
	


	PROCEDURE get_all_project_est_desc
	IS
        p_name varchar2(30);
        p_description varchar2(30);
        p_created date;
        p_estimated date;
	BEGIN
        DBMS_OUTPUT.PUT_LINE('All project list with estimated end time descending order: ' || chr(10));
        FOR R in (select * from all_project_with_est_desc) LOOP
            p_name := R.project_name;
            p_description := R.project_description;
            p_created := R.created_at;
            p_estimated := R.estimated_end_date;

            DBMS_OUTPUT.PUT_LINE('Project Name: ' || p_name);
            DBMS_OUTPUT.PUT_LINE('Project Description: ' || p_description);
            DBMS_OUTPUT.PUT_LINE('Created At: ' || p_created);
            DBMS_OUTPUT.PUT_LINE('Estimated End Time: ' || p_estimated || chr(10));

        END LOOP;
	END get_all_project_est_desc;



    PROCEDURE get_all_project_est_asc
    IS
        p_name varchar2(30);
        p_description varchar2(30);
        p_created date;
        p_estimated date;
	BEGIN
        DBMS_OUTPUT.PUT_LINE('All project list with estimated end time ascending order: ' || chr(10));
        FOR R in (select * from all_project_with_est_asc) LOOP
            p_name := R.project_name;
            p_description := R.project_description;
            p_created := R.created_at;
            p_estimated := R.estimated_end_date;

            DBMS_OUTPUT.PUT_LINE('Project Name: ' || p_name);
            DBMS_OUTPUT.PUT_LINE('Project Description: ' || p_description);
            DBMS_OUTPUT.PUT_LINE('Created At: ' || p_created);
            DBMS_OUTPUT.PUT_LINE('Estimated End Time: ' || p_estimated || chr(10));

        END LOOP;
	END get_all_project_est_asc;



    PROCEDURE get_all_project_created_desc
    IS
        p_name varchar2(30);
        p_description varchar2(30);
        p_created date;
        p_estimated date;
	BEGIN
        DBMS_OUTPUT.PUT_LINE('All project list with created time descending order: ' || chr(10));
        FOR R in (select * from all_project_with_created_desc) LOOP
            p_name := R.project_name;
            p_description := R.project_description;
            p_created := R.created_at;
            p_estimated := R.estimated_end_date;

            DBMS_OUTPUT.PUT_LINE('Project Name: ' || p_name);
            DBMS_OUTPUT.PUT_LINE('Project Description: ' || p_description);
            DBMS_OUTPUT.PUT_LINE('Created At: ' || p_created);
            DBMS_OUTPUT.PUT_LINE('Estimated End Time: ' || p_estimated || chr(10));

        END LOOP;
	END get_all_project_created_desc;



    PROCEDURE get_all_project_created_asc
    IS
        p_name varchar2(30);
        p_description varchar2(30);
        p_created date;
        p_estimated date;
	BEGIN
        DBMS_OUTPUT.PUT_LINE('All project list with created time ascending order: ' || chr(10));
        FOR R in (select * from all_project_with_created_asc) LOOP
            p_name := R.project_name;
            p_description := R.project_description;
            p_created := R.created_at;
            p_estimated := R.estimated_end_date;

            DBMS_OUTPUT.PUT_LINE('Project Name: ' || p_name);
            DBMS_OUTPUT.PUT_LINE('Project Description: ' || p_description);
            DBMS_OUTPUT.PUT_LINE('Created At: ' || p_created);
            DBMS_OUTPUT.PUT_LINE('Estimated End Time: ' || p_estimated || chr(10));

        END LOOP;
	END get_all_project_created_asc;


    PROCEDURE get_pt_list_p_count
    IS
        p_type_id int;
        p_type_name varchar2(30);
        p_description varchar2(100);
        p_count NUMBER;
	BEGIN
        DBMS_OUTPUT.PUT_LINE('All project Type with project count: ' || chr(10));
        FOR R in (select * from all_project_type_with_count) LOOP
            p_type_id := R.type_id;
            p_type_name := R.type_name;
            p_description := R.description;
            p_count := R.project_count;

            DBMS_OUTPUT.PUT_LINE('Project type id: ' || p_type_id);
            DBMS_OUTPUT.PUT_LINE('Project type name: ' || p_type_name);
            DBMS_OUTPUT.PUT_LINE('Project type description: ' || p_description);
            DBMS_OUTPUT.PUT_LINE('Project count: ' || p_count || chr(10));

        END LOOP;
	END get_pt_list_p_count;


    --should show the project type table first so that user can input the project type id
    --must use project type id as parameter in the procedure
    PROCEDURE get_sel_p_with_type(project_type_id in int)
    IS
        pid int;
        p_name varchar2(30);
        p_description varchar2(30);
        p_created date;
        p_estimated date;
        p_type_id int;
        p_type_name varchar2(30);
    BEGIN
        DBMS_OUTPUT.PUT_LINE('All project list with type id: '  || project_type_id || chr(10));
        FOR R in (select * from all_projects) LOOP
            pid := R.project_id;
            p_name := R.project_name;
            p_description := R.project_description;
            p_created := R.created_at;
            p_estimated := R.estimated_end_date;
            p_type_id := R.type_id;
            p_type_name := R.type_name;

            IF p_type_id = project_type_id THEN
                DBMS_OUTPUT.PUT_LINE('Project Type Name: ' || p_type_name);
                DBMS_OUTPUT.PUT_LINE('Project Id : ' || pid);
                DBMS_OUTPUT.PUT_LINE('Project Name: ' || p_name);
                DBMS_OUTPUT.PUT_LINE('Project Description: ' || p_description);
                DBMS_OUTPUT.PUT_LINE('Created At: ' || p_created);
                DBMS_OUTPUT.PUT_LINE('Estimated End Time: ' || p_estimated || chr(10));
            END IF;

        END LOOP;
    End get_sel_p_with_type;

    --should promt the user about the project status table and take input from the user
    -- the project status name
    -- status name was used here for code variation
    procedure get_p_with_p_status(project_status_name in varchar2)
    IS
        pid int;
        p_name varchar2(30);
        p_description varchar2(30);
        p_created date;
        p_estimated date;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Project status: ' || project_status_name || chr(10));
        FOR R in (select * from all_project_with_status where status_name = project_status_name) LOOP
            pid := R.project_id;
            p_name := R.project_name;
            p_description := R.project_description;
            p_created := R.created_at;
            p_estimated := R.estimated_end_date;

            DBMS_OUTPUT.PUT_LINE('Project Id : ' || pid);
            DBMS_OUTPUT.PUT_LINE('Project Name: ' || p_name);
            DBMS_OUTPUT.PUT_LINE('Project Description: ' || p_description);
            DBMS_OUTPUT.PUT_LINE('Created At: ' || p_created);
            DBMS_OUTPUT.PUT_LINE('Estimated End Time: ' || p_estimated || chr(10));
        END LOOP;
    END get_p_with_p_status;
	
END read_package;
/

-- DECLARE
-- 	D number;
-- BEGIN
-- 	-- D := read_package.get_all_project;
--     -- read_package.get_all_project_est_desc;
--     -- read_package.get_all_project_est_asc;
--     -- read_package.get_all_project_created_desc;
--     -- read_package.get_all_project_created_asc;
--     -- read_package.get_pt_list_p_count;
--     -- read_package.get_sel_p_with_type(1);
--     -- read_package.get_p_with_p_status('Archived');
-- END;
-- /


