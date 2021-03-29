SET SERVEROUTPUT ON;


BEGIN
    DBMS_OUTPUT.PUT_LINE('Delete Project!! (Caution)');
    DBMS_OUTPUT.PUT_LINE(chr(10));

    DBMS_OUTPUT.PUT_LINE('Important Informations: ');
    DBMS_OUTPUT.PUT_LINE(chr(10));
    DBMS_OUTPUT.PUT_LINE('Project names with id: ');
    for R in (select * from all_projects) loop
        DBMS_OUTPUT.PUT_LINE(R.project_id || ' ' || R.project_name);
    END loop;
    DBMS_OUTPUT.PUT_LINE(chr(10));
END;
/


ACCEPT X NUMBER PROMPT "Enter the project Id to delete: "
DECLARE
    p_id int;

    temp int;
BEGIN
    p_id := &X;
    DBMS_OUTPUT.PUT_LINE(p_id);
    temp := delete_package.delete_project(p_id);
    
EXCEPTION
    when NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found. Please re run the file');
    when OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred. Please re run the file');
END;
/

