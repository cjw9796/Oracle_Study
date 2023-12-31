CREATE TABLE USERS(
    NUM NUMBER,
    NAME VARCHAR2(20),
    BIRTH NUMBER,
    ADDRESS VARCHAR2(50)
);

INSERT INTO USERS VALUES(1,'홍길동',20020101,'서울');
INSERT INTO USERS VALUES(2,'강감찬',20020102,'경기');

COMMIT;

SELECT * FROM USERS;

DELETE FROM USERS
WHERE NUM = 2;

//----------------------------------------------------

CREATE TABLE STUDENTS(
    NAME VARCHAR2(20),
    STUDENTNUM NUMBER,
    MAJOR VARCHAR2(20),
    YEAR NUMBER,
    MINIMUM_CREDIT NUMBER,
    MAXIMUM_CREDIT NUMBER,
    PASSWORD NUMBER
);

INSERT INTO STUDENTS VALUES('홍길동', 201600000, '컴퓨터공학', 4, 9, 19, 1234);

SELECT * FROM STUDENTS;
COMMIT;

// ----------------------------------------------------------
CREATE TABLE LOGIN(
    DBID VARCHAR2(30),
    DBPW VARCHAR2(30)

);


INSERT INTO LOGIN VALUES('555','555');

COMMIT;

SELECT * FROM LOGIN;

UPDATE LOGIN SET DBPW = '10000' WHERE DBID = '555';

DELETE FROM LOGIN WHERE DBID = ?