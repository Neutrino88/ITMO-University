SET SERVEROUTPUT ON

/* USERS  */
DECLARE
    id number;
BEGIN
    id:=USERS_CRUD.CREATE_USER('1@1.ru', '1234', '89819708021', 'yana');
    id:=USERS_CRUD.CREATE_USER('2@2.ru', '1234', '89123458343', 'oleg');
END;
/

/* PROJECTS */
DECLARE
    id number;
BEGIN
    id:=PROJECTS_CRUD.CREATE_PROJECT('project_1', 'description_1', to_date('1998/05/31:12:00:00AM', 'yyyy/mm/dd:hh:mi:ssam'), 1);
    id:=PROJECTS_CRUD.CREATE_PROJECT('project_2', 'description_2', to_date('1998/05/31:12:00:00AM', 'yyyy/mm/dd:hh:mi:ssam'), 2);
END;
/

/* SPRINTS */

DECLARE
    id number;
BEGIN
    id := SPRINTS_CRUD.CREATE_SPRINT(to_date('23.12.2017', 'dd.mm.yyyy'), to_date('09.12.2017', 'dd.mm.yyyy'), 1);
    id := SPRINTS_CRUD.CREATE_SPRINT(to_date('09.12.2017', 'dd.mm.yyyy'), to_date('02.12.2017', 'dd.mm.yyyy'), 2);
END;
/

SELECT * FROM PROJECTS;
SELECT * FROM SPRINTS;
SELECT * FROM MAIN_REPORT;

/* DELETE */
DECLARE
BEGIN
    SPRINTS_CRUD.DELETE_SPRINT(1);
    SPRINTS_CRUD.DELETE_SPRINT(2);
END;
/

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