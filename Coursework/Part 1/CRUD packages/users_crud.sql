CREATE OR REPLACE PACKAGE USERS_CRUD AS
    FUNCTION CREATE_USER(email_v IN USERS.EMAIL%TYPE, 
                        password_v IN USERS.PASSWORD%TYPE, 
                        phone_v IN USERS.PHONE%TYPE, 
                        username_v IN USERS.USERNAME%TYPE) RETURN NUMBER; 
                        
    FUNCTION CREATE_USER_WITH_PICTURE(email_v IN USERS.EMAIL%TYPE, 
                        password_v IN USERS.PASSWORD%TYPE, 
                        phone_v IN USERS.PHONE%TYPE, 
                        username_v IN USERS.USERNAME%TYPE,
                        picture_v IN PICTURES.PICTURE%TYPE) RETURN NUMBER; 
                        
    FUNCTION READ_USER(id_v IN USERS.ID%TYPE) RETURN users%ROWTYPE;
    
    PROCEDURE UPDATE_USER(id_v IN USERS.ID%TYPE, 
                        email_v IN USERS.EMAIL%TYPE, 
                        username_v IN USERS.USERNAME%TYPE, 
                        password_v IN USERS.PASSWORD%TYPE);
                        
    PROCEDURE DELETE_USER(id_v IN USERS.ID%TYPE);
END USERS_CRUD;
/

CREATE OR REPLACE PACKAGE BODY USERS_CRUD AS
    FUNCTION CREATE_USER_WITH_PICTURE(email_v IN USERS.EMAIL%TYPE, password_v IN USERS.PASSWORD%TYPE, phone_v IN USERS.PHONE%TYPE, username_v IN USERS.USERNAME%TYPE, picture_v IN PICTURES.PICTURE%TYPE) RETURN NUMBER
    AS
        user_id NUMBER := 0;
        pic_id NUMBER;
    BEGIN
        INSERT INTO PICTURES (PICTURE) values (picture_v);
        SELECT PICTURES_ID_SEQ.CURRVAL INTO pic_id FROM DUAL;
        
        INSERT INTO USERS (EMAIL, PASSWORD, PHONE, USERNAME, PICTURE_ID) values (email_v, password_v, phone_v, username_v, pic_id);
        SELECT USERS_ID_SEQ.CURRVAL INTO user_id FROM DUAL;
        RETURN user_id;
    END CREATE_USER_WITH_PICTURE;
    
    FUNCTION CREATE_USER(email_v IN USERS.EMAIL%TYPE, password_v IN USERS.PASSWORD%TYPE, phone_v IN USERS.PHONE%TYPE, username_v IN USERS.USERNAME%TYPE) RETURN NUMBER
    AS
        user_id NUMBER := 0; 
    BEGIN
        INSERT INTO USERS (EMAIL, PASSWORD, PHONE, USERNAME) values (email_v, password_v, phone_v, username_v);
        SELECT USERS_ID_SEQ.CURRVAL INTO user_id FROM DUAL;
        RETURN user_id;
    END CREATE_USER;
    
    FUNCTION READ_USER(id_v IN USERS.ID%TYPE) RETURN USERS%ROWTYPE
    AS
        user USERS%ROWTYPE;
    BEGIN   
        SELECT * INTO user FROM USERS WHERE ID = id_v;
        RETURN user;
    END READ_USER;
    
    PROCEDURE UPDATE_USER(id_v IN USERS.ID%TYPE, email_v IN USERS.EMAIL%TYPE, username_v IN USERS.USERNAME%TYPE, password_v IN USERS.PASSWORD%TYPE) AS
    BEGIN
        UPDATE USERS
            SET EMAIL = email_v,
                USERNAME = username_v,
                PASSWORD = password_v
            WHERE ID = id_v;
    END UPDATE_USER;
    
    PROCEDURE DELETE_USER(id_v IN USERS.ID%TYPE)
    AS
    BEGIN
        DELETE FROM USERS WHERE ID = id_v;
    END DELETE_USER;
END USERS_CRUD;
/

