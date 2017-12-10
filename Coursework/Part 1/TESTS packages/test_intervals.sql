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
    id:=SPRINTS_CRUD.CREATE_SPRINT(to_date('09.12.2017', 'dd.mm.yyyy'), to_date('02.12.2017', 'dd.mm.yyyy'), 1);
END;
/

/* TASKS */
DECLARE
    id number;
BEGIN
    id:=TASKS_CRUD.CREATE_TASK('first task', 'unknown', '1', '1');
    id:=TASKS_CRUD.CREATE_TASK('second task', 'unknown', '2', '2');
END;
/

/* INTERVALS */
DECLARE
    interval INTERVALS.INTERVAL%TYPE;
BEGIN
    interval := interval_t(to_date('1998/05/31', 'yyyy/mm/dd'),to_date('1998/05/31', 'yyyy/mm/dd'));
    dbms_output.put_line(INTERVALS_CRUD.CREATE_INTERVAL(interval, 1, 1));
    
    interval := interval_t(to_date('1998/05/31', 'yyyy/mm/dd'),to_date('1998/05/31', 'yyyy/mm/dd'));
    dbms_output.put_line(INTERVALS_CRUD.CREATE_INTERVAL(interval, 2, 2));
END;
/
DECLARE
    res INTERVALS%ROWTYPE;
BEGIN
    res:= INTERVALS_CRUD.READ_INTERVAL('1');
    dbms_output.put_line(res.task_id);
    res:= INTERVALS_CRUD.READ_INTERVAL('2');
    dbms_output.put_line(res.task_id);
END;
/
DECLARE
    res INTERVALS%ROWTYPE;
        interval INTERVALS.INTERVAL%TYPE;
BEGIN
    interval := interval_t(to_date('2000/05/31', 'yyyy/mm/dd'),to_date('2999/05/31', 'yyyy/mm/dd'));

    INTERVALS_CRUD.UPDATE_INTERVAL(1, interval);
    INTERVALS_CRUD.UPDATE_INTERVAL(2, interval);
END;
/

DECLARE
BEGIN
    INTERVALS_CRUD.DELETE_INTERVAL(1);
    INTERVALS_CRUD.DELETE_INTERVAL(2);
END;
/

/* DELETE */
DECLARE
BEGIN
    TASKS_CRUD.DELETE_TASK(1);
    TASKS_CRUD.DELETE_TASK(2);
END;

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