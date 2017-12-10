SET SERVEROUTPUT ON

DECLARE
BEGIN
    dbms_output.put_line(USERS_CRUD.CREATE_USER('1@1.ru', '1234', '89819708021', 'vasya'));
    dbms_output.put_line(USERS_CRUD.CREATE_USER('2@2.ru', '1234', '89123458343', 'vova'));
END;
/

DECLARE
    res USERS%ROWTYPE;
BEGIN
    res:= USERS_CRUD.READ_USER('1');
    dbms_output.put_line(res.email);
    res:= USERS_CRUD.READ_USER('2');
    dbms_output.put_line(res.email);
END;
/

DECLARE
BEGIN
    USERS_CRUD.UPDATE_USER(1, '11@11.ru', 'vasya', '12345');
    USERS_CRUD.UPDATE_USER(2, '22@22.ru', 'vova', '12345');
END;
/

DECLARE
BEGIN
    USERS_CRUD.DELETE_USER(1);
    USERS_CRUD.DELETE_USER(2);
END;

