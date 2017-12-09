/* PACKAGE STRENGTH */
CREATE OR REPLACE PACKAGE STRENGTH AS
	FUNCTION BY_WORK_MODE(WORK_MODE_ID IN INT) RETURN INT;
    FUNCTION BY_POSITIONS(POSITION_ID IN INT) RETURN INT;
END STRENGTH;
/
CREATE OR REPLACE PACKAGE BODY STRENGTH AS
    FUNCTION BY_WORK_MODE(WORK_MODE_ID IN INT) RETURN INT IS
        res int := 0;
    BEGIN
        EXECUTE IMMEDIATE  'SELECT COUNT(*)
                            FROM   (SELECT (g.EMPLOYEE_ID || g.DEPART_ID || g.POSITION_ID) AS FIELD
                                    FROM WORK_GRAPHICS g, EMPLOYEES e, POSITIONS p
                                    WHERE g.EMPLOYEE_ID = e.ID AND 
                                          g.POSITION_ID = p.ID  AND
                                          p.WORK_MODE_ID = ' || TO_CHAR(WORK_MODE_ID) || ')'
        INTO res;
        RETURN res;
    EXCEPTION WHEN OTHERS THEN
        RETURN res;
    END;   
    
    FUNCTION BY_POSITIONS(POSITION_ID IN INT) RETURN INT IS
        res int := 0;
    BEGIN
        EXECUTE IMMEDIATE ' SELECT COUNT(*)
                            FROM (SELECT (g.EMPLOYEE_ID || g.DEPART_ID || g.POSITION_ID)
                                  FROM WORK_GRAPHICS g, EMPLOYEES c
                                  WHERE g.EMPLOYEE_ID = c.ID AND 
                                        g.POSITION_ID = ' || TO_CHAR(POSITION_ID) || ')'
                           INTO res;
        RETURN res;
    EXCEPTION WHEN OTHERS THEN
        RETURN res;
    END;
END STRENGTH;
/

SELECT (SELECT COUNT(*) FROM EMPLOYEES) AS �����,
           STRENGTH.BY_POSITIONS(2)+STRENGTH.BY_POSITIONS(3)+STRENGTH.BY_POSITIONS(4) AS �������������,
           STRENGTH.BY_WORK_MODE(2) AS ��_���_������,
           STRENGTH.BY_WORK_MODE(3) AS ��_����_������,
           STRENGTH.BY_POSITIONS(12) AS ������_������,
           STRENGTH.BY_POSITIONS(7)+STRENGTH.BY_POSITIONS(8) AS ����������,
           STRENGTH.BY_POSITIONS(1) AS ���_�������,
           STRENGTH.BY_POSITIONS(6) AS ����_��_������
from dual;