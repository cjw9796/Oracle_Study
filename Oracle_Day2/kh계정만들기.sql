--system �������� ���� 

-- 11���� 
CREATE USER KH IDENTIFIED BY KH;
GRANT RESOURCE, CONNECT TO KH;

-- 19����(KH ���� ����)
alter session set "_ORACLE_SCRIPT"=true;
CREATE USER KH IDENTIFIED BY "KH";
GRANT RESOURCE, CONNECT TO KH;

grant unlimited tablespace to KH;

-- KH.SQL���� ����(javapart2/ ���� ������� ��� X)
-- CMD���� SQLPLUS�� KH �α��� �� �Ʒ� �ڵ�(����� ��ġ�� SQL���� �ҷ����� ���) ����

@D:\java_jungwook\javapart2\KH.sql

