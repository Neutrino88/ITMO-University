SET SERVEROUTPUT ON

/* USERS  */
DECLARE
    id number;
BEGIN
    id:=USERS_CRUD.CREATE_USER('1@1.ru', '1234', '89999999999', 'lala');
    id:=USERS_CRUD.CREATE_USER('2@2.ru', '1234', '89999999999', 'kaka');
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
    id:=SPRINTS_CRUD.CREATE_SPRINT(to_date('23.12.2017', 'dd.mm.yyyy'), to_date('09.12.2017', 'dd.mm.yyyy'), 1);
    dbms_output.put_line(id);
    id:=SPRINTS_CRUD.CREATE_SPRINT(to_date('09.12.2017', 'dd.mm.yyyy'), to_date('02.12.2017', 'dd.mm.yyyy'), 1);
    dbms_output.put_line(id);
END;
/

DECLARE
    res SPRINTS%ROWTYPE;
BEGIN
    res:= SPRINTS_CRUD.READ_SPRINT('1');
    dbms_output.put_line(res.time_start);
    res:= SPRINTS_CRUD.READ_SPRINT('2');
    dbms_output.put_line(res.time_start);
END;
/

DECLARE
BEGIN
    SPRINTS_CRUD.UPDATE_SPRINT(1, to_date('23.12.2017', 'dd.mm.yyyy'), to_date('09.12.2017', 'dd.mm.yyyy'));
    SPRINTS_CRUD.UPDATE_SPRINT(2, to_date('23.12.2017', 'dd.mm.yyyy'), to_date('09.12.2017', 'dd.mm.yyyy'));
END;
/

DECLARE
BEGIN
    SPRINTS_CRUD.DELETE_SPRINT(1);
    SPRINTS_CRUD.DELETE_SPRINT(2);
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