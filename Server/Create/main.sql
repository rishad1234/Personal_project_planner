SET SERVEROUTPUT ON;


BEGIN
    DBMS_OUTPUT.PUT_LINE('1. Create Project Type: ');
    DBMS_OUTPUT.PUT_LINE('2. Create Project: ');

    DBMS_OUTPUT.PUT_LINE(chr(10));
    DBMS_OUTPUT.PUT_LINE('All project types: ');
    for R in (select * from project_type) LOOP
        DBMS_OUTPUT.PUT_LINE(R.type_id || ' ' || R.type_name);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(chr(10));

    DBMS_OUTPUT.PUT_LINE('All project status: ');
    for R in (select * from project_status) LOOP
        DBMS_OUTPUT.PUT_LINE(R.status_id || ' ' || R.status_name);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(chr(10));
END;
/

ACCEPT S CHAR PROMPT "Enter choice: "
ACCEPT U CHAR PROMPT "Enter Type Name: "
ACCEPT V CHAR PROMPT "Enter Type Description: "
ACCEPT W CHAR PROMPT "Enter Project Name: "
ACCEPT X CHAR PROMPT "Enter Project Description: "
ACCEPT Y CHAR PROMPT "Enter Estimated End Date(YYYY-MM-DD): "
ACCEPT Z NUMBER PROMPT "Enter project type id: "
ACCEPT T NUMBER PROMPT "Enter project status id: "
DECLARE
    choice int;
    t_name varchar2(30);
    t_description varchar2(100);
    p_name varchar2(30);
    p_description varchar2(30);
    p_estimate varchar2(30);
    Pt_id int;
    ps_id int;
BEGIN

    choice := '&S';
    t_name := '&U';
    t_description := '&V';
    p_name := '&W';
    p_description := '&X';
    p_estimate := '&Y';
    pt_id := &Z;
    ps_id := &T;

    if choice = 1 THEN
        create_package.create_p_type(t_name, t_description);
    elsif choice = 2 THEN
        create_package.create_project(p_name, p_description, p_estimate, pt_id, ps_id);
    END IF;
END;
/