CREATE OR REPLACE

PACKAGE SPRINTS_CRUD AS
    FUNCTION CREATE_SPRINT(time_end_v IN SPRINTS.TIME_END%TYPE, 
                        time_start_v IN SPRINTS.TIME_START%TYPE, 
                        project_id_v IN SPRINTS.PROJECT_ID%TYPE) RETURN NUMBER; 
                        
    FUNCTION READ_SPRINT(id_v IN SPRINTS.ID%TYPE) RETURN SPRINTS%ROWTYPE;
    
    PROCEDURE UPDATE_SPRINT(id_v IN SPRINTS.ID%TYPE, 
                        time_start_v IN SPRINTS.TIME_START%TYPE, 
                        time_end_v IN SPRINTS.TIME_END%TYPE);
                        
    PROCEDURE DELETE_SPRINT(id_v IN SPRINTS.ID%TYPE);
END SPRINTS_CRUD;
/

CREATE OR REPLACE PACKAGE BODY SPRINTS_CRUD AS
    FUNCTION CREATE_SPRINT(time_end_v IN SPRINTS.TIME_END%TYPE, time_start_v IN SPRINTS.TIME_START%TYPE, project_id_v IN SPRINTS.PROJECT_ID%TYPE) RETURN NUMBER
    AS
        sprint_id NUMBER := 0;
    BEGIN
        INSERT INTO SPRINTS (TIME_START, TIME_END, PROJECT_ID) values (time_start_v, time_end_v, project_id_v);
        SELECT SPRINTS_ID_SEQ.CURRVAL INTO sprint_id FROM DUAL;
        RETURN sprint_id;
    END CREATE_SPRINT;
    
    FUNCTION READ_SPRINT(id_v IN SPRINTS.ID%TYPE) RETURN SPRINTS%ROWTYPE
    AS
        sprint SPRINTS%ROWTYPE;
    BEGIN   
        SELECT * INTO sprint FROM SPRINTS WHERE ID = id_v;
        return sprint;
    END READ_SPRINT;
    
    PROCEDURE UPDATE_SPRINT(id_v IN SPRINTS.ID%TYPE, time_start_v IN SPRINTS.TIME_START%TYPE, time_end_v IN SPRINTS.TIME_END%TYPE) AS
    BEGIN
        UPDATE SPRINTS
            SET TIME_START = time_start_v,
                TIME_END = time_end_v
            WHERE ID = id_v;
    END UPDATE_SPRINT;
    
    PROCEDURE DELETE_SPRINT(id_v IN SPRINTS.ID%TYPE)
    AS
    BEGIN
        DELETE FROM SPRINTS WHERE ID = id_v;
    END DELETE_SPRINT;
END SPRINTS_CRUD;
/

 /* VIEW */
CREATE OR REPLACE VIEW MAIN_SPRINTS_REPORT AS 
    SELECT s.project_id AS PROJECT_ID, s.id AS SPRINT_ID, 'Finished' AS STATUS
    FROM Sprints s
    WHERE (s.time_end < SYSDATE)
    
    UNION
          
    SELECT s.project_id AS PROJECT_ID, s.id AS SPRINT_ID, 'Not finished' AS STATUS
    FROM Sprints s
    WHERE (s.time_end >= SYSDATE);