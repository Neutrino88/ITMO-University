/* FILLING TABLES */
INSERT ALL
    INTO DEPARTMENTS VALUES (1, 'Отдел разработки', 'ОР', 'ОР-1', NULL)
    INTO DEPARTMENTS VALUES (2, 'Отдел кадров', 'ОК', 'ОК-1', NULL)
    INTO DEPARTMENTS VALUES (3, 'Отдел дизайна', 'ОД', 'ОД-1', NULL)
    INTO DEPARTMENTS VALUES (4, 'Отдел бухгалтерии', 'ОБ', 'ОБ-1', NULL)
    INTO DEPARTMENTS VALUES (5, 'Отдел обслуживающего персонала', 'ОП', 'ОП-1', NULL)
SELECT * FROM dual;

INSERT ALL
    INTO WORK_MODES VALUES (1, 'Почасовой', 'ЧАС')
    INTO WORK_MODES VALUES (2, 'Пол ставки', '0.5')
    INTO WORK_MODES VALUES (3, 'Полная ставка', '1.0')
SELECT * FROM dual;

INSERT ALL
    /* ID, WORK_MODE_ID, NAME, SHORT_NAME, SALARY */
    INTO POSITIONS VALUES (1, 1, 'Начальник отдела', 'НАЧ-ОТДЛ', 400)
    INTO POSITIONS VALUES (2, 1, 'Программист старший', 'СТ-ПРОГ', 290)
    INTO POSITIONS VALUES (3, 1, 'Программист', 'ПРОГ', 280)
    INTO POSITIONS VALUES (4, 1, 'Программист ассистент', 'АС-ПРОГ', 250)
    INTO POSITIONS VALUES (5, 3, 'Инспектор отдела кадров', 'ИО-КАД', 4000)
    INTO POSITIONS VALUES (6, 3, 'Специалист по кадрам', 'СПЕЦ-КАД', 4000)
    INTO POSITIONS VALUES (7, 3, 'Дизайнер', 'ДИЗ', 4000)
    INTO POSITIONS VALUES (8, 3, 'Web-дизайнер', 'WEB-ДИЗ', 4000)
    INTO POSITIONS VALUES (9, 3, 'Бухгалтер старший', 'С-БУХ', 4000)
    INTO POSITIONS VALUES (10, 2, 'Бухгалтер ведущий', 'В-БУХ', 4000)
    INTO POSITIONS VALUES (11, 2, 'Бухгалтер младший', 'М-БУХ', 4000)
    INTO POSITIONS VALUES (12, 2, 'Обслуживающий персонал', 'ОБСЛУЖ', 4000)
SELECT * FROM dual;

INSERT ALL
    INTO EMPLOYEES VALUES (1, 'Казаков', 'Максим', 'Юрьевич', 'М', '10.12.1977', 'г. Санкт-Петербург', 'г. Санкт-Петербург, пер. Вяземский 5-7', 89813456578)
    INTO EMPLOYEES VALUES (2, 'Нестеров', 'Андрей', 'Андреевич', 'М', '10.10.2000', 'д. Андреевка', 'г. Санкт-Петербург', 89813456598)
    INTO EMPLOYEES VALUES (3, 'Юнусов', 'Александр', 'Варсонофьевич', 'М', '11.11.1999', 'п. Шуриково', 'г. Санкт-Петербург', 89813451238)
    INTO EMPLOYEES VALUES (4, 'Пружина', 'Любовь', 'Гермогеновна', 'Ж', '09.01.1901', 'г. Санкт-Петербург', 'г. Санкт-Петербург', 87813456578)
    INTO EMPLOYEES VALUES (5, 'Гречка', 'Анфиса', 'Игнатьевна', 'Ж', '09.01.1965', 'г. Санкт-Петербург', 'г. Санкт-Петербург', 87812356578)
    INTO EMPLOYEES VALUES (6, 'Гречка', 'Анфиса', 'Игнатьевна', 'Ж', '09.01.1965', 'г. Санкт-Петербург', 'г. Санкт-Петербург', 87812356578)
    INTO EMPLOYEES VALUES (7, 'Гречка', 'Анфиса', 'Игнатьевна', 'Ж', '09.01.1965', 'г. Санкт-Петербург', 'г. Санкт-Петербург', 87812356578)
    INTO EMPLOYEES VALUES (8, 'Гречка', 'Анфиса', 'Игнатьевна', 'Ж', '09.01.1965', 'г. Санкт-Петербург', 'г. Санкт-Петербург', 87812356578)
    INTO EMPLOYEES VALUES (9, 'Гречка', 'Анфиса', 'Игнатьевна', 'Ж', '09.01.1965', 'г. Санкт-Петербург', 'г. Санкт-Петербург', 87812356578)
    INTO EMPLOYEES VALUES (10, 'Гречка', 'Анфиса', 'Игнатьевна', 'Ж', '09.01.1965', 'г. Санкт-Петербург', 'г. Санкт-Петербург', 87812356578)
    INTO EMPLOYEES VALUES (11, 'Гречка', 'Анфиса', 'Игнатьевна', 'Ж', '09.01.1965', 'г. Санкт-Петербург', 'г. Санкт-Петербург', 87812356578)
    INTO EMPLOYEES VALUES (12, 'Гречка', 'Анфиса', 'Игнатьевна', 'Ж', '09.01.1965', 'г. Санкт-Петербург', 'г. Санкт-Петербург', 87812356578)
SELECT * FROM dual;

INSERT ALL
    /* ID, EMPLOYEE_ID, DEPART_ID, POSITION_ID, WORK_MONTH, HOURS_NUMBER, DAY_1, ..., DAY_31 */
    INTO WORK_GRAPHICS VALUES (1, 1, 1, 1, '01/10/2017', 300,
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'))
    INTO WORK_GRAPHICS VALUES (2, 2, 1, 2, '01/10/2017', 300,
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'))
    INTO WORK_GRAPHICS VALUES (3, 3, 1, 3, '01/10/2017', 300,
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'))
    INTO WORK_GRAPHICS VALUES (4, 4, 1, 4, '01/10/2017', 300,
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'))
    INTO WORK_GRAPHICS VALUES (5, 5, 2, 5, '01/10/2017', 0,
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'))
    INTO WORK_GRAPHICS VALUES (6, 6, 2, 6, '01/10/2017', 0,
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'))
    INTO WORK_GRAPHICS VALUES (7, 7, 3, 7, '01/10/2017', 0,
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'))
    INTO WORK_GRAPHICS VALUES (8, 8, 3, 8, '01/10/2017', 0,
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'))
    INTO WORK_GRAPHICS VALUES (9, 9, 4, 9, '01/10/2017', 0,
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'))
    INTO WORK_GRAPHICS VALUES (10, 10, 4, 10, '01/10/2017', 0,
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'))
    INTO WORK_GRAPHICS VALUES (11, 11, 4, 11, '01/10/2017', 0,
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'))
    INTO WORK_GRAPHICS VALUES (12, 12, 5, 12, '01/10/2017', 0,
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('рабочий день'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),
        LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('выходной'),LAB2.DAY_TYPE('рабочий день'))
SELECT * FROM dual;
