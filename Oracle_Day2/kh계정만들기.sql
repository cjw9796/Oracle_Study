--system 계정에서 실행 

-- 11버전 
CREATE USER KH IDENTIFIED BY KH;
GRANT RESOURCE, CONNECT TO KH;

-- 19버전(KH 계정 생성)
alter session set "_ORACLE_SCRIPT"=true;
CREATE USER KH IDENTIFIED BY "KH";
GRANT RESOURCE, CONNECT TO KH;

grant unlimited tablespace to KH;

-- KH.SQL파일 저장(javapart2/ 임의 저장공간 상관 X)
-- CMD에서 SQLPLUS로 KH 로그인 후 아래 코드(저장된 위치에 SQL파일 불러오는 경로) 실행

@D:\java_jungwook\javapart2\KH.sql

