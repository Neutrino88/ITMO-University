/* FILLING TABLES */
INSERT ALL
	INTO DEPARTMENTS VALUES (1, '����� ����������', '��', '��-1', NULL)
	INTO DEPARTMENTS VALUES (2, '����� ������', '��', '��-1', NULL)
	INTO DEPARTMENTS VALUES (3, '����� �������', '��', '��-1', NULL)
	INTO DEPARTMENTS VALUES (4, '����� �����������', '��', '��-1', NULL)
    INTO DEPARTMENTS VALUES (5, '����� �������������� ���������', '��', '��-1', NULL)
SELECT * FROM dual;

INSERT ALL
	INTO WORK_MODES VALUES (1, '���������', '���')
	INTO WORK_MODES VALUES (2, '��� ������', '0.5')
	INTO WORK_MODES VALUES (3, '������ ������', '1.0')
SELECT * FROM dual;

INSERT ALL
    /* ID, WORK_MODE_ID, NAME, SHORT_NAME, SALARY */
	INTO POSITIONS VALUES (1, 1, '��������� ������', '���-����', 400)
	INTO POSITIONS VALUES (2, 1, '����������� �������', '��-����', 290)
    INTO POSITIONS VALUES (3, 1, '�����������', '����', 280)
    INTO POSITIONS VALUES (4, 1, '����������� ���������', '��-����', 250)
    INTO POSITIONS VALUES (5, 3, '��������� ������ ������', '��-���', 4000)
	INTO POSITIONS VALUES (6, 3, '���������� �� ������', '����-���', 4000)
    INTO POSITIONS VALUES (7, 3, '��������', '���', 4000)
	INTO POSITIONS VALUES (8, 3, 'Web-��������', 'WEB-���', 4000)
    INTO POSITIONS VALUES (9, 3, '��������� �������', '�-���', 4000)
	INTO POSITIONS VALUES (10, 2, '��������� �������', '�-���', 4000)
	INTO POSITIONS VALUES (11, 2, '��������� �������', '�-���', 4000)
    INTO POSITIONS VALUES (12, 2, '������������� ��������', '������', 4000)
SELECT * FROM dual;

INSERT ALL
	INTO EMPLOYEES VALUES (1, '�������', '������', '�������', '�', '10.12.1977', '�. �����-���������', '�. �����-���������, ���. ��������� 5-7', 89813456578)
	INTO EMPLOYEES VALUES (2, '��������', '������', '���������', '�', '10.10.2000', '�. ���������', '�. �����-���������', 89813456598)
    INTO EMPLOYEES VALUES (3, '������', '���������', '�������������', '�', '11.11.1999', '�. ��������', '�. �����-���������', 89813451238)
    INTO EMPLOYEES VALUES (4, '�������', '������', '������������', '�', '09.01.1901', '�. �����-���������', '�. �����-���������', 87813456578)
    INTO EMPLOYEES VALUES (5, '������', '������', '����������', '�', '09.01.1965', '�. �����-���������', '�. �����-���������', 87812356578)
    INTO EMPLOYEES VALUES (6, '������', '������', '����������', '�', '09.01.1965', '�. �����-���������', '�. �����-���������', 87812356578)
    INTO EMPLOYEES VALUES (7, '������', '������', '����������', '�', '09.01.1965', '�. �����-���������', '�. �����-���������', 87812356578)
    INTO EMPLOYEES VALUES (8, '������', '������', '����������', '�', '09.01.1965', '�. �����-���������', '�. �����-���������', 87812356578)
    INTO EMPLOYEES VALUES (9, '������', '������', '����������', '�', '09.01.1965', '�. �����-���������', '�. �����-���������', 87812356578)
    INTO EMPLOYEES VALUES (10, '������', '������', '����������', '�', '09.01.1965', '�. �����-���������', '�. �����-���������', 87812356578)
    INTO EMPLOYEES VALUES (11, '������', '������', '����������', '�', '09.01.1965', '�. �����-���������', '�. �����-���������', 87812356578)
    INTO EMPLOYEES VALUES (12, '������', '������', '����������', '�', '09.01.1965', '�. �����-���������', '�. �����-���������', 87812356578)
SELECT * FROM dual;

INSERT ALL
    /* ID, EMPLOYEE_ID, DEPART_ID, POSITION_ID, WORK_MONTH, HOURS_NUMBER, DAY_1, ..., DAY_31 */
	INTO WORK_GRAPHICS VALUES (1, 1, 1, 1, '01/10/2017', 300,
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'))
    INTO WORK_GRAPHICS VALUES (2, 2, 1, 2, '01/10/2017', 300,
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'))
    INTO WORK_GRAPHICS VALUES (3, 3, 1, 3, '01/10/2017', 300,
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'))
    INTO WORK_GRAPHICS VALUES (4, 4, 1, 4, '01/10/2017', 300,
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'))
    INTO WORK_GRAPHICS VALUES (5, 5, 2, 5, '01/10/2017', 0,
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'))
    INTO WORK_GRAPHICS VALUES (6, 6, 2, 6, '01/10/2017', 0,
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'))
    INTO WORK_GRAPHICS VALUES (7, 7, 3, 7, '01/10/2017', 0,
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'))
    INTO WORK_GRAPHICS VALUES (8, 8, 3, 8, '01/10/2017', 0,
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'))
    INTO WORK_GRAPHICS VALUES (9, 9, 4, 9, '01/10/2017', 0,
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'))
    INTO WORK_GRAPHICS VALUES (10, 10, 4, 10, '01/10/2017', 0,
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'))
    INTO WORK_GRAPHICS VALUES (11, 11, 4, 11, '01/10/2017', 0,
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'))
    INTO WORK_GRAPHICS VALUES (12, 12, 5, 12, '01/10/2017', 0,
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('������� ����'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),
        LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('��������'),LAB2.DAY_TYPE('������� ����'))
SELECT * FROM dual;
