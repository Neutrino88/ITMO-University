/* PACKAGE SALARY */

CREATE OR REPLACE PACKAGE SALARY AS
    FUNCTION BY_WORK_MODE(WORK_MODE_ID IN INT) RETURN INT;
    FUNCTION BY_POSITIONS(POSITION_ID IN INT) RETURN INT;
    FUNCTION BY_WORK_GRAPHIC(work_graphic_id IN INT) RETURN INT;
    FUNCTION SUBSTR_COUNT(STR IN VARCHAR, SUBSTR IN VARCHAR) RETURN INT;
    FUNCTION TOTAL(И_ IN INT) RETURN INT;
END SALARY;
/
    
CREATE OR REPLACE PACKAGE BODY SALARY AS
    FUNCTION SUBSTR_COUNT(STR IN VARCHAR, SUBSTR IN VARCHAR) RETURN INT IS
       res int := 0; 
    BEGIN
        res := (LENGTH(STR) - LENGTH(REPLACE(STR, SUBSTR, ''))) / LENGTH(SUBSTR);
        RETURN res;
    EXCEPTION WHEN OTHERS THEN
        RETURN res;
    END;
    
    FUNCTION BY_WORK_GRAPHIC(work_graphic_id IN INT) RETURN INT IS
        res INT := 0;
        work_mode_id INT := 0;
        day_colons VARCHAR(1000) := 'DAY_1.day_val || DAY_2.day_val || DAY_3.day_val || DAY_4.day_val.day_val || DAY_5.day_val || DAY_6.day_val || DAY_7.day_val || DAY_8.day_val || DAY_9.day_val || DAY_10.day_val || DAY_11.day_val || DAY_12.day_val || DAY_13.day_val || DAY_14.day_val || DAY_15.day_val || DAY_16.day_val || DAY_17.day_val || DAY_18.day_val || DAY_19.day_val || DAY_20.day_val || DAY_21.day_val || DAY_22.day_val || DAY_23.day_val || DAY_24.day_val || DAY_25.day_val || DAY_26.day_val || DAY_27.day_val || DAY_28.day_val || DAY_29.day_val || DAY_30.day_val || DAY_31';
    BEGIN
        EXECUTE IMMEDIATE 'SELECT p.WORK_MODE_ID
            FROM POSITIONS P, WORK_GRAPHICS g
            WHERE g.POSITION_ID = p.ID AND
                  g.ID = ' || TO_CHAR(work_graphic_id)                         
        INTO work_mode_id;
    
        /* Если почасовой */
        IF work_mode_id = 1 THEN
            EXECUTE IMMEDIATE 'SELECT AVG(SALARY)
                               FROM (SELECT p.SALARY * g.HOURS_NUMBER AS SALARY
                                   FROM WORK_GRAPHICS g, POSITIONS p
                                   WHERE g.ID = ' || TO_CHAR(work_graphic_id) || ' AND
                                         g.POSITION_ID = p.ID AND
                                         ADD_MONTHS(g.WORK_MONTH, 3) >= SYSDATE)'                         
            INTO res;
        ELSE
            EXECUTE IMMEDIATE 'SELECT AVG(SALARY)
                               FROM (SELECT   p.SALARY * SALARY.SUBSTR_COUNT(' || day_colons || ',''отпуск'') + 
                                          2 * p.SALARY * SALARY.SUBSTR_COUNT(' || day_colons || ',''командировка'') + 
                                              p.SALARY * SALARY.SUBSTR_COUNT(' || day_colons || ',''больничный'') + 
                                          2 * p.SALARY * SALARY.SUBSTR_COUNT(' || day_colons || ',''праздник'') + 
                                              p.SALARY * SALARY.SUBSTR_COUNT(' || day_colons || ',''рабочий день'') AS SALARY
                                   FROM WORK_GRAPHICS g, POSITIONS p
                                   WHERE g.POSITION_ID = p.ID  AND
                                         g.ID = ' || TO_CHAR(work_graphic_id) || 'AND
                                         ADD_MONTHS(g.WORK_MONTH, 3) >= SYSDATE)'                         
            INTO res;
            
            IF work_mode_id = 2 THEN
               res := res / 2;
            END IF;
        END IF;
        
        RETURN res;
        EXCEPTION WHEN OTHERS THEN 
            RETURN res;
    END;   
    
    FUNCTION BY_WORK_MODE(WORK_MODE_ID IN INT) RETURN INT IS
        res INT := 0;
        day_colons VARCHAR(1000) := 'DAY_1.day_val || DAY_2.day_val || DAY_3.day_val || DAY_4.day_val || DAY_5.day_val || DAY_6.day_val || DAY_7.day_val || DAY_8.day_val || DAY_9.day_val || DAY_10.day_val || DAY_11.day_val || DAY_12.day_val || DAY_13.day_val || DAY_14.day_val || DAY_15.day_val || DAY_16.day_val || DAY_17.day_val || DAY_18.day_val || DAY_19.day_val || DAY_20.day_val || DAY_21.day_val || DAY_22.day_val || DAY_23.day_val || DAY_24.day_val || DAY_25.day_val || DAY_26.day_val || DAY_27.day_val || DAY_28.day_val || DAY_29.day_val || DAY_30.day_val || DAY_31.day_val';
    BEGIN
        /* Если почасовой */
        IF WORK_MODE_ID = 1 THEN
            EXECUTE IMMEDIATE 'SELECT AVG(SALARY)
                               FROM (SELECT   p.SALARY * g.HOURS_NUMBER AS SALARY
                                   FROM WORK_GRAPHICS g, POSITIONS p
                                   WHERE g.POSITION_ID = p.ID  AND
                                         p.WORK_MODE_ID = ' || TO_CHAR(WORK_MODE_ID) || 'AND
                                         ADD_MONTHS(g.WORK_MONTH, 3) >= SYSDATE)'                         
            INTO res;
        ELSE
            EXECUTE IMMEDIATE 'SELECT AVG(SALARY)
                               FROM (SELECT   p.SALARY * SALARY.SUBSTR_COUNT(' || day_colons || ',''отпуск'') + 
                                          2 * p.SALARY * SALARY.SUBSTR_COUNT(' || day_colons || ',''командировка'') + 
                                              p.SALARY * SALARY.SUBSTR_COUNT(' || day_colons || ',''больничный'') + 
                                          2 * p.SALARY * SALARY.SUBSTR_COUNT(' || day_colons || ',''праздник'') + 
                                              p.SALARY * SALARY.SUBSTR_COUNT(' || day_colons || ',''рабочий день'') AS SALARY
                                   FROM WORK_GRAPHICS g, POSITIONS p
                                   WHERE g.POSITION_ID = p.ID  AND
                                         p.WORK_MODE_ID = ' || TO_CHAR(WORK_MODE_ID) || 'AND
                                         ADD_MONTHS(g.WORK_MONTH, 3) >= SYSDATE)'                         
            INTO res;
            
            IF WORK_MODE_ID = 2 THEN
               res := res / 2;
            END IF;
        END IF;
        
        RETURN res;
        EXCEPTION WHEN OTHERS THEN 
            RETURN res;
    END;   
    
    FUNCTION BY_POSITIONS(POSITION_ID IN INT) RETURN INT IS
        res INT := 0;
        work_mode_id INT := 0;
        day_colons VARCHAR(1000) := 'DAY_1.day_val || DAY_2.day_val || DAY_3.day_val || DAY_4.day_val || DAY_5.day_val || DAY_6.day_val || DAY_7.day_val || DAY_8.day_val || DAY_9.day_val || DAY_10.day_val || DAY_11.day_val || DAY_12.day_val || DAY_13.day_val || DAY_14.day_val || DAY_15.day_val || DAY_16.day_val || DAY_17.day_val || DAY_18.day_val || DAY_19.day_val || DAY_20.day_val || DAY_21.day_val || DAY_22.day_val || DAY_23.day_val || DAY_24.day_val || DAY_25.day_val || DAY_26.day_val || DAY_27.day_val || DAY_28.day_val || DAY_29.day_val || DAY_30.day_val || DAY_31.day_val';
    BEGIN
        EXECUTE IMMEDIATE 'SELECT WORK_MODE_ID
                           FROM POSITIONS 
                           WHERE ID = ' || TO_CHAR(POSITION_ID)                         
        INTO work_mode_id;
        
        /* почасовой */
        IF work_mode_id = 1 THEN
            EXECUTE IMMEDIATE 'SELECT AVG(SALARY)
                                   FROM (SELECT p.SALARY * g.HOURS_NUMBER AS SALARY
                                       FROM WORK_GRAPHICS g, POSITIONS p
                                       WHERE p.ID = g.POSITION_ID AND
                                             p.ID = ' || TO_CHAR(POSITION_ID) || 'AND
                                             ADD_MONTHS(g.WORK_MONTH, 3) >= SYSDATE)'                         
            INTO res;
        ELSE
            EXECUTE IMMEDIATE 'SELECT AVG(SALARY)
                               FROM (SELECT   p.SALARY * SALARY.SUBSTR_COUNT(' || day_colons || ',''отпуск'') + 
                                          2 * p.SALARY * SALARY.SUBSTR_COUNT(' || day_colons || ',''командировка'') + 
                                              p.SALARY * SALARY.SUBSTR_COUNT(' || day_colons || ',''больничный'') + 
                                          2 * p.SALARY * SALARY.SUBSTR_COUNT(' || day_colons || ',''праздник'') + 
                                              p.SALARY * SALARY.SUBSTR_COUNT(' || day_colons || ',''рабочий день'') AS SALARY
                                     FROM WORK_GRAPHICS g, POSITIONS p
                                         WHERE p.ID = g.POSITION_ID AND
                                               p.ID = ' || TO_CHAR(POSITION_ID) || 'AND
                                               ADD_MONTHS(g.WORK_MONTH, 3) >= SYSDATE)'                         
            INTO res;
        END IF;
        RETURN res;
    EXCEPTION WHEN OTHERS THEN
        RETURN res;
    END;  
    
    FUNCTION TOTAL(И_ IN INT) RETURN INT IS
       res int := 0; 
    BEGIN
        SELECT SUM(SALARY.BY_WORK_GRAPHIC(g.ID)) INTO res
                   FROM WORK_GRAPHICS g;
       
        RETURN res;
    EXCEPTION WHEN OTHERS THEN
        RETURN res;
    END;
END SALARY;
/

SELECT SALARY.TOTAL(1) AS Общая_зарплата,
       (SALARY.BY_POSITIONS(2)+SALARY.BY_POSITIONS(3)+SALARY.BY_POSITIONS(4))/3 AS Программистов,
       SALARY.BY_WORK_MODE(1) AS Почасовая,
       SALARY.BY_WORK_MODE(2) AS Пол_ставки,
       SALARY.BY_WORK_MODE(3) AS Полн_ставку,
       SALARY.BY_POSITIONS(12) AS Обслуж_персон,
       SALARY.BY_POSITIONS(7) AS Дизайнеров,
       SALARY.BY_POSITIONS(1) AS Нач_отделов,
       SALARY.BY_POSITIONS(6) AS Спец_по_кадрам
from dual;