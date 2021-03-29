SET SERVEROUTPUT ON;


BEGIN
	DBMS_OUTPUT.PUT_LINE('1. Update project description.');
    DBMS_OUTPUT.PUT_LINE('2. Update estimated_end_date in Project.');
    DBMS_OUTPUT.PUT_LINE('3. Update project name.');
    DBMS_OUTPUT.PUT_LINE('4. Update project status.');

    DBMS_OUTPUT.PUT_LINE(chr(10));
    DBMS_OUTPUT.PUT_LINE('All Project List: ');
    For R in (select * from all_projects) LOOP
        DBMS_OUTPUT.PUT_LINE(R.project_id || ' ' || R.project_name || ' ' || R.project_description || ' ' || R.estimated_end_date);
    END loop;

    DBMS_OUTPUT.PUT_LINE(chr(10));
    DBMS_OUTPUT.PUT_LINE('Project status list: ');
    For R in (select * from project_status) LOOP
        DBMS_OUTPUT.PUT_LINE(R.status_id || ' ' || R.status_name);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(chr(10));
End;
/

ACCEPT V NUMBER PROMPT "Enter your choice (1 - 4): "
ACCEPT W NUMBER PROMPT "Enter Project id: "
ACCEPT X NUMBER PROMPT "Enter Project Status id: "
ACCEPT Y CHAR PROMPT "Enter Project Name: "
ACCEPT U CHAR PROMPT "Enter Project Description: "
ACCEPT Z CHAR PROMPT "Enter estimated_end_time(YYYY-MM-DD): "

DECLARE
    choice int;
    p_id int;
    s_id int;
    P_name varchar(30);
    p_estimate varchar(30);
    p_description varchar2(30);

    temp int;

BEGIN
    choice := &V;
    p_id := &W;
    s_id := &X;
    P_name := '&Y';
    p_description := '&U';
    p_estimate := '&Z';

    if choice = 1 then
        temp := update_package.update_p_description(p_id, p_description);
    elsif choice = 2 then
        update_package.update_estimated(p_id, p_estimate);
    elsif choice = 3 then
        update_package.update_p_name(p_id, p_name);
    elsif choice = 4 then
        update_package.update_status(p_id, s_id);
    END IF;

EXCEPTION
when NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No data found. Please re run the file');
when OTHERS then
    DBMS_OUTPUT.PUT_LINE('An error occurred. Please re run the file');
END;
/