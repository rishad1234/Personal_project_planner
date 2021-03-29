SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE search_package AS
    PROCEDURE search_with_name(p_name varchar2);
    PROCEDURE search_with_description(p_description varchar2);
    PROCEDURE search_with_type_name(p_type varchar2);
    PROCEDURE search_with_created(p_created varchar2);
    PROCEDURE search_with_estimated(p_estimated varchar2);
END search_package;
/

CREATE OR REPLACE PACKAGE BODY search_package AS

	PROCEDURE search_with_name(p_name varchar2)
	IS
        i int := 0;
        no_rows_exp EXCEPTION;
	BEGIN
        For R in (select * from all_projects where project_name like p_name) LOOP
            DBMS_OUTPUT.PUT_LINE(R.project_id || ' ' || R.project_name || ' ' || R.project_description || ' ' || R.created_at || ' ' || R.estimated_end_date || ' ' || R.type_name);
             i := i + 1;   
        END LOOP;

        IF i = 0 THEN
            RAISE no_rows_exp;
        END IF;

    EXCEPTION
    WHEN no_rows_exp THEN
        DBMS_OUTPUT.PUT_LINE('No rows found');
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Data not found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred. Please re run the file');
	END search_with_name;

	PROCEDURE search_with_description(p_description varchar2)
	IS
        i int := 0;
        no_rows_exp EXCEPTION;
	BEGIN
        For R in (select * from all_projects where project_description like p_description) LOOP
            DBMS_OUTPUT.PUT_LINE(R.project_id || ' ' || R.project_name || ' ' || R.project_description || ' ' || R.created_at || ' ' || R.estimated_end_date || ' ' || R.type_name);
            i := i + 1; 
        END LOOP;

        IF i = 0 THEN
            RAISE no_rows_exp;
        END IF;

    EXCEPTION
    WHEN no_rows_exp THEN
        DBMS_OUTPUT.PUT_LINE('No rows found');
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Data not found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred. Please re run the file');
	END search_with_description;

	PROCEDURE search_with_type_name(p_type varchar2)
	IS
        i int := 0;
        no_rows_exp EXCEPTION;	
	BEGIN
        For R in (select * from all_projects where type_name like p_type) LOOP
            DBMS_OUTPUT.PUT_LINE(R.project_id || ' ' || R.project_name || ' ' || R.project_description || ' ' || R.created_at || ' ' || R.estimated_end_date || ' ' || R.type_name);
            i := i + 1; 
        END LOOP;

        IF i = 0 THEN
            RAISE no_rows_exp;
        END IF;

    EXCEPTION
    WHEN no_rows_exp THEN
        DBMS_OUTPUT.PUT_LINE('No rows found');
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Data not found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred. Please re run the file');
	END search_with_type_name;

	PROCEDURE search_with_created(p_created varchar2)
	IS
        i int := 0;
        no_rows_exp EXCEPTION;
	BEGIN
        For R in (select * from all_projects where created_at like p_created) LOOP
            DBMS_OUTPUT.PUT_LINE(R.project_id || ' ' || R.project_name || ' ' || R.project_description || ' ' || R.created_at || ' ' || R.estimated_end_date || ' ' || R.type_name);
            i := i + 1; 
        END LOOP;

        IF i = 0 THEN
            RAISE no_rows_exp;
        END IF;

    EXCEPTION
    WHEN no_rows_exp THEN
        DBMS_OUTPUT.PUT_LINE('No rows found');
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Data not found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred. Please re run the file');
	END search_with_created;

	PROCEDURE search_with_estimated(p_estimated varchar2)
	IS
        i int := 0;
        no_rows_exp EXCEPTION;
	BEGIN
        For R in (select * from all_projects where estimated_end_date like p_estimated) LOOP
            DBMS_OUTPUT.PUT_LINE(R.project_id || ' ' || R.project_name || ' ' || R.project_description || ' ' || R.created_at || ' ' || R.estimated_end_date || ' ' || R.type_name);
            i := i + 1; 
        END LOOP;

        IF i = 0 THEN
            RAISE no_rows_exp;
        END IF;

    EXCEPTION
    WHEN no_rows_exp THEN
        DBMS_OUTPUT.PUT_LINE('No rows found');
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Data not found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred. Please re run the file');
	END search_with_estimated;

END search_package;
/

-- DECLARE
-- 	D number;
-- BEGIN
-- 	DBMS_OUTPUT.PUT_LINE('just for check');
--     -- search_package.search_with_name('%P%');
--     -- search_package.search_with_description('%l%');
--     -- search_package.search_with_type_name('%A%');
--     -- search_package.search_with_created('%20%');
--     -- search_package.search_with_estimated('%J%');
-- END;
-- /


