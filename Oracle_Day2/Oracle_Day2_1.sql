---- PL/SQL(Procedural Language/Structured Query Language)
-- Oracle �����ͺ��̽����� ���Ǵ� ���α׷��� ���.
----  SQL�� Ȯ���� ������ ���(Procedural Language)�̴�. 
---- PL/SQL ���α׷��� ������ ũ�� Procedure, Function, Trigger �� ������ ����.


-- PL/SQL ���� 
---- ������ ����� �����ϴ� �κ�
---- �����
--DECLARE SECTION
--
--
---- �����
---- IF��, WHILE �Լ� ���� 
--EXECUTABLE SECTION
--
--
---- ����ó���� 
---- �������� ��Ȳ�� �߻��� �ذ��ϱ� ���� ���� 
--EXCEPTION SECTION 
--
--SET SERVEROUTPUT ON;
---- ���ν����� ����Ͽ� ����ϴ� ������ ȭ�鿡 �����ֵ��� 
---- �����ϴ� ȯ�溯���� �⺻�� OFF, ����� �� -> ON ���� ����
--
--
--BEGIN
---- PUT_LINE �̶�� ���ν����� �̿��Ͽ� ���
---- DBMS_OUTPUT ��Ű���� ���� ����
--
--END; 

--�⺻ Ư�� 
-- ��� ������ ������ �����Ѵ�. 
-- BEGIN�� END�� ����Ѵ�.
-- ������ ���ο� /�� �Է��ϸ� �ش� ����� ����ȴ�.
-- Ŀ���� ����Ͽ� ���� ���� �˻� �� ó�� 

--SET SERVEROUTPUT ON;
--
--BEGIN
--    DBMS_OUTPUT.PUT_LINE('HELLO WORLD');
--    
--END;    

-- ����� ����(Block)
-- �͸���: �̸��� ���� pl/sql block
-- �̸��� �ִ� ���: DB�� ��ü�� ����Ǵ� ���
-- ���ν��� : ���ϰ��� �ϳ� �̻� ���� �� �ִ� ���α׷�
-- �Լ� : ���� ���� �ݵ�� ��ȯ�ؾ� �ϴ� ���α׷�
-- ��Ű��: �ϳ� �̻��� ���ν���, �Լ�, ����, ���� ���� ������ ���Ѵ�.

-- Ʈ����: ������ �̺�Ʈ�� �߻��ϸ� �ڵ��� ����Ǵ� PL/SQL ��� 

-- ���� �����
-- ������ ������Ÿ�� := �ʱⰪ;
--VAL_NUM NUMBER := 1;
--VAL_STR CHAR(3) := 'AA';

-- ��� ���� �ϱ�
-- ����� CONSTANT ������Ÿ�� := �����;

-- ����1
/*
DECLARE
    EMP_ID NUMBER;
    EMP_NAME VARCHAR2(30); 
    VAR_NUM CONSTANT NUMBER := 1; --��� ���� 
    
BEGIN
    EMP_ID := 888;
    EMP_NAME := 'JUNG';
    DBMS_OUTPUT.PUT_LINE('EMP_ID: ' || EMP_ID);
    DBMS_OUTPUT.PUT_LINE('EMP_NAME: ' || EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('VAR_NUM: ' || VAR_NUM);
END;
*/

-- ����2 
/*
DECLARE
   VAR_NUM NUMBER := 5;
   VAR_NUM2 NUMBER := 5;
    
BEGIN
    DBMS_OUTPUT.PUT_LINE(VAR_NUM + VAR_NUM2);
END;
*/



-- ���ǹ�
/*
IF ���� THEN
  ó����1;
ELSIF ����2 THEN
  ó����2;
ELSE
  ó����3;
END IF;
*/

-- ���ǹ� ����1 
/*
DECLARE
   POINT NUMBER := 80; 
BEGIN
    IF POINT >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('A');
    ELSIF POINT >= 80 THEN 
        DBMS_OUTPUT.PUT_LINE('B');
    ELSE
        DBMS_OUTPUT.PUT_LINE('F');
    
END IF;

END;
*/



-- CASE�� 
/*
CASE WHEN ���� THEN
    ó����1
WHEN ����2 THEN
    ó����2
ELSE
    ó����3
END CASE;     
    
*/

-- CASE�� ����1 
/*
DECLARE
   POINT2 NUMBER := 90; 
BEGIN
    CASE 
    WHEN POINT2 >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('A');
    WHEN POINT2 >= 80 THEN 
        DBMS_OUTPUT.PUT_LINE('B');
    ELSE
        DBMS_OUTPUT.PUT_LINE('F');
    
END CASE;

END;
*/


-- MOD�Լ� :  �־��� ���ڸ� ���� �������� ��ȯ�ϴ� �Լ�
-- MOD(M,N) M�� N���� ������ �� ������ ���� ��ȯ�Ѵ�. 


--EX) ���� 2�� ������ �� ¦�� 
/*
DECLARE 
    T_NUMBER NUMBER := 10;
    
BEGIN 

    IF MOD( T_NUMBER,2) = 0 THEN 
        DBMS_OUTPUT.PUT_LINE('¦��');
    
    END IF; 
    
END;  
*/
-- TRUNC�Լ� : ���ڳ� ��¥�� ������ �ڸ����� ����(Truncate)�ϴ� �Լ�
-- TRUNC('��','�ɼ�')
-- �ַ� �Ҽ��� ��¥�� �ð��� ���� �� ����Ѵ�. 
/*
DECLARE
    T_NUMBER NUMBER := 80;
BEGIN
    CASE TRUNC(T_NUMBER / 10)
        WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('A');
        WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('B');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('C');
        ELSE DBMS_OUTPUT.PUT_LINE('F');    
    END CASE; 
END;    

--  T_NUMBER ������ ���� 80�� 10���� ���� �Ŀ� TRUNC �Լ��� ����Ͽ� ����� ����� 8 ���� B ��� 
*/



-- LOOP : �ݺ��� ���
/*
LOOP 
    ó����;
    EXIT ����;
END LOOP;    
*/
/*
DECLARE
    T_NUMBER NUMBER := 1; --�ʱⰪ
BEGIN
    LOOP --�ݺ��� ����
        DBMS_OUTPUT.PUT_LINE('LOOP �ݺ� Ƚ�� :' || T_NUMBER);
        T_NUMBER := T_NUMBER +1;  -- 1�� ����
        EXIT WHEN T_NUMBER > 4; -- 4 �̻��̸� �ݺ��� ���� 
END LOOP;
END;
*/

-- WHILE��
/*
DECLARE
    T_NUMBER NUMBER := 0; --�ʱⰪ
BEGIN
    WHILE T_NUMBER <= 10 LOOP --�ݺ��� ����
        DBMS_OUTPUT.PUT_LINE('LOOP �ݺ� Ƚ�� :' || T_NUMBER);
        T_NUMBER := T_NUMBER +1;  -- 1�� ����
END LOOP;
END;
*/

/*
-- FOR LOOP ���� 
- �ݺ� Ƚ�� ������ ��

FOR ���� IN ����..��
    ó����
END LOOP;    
    
*/
/*
BEGIN
    FOR I IN 1..5 LOOP 
        DBMS_OUTPUT.PUT_LINE('LOOP �ݺ� Ƚ��:' || I);
    END LOOP;
END;
/
*/


-- CONTINUE �� :  �ݺ��� ������ ���Ǹ�, ���� �ݺ��� �ߴ��ϰ� ���� �ݺ����� �̵��ϴ� �� ���
/*
BEGIN
    FOR I IN 1..5 LOOP 
        CONTINUE WHEN I = 3;
        
        DBMS_OUTPUT.PUT_LINE('LOOP �ݺ� Ƚ��:' || I);
    END LOOP;
END;
*/







-- ����1 :
/*
���ͳ� ���θ����� ������ �����Ͽ� �Ǵ�. �Ǹ� ���� ������ 9~12ȣ ���� ������ �� �ִ�. 
    �հ��� �ѷ��� 51mm �ʰ� 52mm������ ����� 9ȣ,
    52mm �ʰ� 53mm ������ ����� 10ȣ,
    53mm �ʰ� 54mm ������ ����� 11ȣ,
    54mm �ʰ� 55mm ������ ����� 12ȣ,
    51mm �����̰ų�, 55mm �ʰ��� ����� ������ �Ұ����ϴٰ� �˷��ش�.
    ������ �հ��� �ѷ��� 52.1mm�� ��, �˸��� �������� ������ ��õ�ϴ� ���α׷��� �ۼ��غ���. 
*/

/*
DECLARE
   RINGSIZE NUMBER := 52.1; 
BEGIN
    CASE 
    WHEN RINGSIZE > 51 AND RINGSIZE <= 52 THEN
        DBMS_OUTPUT.PUT_LINE('9ȣ');
    WHEN RINGSIZE > 52 AND RINGSIZE <= 53 THEN
        DBMS_OUTPUT.PUT_LINE('10ȣ');
    WHEN RINGSIZE > 53 AND RINGSIZE <= 54 THEN
        DBMS_OUTPUT.PUT_LINE('12ȣ');    
    ELSE
        DBMS_OUTPUT.PUT_LINE('���� �Ұ�');
    
END CASE;

END;
/

*/

-- ����2 : �� ���� ���� ������ �Է� �޾� �� ���� ¦���̸� ���� ū ���� ����ϰ�, Ȧ���̸� �׳� �� ���� ����ϴ� ���α׷��� �ۼ��Ͻÿ�. 
/*
DECLARE
    num1    NUMBER;
    num2    NUMBER;
    num3    NUMBER;
    sum1    NUMBER;
    max_num NUMBER;
BEGIN
 
    num1 := &num1;
    num2 := &num2;
    num3 := &num3;
  

    sum1 := num1 + num2 + num3;
  
 
    IF MOD(sum1,2) = 0 THEN
        IF
            num1 >= num2
            AND num1 >= num3
        THEN
            max_num := num1;
        ELSIF
            num2 >= num1
            AND num2 >= num3
        THEN
            max_num := num2;
        ELSE
            max_num := num3;
        END IF;

        dbms_output.put_line('���� ū ��: ' || max_num);
    ELSE
        dbms_output.put_line('��: ' || sum1);
    END IF;

END;
/

*/


-- ����3 : 10���� 20 ���̿� Ȧ���� ����ϴ� ���α׷��� for���� �̿��Ͽ� �ۼ��غ���.
/*
BEGIN
    FOR I IN 10..20 LOOP 
        CONTINUE WHEN MOD(I,2) = 0;
        
        DBMS_OUTPUT.PUT_LINE(I || ' IS A ODD NUMBER');
    END LOOP;
END;
/

*/


-- ����4 : "10�� ��� �� �Ѿ�� ���� ����" ��� �Ӵ��� �ִ�. �� �Ӵ��� �ݺ��� �� while ���� �̿��Ͽ� �����غ���. 
/*
DECLARE
    T_NUMBER NUMBER := 1; --�ʱⰪ
BEGIN
    WHILE T_NUMBER <= 10 LOOP --�ݺ��� ����
        DBMS_OUTPUT.PUT_LINE('������ ' || T_NUMBER || '�� �����.');
        T_NUMBER := T_NUMBER +1;  -- 1�� ����
END LOOP;
END;
/

*/


-- ����5 : ���� �µ� ȭ�� �µ��� ��ȯ�ϱ� 
/*
1. ����ڰ� ��ȯ�� ���� �µ��� �Է��Ѵ�.
2. ȭ�� �µ� ��ȯ ������ ����Ͽ� ȭ�� �µ��� ��ȯ�Ѵ�.
3. ȭ�� �µ��� ����Ѵ�. 
*/

/*
DECLARE

    TEMPERATURE NUMBER; 
    CHANGE_TEMP NUMBER;

BEGIN
    TEMPERATURE := &TEMPERATURE;
    CHANGE_TEMP := (TEMPERATURE * 9/5) + 32   ;  -- ȭ�� �µ� ��ȯ ���� 

        DBMS_OUTPUT.PUT_LINE('�Է��� ���� �µ� -> ȭ�� �µ� ��ȯ ���: ' || CHANGE_TEMP);
END; 
/
*/

-- ����6 : meter�� feet�� yard�� ��ȯ�ϱ� 

/*
1. ����ڰ� ��ȯ�� meter�� �Է��Ѵ�. 
2. ������ ���� ������ ����Ͽ� feet�� yard�� ��ȯ�Ѵ�. 
feet = meter / 0.305
yard = meter * 1.0936
3. ��ȯ�� feet�� yard�� ����Ѵ�. 
*/

/*
DECLARE 
    METER NUMBER;
    YARD NUMBER;
    FEET NUMBER;

BEGIN

    METER := & METER;
    FEET := METER / 0.305;
    YARD := METER * 1.0936;
        
        DBMS_OUTPUT.PUT_LINE('FEET ��ȯ��: ' || FEET);
        DBMS_OUTPUT.PUT_LINE('YARD ��ȯ��: ' || YARD);

END;
/

*/

-- ����7 : �Һ��ڷκ��� ��ǰ ���ݰ� �ΰ���ġ�� ���ϱ�
/*
��ǰ�� �Һ��ڰ��� �Է¹޾� ��ǰ ���ݰ� �ΰ���ġ���� ����ϴ� ���α׷�
1. ����ڰ� ��ǰ�� �Һ��ڰ��� TOTALPRICE�� �Է��Ѵ�.
2. ������ ��ǰ����(PRODUCTPRICE)�� �ΰ���ġ��(TAX)�� ���� ����Ѵ�.
*/

/*
DECLARE
    TOTALPRICE NUMBER;
    PRODUCTPRICE NUMBER;
    TAX NUMBER;
BEGIN

    TOTALPRICE := &TOTALPRICE; 
    PRODUCTPRICE := TOTALPRICE * 10/11;
    TAX := TOTALPRICE / 11;

        DBMS_OUTPUT.PUT_LINE('��ǰ ������ ' || PRODUCTPRICE || '��');
        DBMS_OUTPUT.PUT_LINE('�ΰ���ġ���� ' || TAX || '�� �Դϴ�.');

END;
/
*/

--����8 : ��Ż� ���� ��� ����ϱ� 

/* 
��� ���� ��, �ſ�ī�� �ڵ�, ��� �ݾ��� �Է¹޾� ���� ����� ����ϴ� ���α׷�
1. ����ڰ� ���ݾ� CONTRACTPRICE, ��� ���� �� PERIOD, ī���ڵ� CARDCODE�� �Է�
2. �Է��� ���� ���Ŀ� ���� ����������� ����Ѵ�. 
- ��� ���� ���� ���� ���� �ݾ� = (��� �ݾ�) * (��� ���� �� ������)
- �ſ�ī�� ������ ���� ���� �ݾ� = (��� �ݾ�) * (�ſ�ī�� ������)
3. ���� ��� FINALPRICE�� ����Ѵ�. 
*/

/*
DECLARE
    contractprice NUMBER;
    period        NUMBER;
    cardcode      NUMBER;
    finalprice    NUMBER;
BEGIN
    contractprice := &contractprice;
    period := &period;
    cardcode := &cardcode;
    
    CASE
        WHEN period <= 6 THEN
            contractprice := contractprice;
        WHEN period > 6 AND period <= 12 THEN
            contractprice := contractprice - ( contractprice * 0.1 );
        WHEN period > 12 THEN
            contractprice := contractprice - ( contractprice * 0.2 );
        ELSE
            dbms_output.put_line('���ԱⰣ ���� �Ұ�');
    END CASE;

    CASE
        WHEN cardcode = 11 THEN
            contractprice := contractprice;
        WHEN cardcode = 12 THEN
            contractprice := contractprice - ( contractprice * 0.1 );
        WHEN cardcode = 13 THEN
            contractprice := contractprice - ( contractprice * 0.2 );
        ELSE
            dbms_output.put_line('ī�� ���� �Ұ�');
    END CASE;

    finalprice := contractprice;
    dbms_output.put_line('���� �����: ' || finalprice || '�� �Դϴ�.');
END;
/
*/

-- ����9: ������ ���, �ְ�, ������ ���ϱ�
/*
1. ���� ����Ʈ�� ���ڷ� �޴´�.
2. ���, �ְ�, �������� ����Ѵ�.
*/

/*
DECLARE 
    SCORE1 NUMBER := &SCORE1; -- ���� �Է¹޴� ���ÿ� ������ �Ҵ� 
    SCORE2 NUMBER := &SCORE2;
    SCORE3 NUMBER := &SCORE3;
    AVG_SCORE NUMBER;
    MAX_SCORE NUMBER;
    MIN_SCORE NUMBER; 

BEGIN 
    
    AVG_SCORE := (SCORE1 + SCORE2 + SCORE3) / 3; -- ��� ���ϱ� 
    MAX_SCORE := GREATEST(SCORE1, SCORE2, SCORE3); -- �ְ��� ���ϱ� (GREATEST�Լ� ���)
    MIN_SCORE := LEAST(SCORE1, SCORE2, SCORE3); -- ������ ���ϱ� (LEAST�Լ� ���)
    
    DBMS_OUTPUT.PUT_LINE('��� ����: ' || AVG_SCORE);
    DBMS_OUTPUT.PUT_LINE('�ְ� ����: ' || MAX_SCORE);
    DBMS_OUTPUT.PUT_LINE('���� ����: ' || MIN_SCORE);
    
END;
/
*/

-- ����10 : Ŀ�� �����ϱ� 
/*
1. Ŀ�� ������ �Ƹ޸�ī��, ī���ī, ī���, �׸�Ƽ�󶼰� �ִ�. 
2. ������� Grande, Regular, Short ����� �ִ�.
3. �� ����� �� ���ؼ� ����ؾ� �Ѵ�. 
*/

/*
DECLARE 
    COFFEE VARCHAR2(30);
--    SIZE VARCHAR2(30) := &SIZE;
    PRICE NUMBER = 0;
    
BEGIN

    COFFEE := '&COFFEE';
     CASE COFFEE
        WHEN COFFEE LIKE '%�Ƹ޸�ī��%' THEN
            PRICE := PRICE + 1000;
        WHEN COFFEE LIKE '%ī���ī%' THEN
           PRICE := PRICE + 2000;
        WHEN COFFEE LIKE '%ī���%' THEN
            PRICE := PRICE + 3000;
        WHEN COFFEE LIKE '%�׸�Ƽ��%' THEN
            PRICE := PRICE + 4000;
        ELSE
            dbms_output.put_line('���� �޴�');
    END CASE;

     DBMS_OUTPUT.PUT_LINE(PRICE);
   
END;
/
*/



/*
�Լ�(Function)�̶�?
 �����ͺ��̽����� �Լ��� �Ϲ����� ���α׷��ֿ����� �Լ��� �����մϴ�.
 �Ű������� �޾� Ư�� ���(�۾�)�� �����ϰ� ����� ��ȯ�ϴ� ������ �Ǿ� �ֽ��ϴ�.
 ��, Ư�� ������ �����ϴ� �ڵ� �κ��� �ǹ��մϴ�.
 �����ͺ��̽� �������� Ư�� ��(�Ű�����)�� �Է� �޾� ���� �������� �۾��� �� ��ȯ�ϴ�
 ����� �ǹ��մϴ�.
 
����Ŭ���� �����ϴ� �Լ��� �����Լ� 
����� ���� �Լ�
 

CREATE OR REPLACE FUNCTION �Լ��̸�(�Ķ����1�̸� Ÿ��, �Ķ����2�̸� Ÿ��...)
RETURN ��ȯ��Ÿ��
IS
	���� ����
BEGIN
	���๮ �ۼ�
	RETURN ��ȯ�Ұ�
END;


CREATE OR REPLACE FUNCTION
    �Լ� ����
    
�Ű����� : �Լ��� ���޵Ǵ� �Ű������� (�̸� Ÿ��)  �Ű������� ����: ()    


*/
/*
CREATE OR REPLACE FUNCTION my_mod(num1 number, num2 number)
RETURN NUMBER -- ��ȯ NUMBER
IS 
    var_rem number := 0; --��ȯ�� ������
    var_quo number := 0; -- ��

BEGIN
    var_quo := floor(num1/num2);
    RETURN var_quo;   
END;
/

-- ȣ��
SELECT my_mod(14,3) res
FROM DUAL;
*/

/*
�Լ��� Ư�� ������ ������ �� ��� ���� ��ȯ������, ���ν����� Ư���� ������ ó���ϱ⸸ �ϰ� ��� ���� ��ȯ���� �ʴ� ���� 

���ν���
�����ͺ��̽��� ���� �Ϸ��� �۾��� ������ ������ ������ �����ͺ��̽� ���� �ý��ۿ� ������ ������ ����������(Persistent Storage Module)�̶�� �Ҹ��ϴ�.
���� ���� ���ν����� ���ν������ �θ���, �Ϸ��� ������ ��ġ �ϳ��� �Լ�ó�� �����ϱ� ���� ������ �����Դϴ�.
��, Ư�� �۾��� ���� �������� ����Դϴ�.

CREATE OR REPLACE PROCEDURE ���ν��� �̸�
        (�Ű�������1[IN |OUT | IN OUT] ������Ÿ��[:= ����Ʈ ��],
         �Ű�������2[IN |OUT | IN OUT] ������Ÿ��[:= ����Ʈ ��],
         ...
         
         *�Ű����� : IN �Է�, OUT ���, IN OUT �Է°� ����� ���ÿ� �Ѵ� �ǹ�! 
                    �ƹ��͵� �ۼ����� ������ �⺻ IN 
                    ����: ���� ���ν����� Ʈ���� ������ ����ϴ� �� 
                    Ư�� �۾��� �����ϴ� �̸��� �ִ� PL/SQL ����̴�. 
        )
    IS[AS]
      ����, ��� �� ����
    BEGIN
      �����
    ��
    [EXCEPTION
      ���� ó����]
    END [���ν��� �̸�];

*/

/*
CREATE TABLE JOB (
EMPNO NUMBER(4),
ENAME VARCHAR2(10),
JOB VARCHAR2(10),
DEPTNO NUMBER(2)
);
 
INSERT INTO JOB (EMPNO, ENAME, JOB, DEPTNO)
VALUES(001, '�ѿ���', '����', 24);
 
INSERT INTO JOB (EMPNO, ENAME, JOB, DEPTNO)
VALUES(002, 'Ȳ�ø�', '�˻�', 37);
 
INSERT INTO JOB (EMPNO, ENAME, JOB, DEPTNO)
VALUES(003, '����ö', '�˻�', 50);
 
INSERT INTO JOB (EMPNO, ENAME, JOB, DEPTNO)
VALUES(004, '���', '����', 22);
 
INSERT INTO JOB (EMPNO, ENAME, JOB, DEPTNO)
VALUES(005, '�̿���', 'CEO', 80);
 
SELECT * FROM JOB;
*/

/*
DECLARE
   CURSOR CUR_JOB IS SELECT * FROM JOB; -- Ŀ�� ����
   V_JOB JOB%ROWTYPE; --���� ����, ��� ���� �����͸� ���� ��(������ : %ROWTYPE)
BEGIN
    OPEN CUR_JOB; --Ŀ�� ����
    LOOP --�ݺ�
    FETCH CUR_JOB INTO V_JOB; --CUR_JOB�� �� ���� V_JOB�� ����
    IF CUR_JOB%NOTFOUND THEN
    EXIT;
    END IF; --���ǹ��� ���� ���� Ż��
    DBMS_OUTPUT.PUT_LINE('EMPNO :' || V_JOB.EMPNO ||
                         'ENAME :' || V_JOB.ENAME ||
                         'JOB :' || V_JOB.JOB ||
                         'DEPTNO :' || V_JOB.DEPTNO);
    END LOOP;
    CLOSE CUR_JOB;
END;

*/
/*
CREATE OR REPLACE PROCEDURE VALIDATE_JOB
(
    V_EMPNO JOB.EMPNO%TYPE,
    V_DEPTNO JOB.DEPTNO%TYPE
)
AS
    V_JOB JOB%ROWTYPE;
    CURSOR CUR_JOB IS SELECT * FROM JOB WHERE EMPNO = V_EMPNO;
BEGIN
    OPEN CUR_JOB;
    FETCH CUR_JOB INTO V_JOB;
    IF CUR_JOB%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('ȸ����ȣ ����ġ');
    ELSIF V_DEPTNO <> V_JOB.DEPTNO THEN
        DBMS_OUTPUT.PUT_LINE('�μ���ȣ ����ġ');
    ELSE
        DBMS_OUTPUT.PUT_LINE('���� ����');
    END IF;
CLOSE CUR_JOB;
END;

EXECUTE VALIDATE_JOB(1, 37);
EXECUTE VALIDATE_JOB(4, 22);
/
*/
/*
CREATE TABLE CAFE(
CAFEID NUMBER(20), 
CAFENAME VARCHAR2(20), 
CORPORATION VARCHAR2(20),
PRICE NUMBER(10)
);
 
CREATE OR REPLACE PROCEDURE INSERTCAFE(
    mCAFEID IN NUMBER,
    mCAFENAME IN VARCHAR2,
    mCORPORATION IN VARCHAR2,
    mPRICE IN NUMBER)
AS 
BEGIN 
    INSERT INTO CAFE(CAFEID, CAFENAME, CORPORATION, PRICE)
    VALUES(mCAFEID, mCAFENAME, mCORPORATION, mPRICE);
END;
 
EXEC INSERTCAFE(14, '��Ÿ����', '�ż���', 7000);
EXEC INSERTCAFE(20, '�̵��', '�̵��', 4500);
EXEC INSERTCAFE(03, '���ٹ�', '������', 3000);
SELECT * FROM CAFE;
*/



