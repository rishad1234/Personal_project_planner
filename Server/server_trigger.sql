SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER p_running_t 
AFTER INSERT OR UPDATE
ON project_running
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('A project is inserted in project_running table in the server.');
END;
/

CREATE OR REPLACE TRIGGER p_running_s 
AFTER INSERT OR UPDATE
ON project_started
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('A project is inserted in project_started table in the server.');
END;
/

CREATE OR REPLACE TRIGGER p_t_trigger 
AFTER INSERT 
ON project_type
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('A new project type is added to the project_type table.');
END;
/

CREATE OR REPLACE TRIGGER p_running_t_d 
AFTER DELETE 
ON project_running
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('A Project has been deleted from the project_running table.');
END;
/

CREATE OR REPLACE TRIGGER p_running_s_d 
AFTER DELETE 
ON project_started
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('A Project has been deleted from the project_started table.');
END;
/

CREATE OR REPLACE TRIGGER p_t_link 
AFTER INSERT or DELETE 
ON project_type_link
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Project_type_link table has been modified.');
END;
/

CREATE OR REPLACE TRIGGER p_s_link 
AFTER INSERT or DELETE 
ON project_status_link
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Project_status_link table has been modified.');
END;
/