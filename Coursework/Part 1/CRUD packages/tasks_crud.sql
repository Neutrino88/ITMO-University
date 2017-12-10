CREATE OR REPLACE PACKAGE TASKS_CRUD AS
    FUNCTION CREATE_TASK(name_v IN TASKS.NAME%TYPE, 
                        status_v IN TASKS.STATUS%TYPE,
                        sprint_id_v IN TASKS.SPRINT_ID%TYPE, 
                        user_id_v IN TASKS.USER_ID%TYPE) RETURN NUMBER; 
                        
    FUNCTION READ_TASK(id_v IN TASKS.ID%TYPE) RETURN TASKS%ROWTYPE;
    
    PROCEDURE UPDATE_TASK(id_v IN TASKS.ID%TYPE, 
                        name_v IN TASKS.NAME%TYPE, 
                        status_v IN TASKS.STATUS%TYPE);
                        
    PROCEDURE DELETE_TASK(id_v IN TASKS.ID%TYPE);
END TASKS_CRUD;
/

CREATE OR REPLACE PACKAGE BODY TASKS_CRUD AS
    FUNCTION CREATE_TASK(name_v IN TASKS.NAME%TYPE, status_v IN TASKS.STATUS%TYPE, sprint_id_v IN TASKS.SPRINT_ID%TYPE, user_id_v IN TASKS.USER_ID%TYPE) RETURN NUMBER
    AS
        task_id NUMBER := 0;
    BEGIN
        INSERT INTO TASKS (NAME, SPRINT_ID, USER_ID, STATUS) values (name_v, sprint_id_v, user_id_v, status_v);
        SELECT TASKS_ID_SEQ.CURRVAL INTO task_id FROM DUAL;
        RETURN task_id;
    END CREATE_TASK;
    
    FUNCTION READ_TASK(id_v IN TASKS.ID%TYPE) RETURN TASKS%ROWTYPE
    AS
        task TASKS%ROWTYPE;
    BEGIN   
        SELECT * INTO task FROM TASKS WHERE ID = id_v;
        return task;
    END READ_TASK;
    
    PROCEDURE UPDATE_TASK(id_v IN TASKS.ID%TYPE, name_v IN TASKS.NAME%TYPE, status_v IN TASKS.STATUS%TYPE) AS
    BEGIN
        UPDATE TASKS
            SET NAME = name_v,
                STATUS = status_v
            WHERE ID = id_v;
    END UPDATE_TASK;
    
    PROCEDURE DELETE_TASK(id_v IN TASKS.ID%TYPE)
    AS
    BEGIN
        DELETE FROM TASKS WHERE ID = id_v;
    END DELETE_TASK;
END TASKS_CRUD;
/

