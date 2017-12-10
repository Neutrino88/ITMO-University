SET SERVEROUTPUT ON

/* USERS */
DECLARE
    id number;
BEGIN
    id:=USERS_CRUD.CREATE_USER('1@1.ru', '1234', '89819708021', 'yana');
    id:=USERS_CRUD.CREATE_USER('2@2.ru', '1234', '89123458343', 'oleg');
END;
/

/* PROJECTS */
SELECT * FROM users;

DECLARE
    res PROJECTS%ROWTYPE;
    id number;
BEGIN
    id:=PROJECTS_CRUD.CREATE_PROJECT('project_1', 'description_1', to_date('1998/05/31:12:00:00AM', 'yyyy/mm/dd:hh:mi:ssam'), 1);
    dbms_output.put_line(id);
    id:=PROJECTS_CRUD.CREATE_PROJECT('project_2', 'description_2', to_date('1998/05/31:12:00:00AM', 'yyyy/mm/dd:hh:mi:ssam'), 2);
    dbms_output.put_line(id);
END;
/

DECLARE
    res PROJECTS%ROWTYPE;
BEGIN
    res:= PROJECTS_CRUD.READ_PROJECT(1);
    dbms_output.put_line(res.creating_date);
    res:= PROJECTS_CRUD.READ_PROJECT(2);
    dbms_output.put_line(res.creating_date);
END;
/

DECLARE
BEGIN
    PROJECTS_CRUD.UPDATE_PROJECT(1, 'project_3', 'description_3', to_date('1998/05/31:12:00:00AM', 'yyyy/mm/dd:hh:mi:ssam'));
    PROJECTS_CRUD.UPDATE_PROJECT(2, 'project_4', 'description_4', to_date('1998/05/31:12:00:00AM', 'yyyy/mm/dd:hh:mi:ssam'));
END;
/

/* DELETE */
DECLARE
BEGIN
    PROJECTS_CRUD.DELETE_PROJECT(1);
    PROJECTS_CRUD.DELETE_PROJECT(2);
END;
/

DECLARE
BEGIN
    USERS_CRUD.DELETE_USER(1);
    USERS_CRUD.DELETE_USER(2);
END;
/
