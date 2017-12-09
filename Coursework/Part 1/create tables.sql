/* DROP TABLES, SEQUENCE AND TYPES*/
DECLARE
BEGIN
    FOR i IN (SELECT us.sequence_name FROM USER_SEQUENCES us) LOOP
        EXECUTE IMMEDIATE 'drop sequence '|| i.sequence_name ||'';
    END LOOP;

    FOR i IN (SELECT ut.TABLE_name FROM USER_TABLES ut) LOOP
        EXECUTE IMMEDIATE 'drop TABLE '|| i.TABLE_name ||' CASCADE CONSTRAINTS ';
    END LOOP;
  
    FOR i IN (SELECT ut.type_name FROM USER_TYPES ut) LOOP
        EXECUTE IMMEDIATE 'drop type '|| i.type_name;
    END LOOP;
END;
/

/* CREATE SEQUENCE */
CREATE SEQUENCE  "PROJECTS_ID_SEQ" INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE  "USERS_ID_SEQ" INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE  "SPRINTS_ID_SEQ" INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE  "REPORTS_ID_SEQ" INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE  "TASKS_ID_SEQ" INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE  "COMMENTS_ID_SEQ" INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE  "INTERVALS_ID_SEQ" INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE  "SUBTASKS_ID_SEQ" INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE  "PICTURES_ID_SEQ" INCREMENT BY 1 START WITH 1;

CREATE TABLE projects(
	id NUMERIC(19),
    name VARCHAR(255) NOT NULL,
	description VARCHAR(255) NULL,
    creating_date DATE NOT NULL,
    
	CONSTRAINT projects_pk PRIMARY KEY (id)
);

CREATE TABLE pictures (
    id NUMERIC(19),
    picname VARCHAR(20),
    picture BLOB,
    
    CONSTRAINT user_picture_pk PRIMARY KEY (id)
);

CREATE TABLE users(
	id NUMERIC(19),
	email VARCHAR(255) NULL,
	password VARCHAR(255) NULL,
	phone VARCHAR(255) NULL,
	username VARCHAR(255) NULL,
    picture_id NUMERIC(19) NULL,
    
	CONSTRAINT users_pk PRIMARY KEY (id),
    CONSTRAINT fk_user_picture FOREIGN KEY (picture_id) REFERENCES pictures(id),
    CONSTRAINT check_email CHECK (REGEXP_LIKE(email, '[A-Z0-9._%-]+@[A-Z0-9._%-]+\.[A-Z]{2,4}'))
);

CREATE TABLE project_user(
	project_id NUMERIC(19) NOT NULL,
	user_id NUMERIC(19) NOT NULL,
    
    CONSTRAINT fk_project_user_project FOREIGN KEY (project_id) REFERENCES projects(id),
    CONSTRAINT fk_project_user_user FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE sprints(
	id NUMERIC(19),
	time_END DATE NULL,
	time_start DATE NULL,
	project_id NUMERIC(19) NULL,
    
	CONSTRAINT sprints_pk PRIMARY KEY (id),
	CONSTRAINT fk_sprints_project FOREIGN KEY (project_id) REFERENCES projects(id)
);

CREATE TABLE reports(
	id NUMERIC(19),
	sprint_id NUMERIC(19) NULL,
    
	CONSTRAINT reports_pk PRIMARY KEY (id),
    CONSTRAINT fk_reports_sprint FOREIGN KEY (sprint_id) REFERENCES sprints(id)
);

CREATE TABLE tasks(
	id NUMERIC(19),
	name VARCHAR(255) NULL,
	status VARCHAR(255) NOT NULL,
	sprint_id NUMERIC(19) NOT NULL,
	user_id NUMERIC(19) NOT NULL,
    
	CONSTRAINT tasks_pk PRIMARY KEY (id),
	CONSTRAINT fk_tasks_sprint FOREIGN KEY (sprint_id) REFERENCES sprints(id),
    CONSTRAINT fk_tasks_user FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT check_status CHECK (status IN ('unknown', 'in progress', 'testing', 'ready'))
);

CREATE TABLE comments(
	id NUMERIC(19),
	text VARCHAR(255) NULL,
	task_id NUMERIC(19) NULL,
	user_id NUMERIC(19) NULL,
    
	CONSTRAINT comments_pk PRIMARY KEY (id),
    CONSTRAINT fk_comments_user FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_comments_task FOREIGN KEY (task_id) REFERENCES tasks(id)
);
/

CREATE TYPE interval_t AS OBJECT (
    time_start DATE,
    time_END DATE,
    MEMBER FUNCTION minutes_of_working RETURN NUMBER
);
/

CREATE TYPE BODY interval_t AS
    MEMBER FUNCTION minutes_of_working RETURN NUMBER AS
    BEGIN
        RETURN TRUNC((time_start-time_END) * 24 * 60);
    END;
END;
/

CREATE TABLE intervals(
	id NUMERIC(19),
    interval interval_t,
	task_id NUMERIC(19) NOT NULL,
	user_id NUMERIC(19) NOT NULL,
    
	CONSTRAINT intervals_pk PRIMARY KEY (id),
    CONSTRAINT fk_intervals_task FOREIGN KEY (task_id) REFERENCES tasks(id),
    CONSTRAINT fk_intervals_user FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE subtasks(
	id NUMERIC(19),
	task_id NUMERIC(19) NULL,
    
	CONSTRAINT subtasks_pk PRIMARY KEY (id),
    CONSTRAINT fk_subtasks_task FOREIGN KEY (task_id) REFERENCES tasks(id)
);

CREATE OR REPLACE TRIGGER projects_id_TRIGGER
BEFORE INSERT ON projects
FOR EACH ROW
BEGIN
    :new.id := PROJECTS_ID_SEQ.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER users_id_TRIGGER
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    :new.id := USERS_ID_SEQ.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER sprints_id_TRIGGER
BEFORE INSERT ON sprints
FOR EACH ROW
BEGIN
    :new.id := SPRINTS_ID_SEQ.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER reports_id_TRIGGER
BEFORE INSERT ON reports
FOR EACH ROW
BEGIN
    :new.id := REPORTS_ID_SEQ.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER tasks_id_TRIGGER
BEFORE INSERT ON tasks
FOR EACH ROW
BEGIN
    :new.id := TASKS_ID_SEQ.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER comments_id_TRIGGER
BEFORE INSERT ON comments
FOR EACH ROW
BEGIN
    :new.id := COMMENTS_ID_SEQ.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER intervals_id_TRIGGER
BEFORE INSERT ON intervals
FOR EACH ROW
BEGIN
    :new.id := INTERVALS_ID_SEQ.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER subtasks_id_TRIGGER
BEFORE INSERT ON subtasks
FOR EACH ROW
BEGIN
    :new.id := SUBTASKS_ID_SEQ.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER user_picture_id_TRIGGER
BEFORE INSERT ON pictures
FOR EACH ROW
BEGIN
    :new.id := PICTURES_ID_SEQ.NEXTVAL;
END;
/