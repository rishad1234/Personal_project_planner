SET SERVEROUTPUT ON;
SET VERIFY OFF;

BEGIN
    DBMS_OUTPUT.PUT_LINE('For optimal result, must use % sign before and after the search term like "%term%"');
	DBMS_OUTPUT.PUT_LINE('1. Search Projects with project name.');
    DBMS_OUTPUT.PUT_LINE('2. Search projects with project decription.');
    DBMS_OUTPUT.PUT_LINE('3. Search projects with project type name.');
    DBMS_OUTPUT.PUT_LINE('4. Search projects with created time.');
    DBMS_OUTPUT.PUT_LINE('5. Search project with project estimated end time.');
End;
/

ACCEPT U NUMBER PROMPT "Enter your choice (1 - 5): "
ACCEPT V CHAR PROMPT "Enter Project name: "
ACCEPT W CHAR PROMPT "Enter Project description: "
ACCEPT X CHAR PROMPT "Enter project type name: "
ACCEPT Y CHAR PROMPT "Enter created at: "
ACCEPT Z CHAR PROMPT "Enter estimated end time: "
DECLARE

    choice int;
    p_name varchar2(30);
    p_description varchar2(30);
    p_type varchar2(30);
    p_created varchar2(30);
    p_estimated varchar2(30);

    Choice_out_of_bound EXCEPTION;
BEGIN

    choice := &U;
    p_name := '&V';
    p_description := '&W';
    p_type := '&X';
    p_created := '&Y';
    p_estimated := '&Z';



    IF choice = 1 THEN
        DBMS_OUTPUT.PUT_LINE(chr(10));
        
        search_package.search_with_name(p_name);
        
        DBMS_OUTPUT.PUT_LINE(chr(10));
    elsif choice = 2 THEN
        DBMS_OUTPUT.PUT_LINE(chr(10));
        
        search_package.search_with_description(p_description);
        
        DBMS_OUTPUT.PUT_LINE(chr(10));
    elsif choice = 3 THEN
        DBMS_OUTPUT.PUT_LINE(chr(10));
        
        search_package.search_with_type_name(p_type);
        
        DBMS_OUTPUT.PUT_LINE(chr(10));
    elsif choice = 4 THEN
        DBMS_OUTPUT.PUT_LINE(chr(10));
        
        search_package.search_with_created(p_created);
        
        DBMS_OUTPUT.PUT_LINE(chr(10));
    elsif choice = 5 THEN
        DBMS_OUTPUT.PUT_LINE(chr(10));
        
        search_package.search_with_estimated(p_estimated);
        
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