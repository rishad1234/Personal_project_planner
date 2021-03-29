SET SERVEROUTPUT ON;


BEGIN
	DBMS_OUTPUT.PUT_LINE('1. Project List.');
    DBMS_OUTPUT.PUT_LINE('2. Project List with estimated end date desc.');
    DBMS_OUTPUT.PUT_LINE('3. Project List with estimated end date asc.');
    DBMS_OUTPUT.PUT_LINE('4. Project List with created at date desc.');
    DBMS_OUTPUT.PUT_LINE('5. Project List with created at date asc.');
    DBMS_OUTPUT.PUT_LINE('6. Project Type List with project count.');
    DBMS_OUTPUT.PUT_LINE('7. Project List with selected Project type.');
    DBMS_OUTPUT.PUT_LINE('8. Project List according to project status.');
    
    DBMS_OUTPUT.PUT_LINE('Important Informations: ');
    DBMS_OUTPUT.PUT_LINE(chr(10));
    DBMS_OUTPUT.PUT_LINE('Project Type with id');
    DBMS_OUTPUT.PUT_LINE(chr(10));
    for R in (select * from project_type) LOOP
        DBMS_OUTPUT.PUT_LINE(R.type_id || ' ' ||  R.type_name);
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE(chr(10));
    DBMS_OUTPUT.PUT_LINE('Project Status with id');
    DBMS_OUTPUT.PUT_LINE(chr(10));
    for R in (select * from project_status) LOOP
        DBMS_OUTPUT.PUT_LINE(R.status_id || ' ' || R.status_name);
    END LOOP;
End;
/

ACCEPT X NUMBER PROMPT "Enter your choice (1 - 8): "
ACCEPT Y NUMBER PROMPT "Enter Project type id: "
ACCEPT Z CHAR PROMPT "Enter Project status name: "
DECLARE

    choice int;
    pt_id int;
    p_status varchar2(30);

    Choice_out_of_bound EXCEPTION;
    
    temp int;
    check_pt_id int;
    check_s_name varchar2(30);
BEGIN
	-- DBMS_OUTPUT.PUT_LINE('1. Project List.');
    -- DBMS_OUTPUT.PUT_LINE('2. Project List with estimated end date desc.');
    -- DBMS_OUTPUT.PUT_LINE('3. Project List with estimated end date asc.');
    -- DBMS_OUTPUT.PUT_LINE('4. Project List with created at date desc.');
    -- DBMS_OUTPUT.PUT_LINE('5. Project List with created at date asc.');
    -- DBMS_OUTPUT.PUT_LINE('6. Project Type List with project count.');
    -- DBMS_OUTPUT.PUT_LINE('7. Project List with selected Project type.');
    -- DBMS_OUTPUT.PUT_LINE('8. Project List according to project status.');

    choice := &X;
    pt_id := &Y;
    p_status := '&Z';


    IF choice = 1 THEN
        DBMS_OUTPUT.PUT_LINE(chr(10));
        
        temp := read_package.get_all_project;
        
        DBMS_OUTPUT.PUT_LINE(chr(10));
    elsif choice = 2 THEN
        DBMS_OUTPUT.PUT_LINE(chr(10));
        
        read_package.get_all_project_est_desc;
        
        DBMS_OUTPUT.PUT_LINE(chr(10));
    elsif choice = 3 THEN
        DBMS_OUTPUT.PUT_LINE(chr(10));
        
        read_package.get_all_project_est_asc;
        
        DBMS_OUTPUT.PUT_LINE(chr(10));
    elsif choice = 4 THEN
        DBMS_OUTPUT.PUT_LINE(chr(10));
        
        read_package.get_all_project_created_desc;
        
        DBMS_OUTPUT.PUT_LINE(chr(10));
    elsif choice = 5 THEN
        DBMS_OUTPUT.PUT_LINE(chr(10));
        
        read_package.get_all_project_created_asc;
        
        DBMS_OUTPUT.PUT_LINE(chr(10));
    elsif choice = 6 THEN
        DBMS_OUTPUT.PUT_LINE(chr(10));
        
        read_package.get_pt_list_p_count;
        
        DBMS_OUTPUT.PUT_LINE(chr(10));
    elsif choice = 7 THEN
        DBMS_OUTPUT.PUT_LINE(chr(10));
        -- for R in (select * from project_type) LOOP
        --     DBMS_OUTPUT.PUT_LINE(R.type_id || ' ' ||  R.type_name);
        -- END LOOP;
        select type_id into check_pt_id from project_type where type_id = pt_id;
        IF check_pt_id = pt_id THEN
            read_package.get_sel_p_with_type(pt_id);
        END IF;
        
        DBMS_OUTPUT.PUT_LINE(chr(10));
    elsif choice = 8 THEN
        DBMS_OUTPUT.PUT_LINE(chr(10));

        select status_name into check_s_name from project_status where status_name = p_status;
        if check_s_name = p_status THEN
            read_package.get_p_with_p_status(p_status);
        END IF;
        
        DBMS_OUTPUT.PUT_LINE(chr(10));    
    ELSE
        RAISE Choice_out_of_bound;
    
    end IF;
EXCEPTION
    WHEN Choice_out_of_bound THEN
        DBMS_OUTPUT.PUT_LINE('Invalid choice!! Please re run the file');
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('Data not found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred. Please re run the file');
END;
/