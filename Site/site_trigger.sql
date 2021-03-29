SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER p_completed_t 
AFTER INSERT 
ON project_completed
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('A project is inserted in project_completed table in the server.');
END;
/

CREATE OR REPLACE TRIGGER p_running_a 
AFTER INSERT 
ON project_archived
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('A project is inserted in project_archived table in the server.');
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
ON project_completed
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('A Project has been deleted from the project_completed table.');
END;
/

CREATE OR REPLACE TRIGGER p_running_s_d 
AFTER DELETE 
ON project_archived
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('A Project has been deleted from the project_archived table.');
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