CREATE OR REPLACE PACKAGE COMMENTS_CRUD AS
    
    FUNCTION CREATE_COMMENT(text_v IN COMMENTS.TEXT%TYPE, 
                        task_id_v IN COMMENTS.TASK_ID%TYPE, 
                        user_id_v IN COMMENTS.USER_ID%TYPE) RETURN NUMBER; 
                        
    FUNCTION READ_COMMENT(id_v IN COMMENTS.ID%TYPE) RETURN COMMENTS%ROWTYPE;
     
    PROCEDURE UPDATE_COMMENT(id_v IN COMMENTS.ID%TYPE,
                        text_v IN COMMENTS.TEXT%TYPE, 
                        task_id_v IN COMMENTS.TASK_ID%TYPE, 
                        user_id_v IN COMMENTS.USER_ID%TYPE);
                       
    PROCEDURE DELETE_COMMENT(id_v IN COMMENTS.ID%TYPE);
    
END COMMENTS_CRUD;
/

CREATE OR REPLACE PACKAGE BODY COMMENTS_CRUD AS
    FUNCTION CREATE_COMMENT(text_v IN COMMENTS.TEXT%TYPE, task_id_v IN COMMENTS.TASK_ID%TYPE, user_id_v IN COMMENTS.USER_ID%TYPE) RETURN NUMBER
    AS
        comment_id NUMBER := 0;
    BEGIN
        INSERT INTO COMMENTS (TEXT, TASK_ID, USER_ID) values (text_v, task_id_v, user_id_v);
        SELECT COMMENTS_ID_SEQ.CURRVAL INTO comment_id FROM DUAL;

        RETURN comment_id;
    END CREATE_COMMENT;

    FUNCTION READ_COMMENT(id_v IN COMMENTS.ID%TYPE) RETURN COMMENTS%ROWTYPE
    AS
        comment COMMENTS%ROWTYPE;
    BEGIN   
        SELECT * into COMMENT FROM COMMENTS WHERE ID = id_v;
        return comment;
    END READ_COMMENT;
     
    PROCEDURE UPDATE_COMMENT(id_v IN COMMENTS.ID%TYPE, text_v IN COMMENTS.TEXT%TYPE, task_id_v IN COMMENTS.TASK_ID%TYPE, user_id_v IN COMMENTS.USER_ID%TYPE) AS
    BEGIN
        UPDATE COMMENTS
            SET TEXT = text_v,
                TASK_ID = task_id_v,
                USER_ID = user_id_v
            WHERE ID = id_v;
    END UPDATE_COMMENT;
      
    PROCEDURE DELETE_COMMENT(id_v IN COMMENTS.ID%TYPE)
    AS
    BEGIN
        DELETE FROM COMMENTS WHERE ID = id_v;
    END DELETE_COMMENT;
 
END COMMENTS_CRUD;
/

