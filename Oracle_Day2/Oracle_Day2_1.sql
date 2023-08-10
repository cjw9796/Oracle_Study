---- PL/SQL(Procedural Language/Structured Query Language)
-- Oracle 데이터베이스에서 사용되는 프로그래밍 언어.
----  SQL을 확장한 절차적 언어(Procedural Language)이다. 
---- PL/SQL 프로그램의 종류는 크게 Procedure, Function, Trigger 로 나뉘어 진다.


-- PL/SQL 구조 
---- 변수나 상수를 선언하는 부분
---- 선언부
--DECLARE SECTION
--
--
---- 실행부
---- IF문, WHILE 함수 정의 
--EXECUTABLE SECTION
--
--
---- 예외처리부 
---- 예외적인 상황이 발생시 해결하기 위한 문장 
--EXCEPTION SECTION 
--
--SET SERVEROUTPUT ON;
---- 프로시저를 사용하여 출력하는 내용을 화면에 보여주도록 
---- 설정하는 환경변수로 기본은 OFF, 사용할 땐 -> ON 으로 변경
--
--
--BEGIN
---- PUT_LINE 이라는 프로시저를 이용하여 출력
---- DBMS_OUTPUT 패키지에 속해 있음
--
--END; 

--기본 특성 
-- 블록 단위의 실행을 제공한다. 
-- BEGIN과 END를 사용한다.
-- 마지막 라인에 /를 입력하면 해당 블록이 실행된다.
-- 커서를 사용하여 여러 행을 검색 및 처리 

--SET SERVEROUTPUT ON;
--
--BEGIN
--    DBMS_OUTPUT.PUT_LINE('HELLO WORLD');
--    
--END;    

-- 블록의 종류(Block)
-- 익명블록: 이름이 없는 pl/sql block
-- 이름이 있는 블록: DB의 객체로 저장되는 블록
-- 프로시저 : 리턴값을 하나 이상 가질 수 있는 프로그램
-- 함수 : 리턴 값을 반드시 반환해야 하는 프로그램
-- 패키지: 하나 이상의 프로시저, 함수, 변수, 예외 등의 묶음을 말한다.

-- 트리거: 지정된 이벤트가 발생하면 자동을 실행되는 PL/SQL 블록 

-- 변수 선언시
-- 변수명 데이터타입 := 초기값;
--VAL_NUM NUMBER := 1;
--VAL_STR CHAR(3) := 'AA';

-- 상수 선언 하기
-- 상수명 CONSTANT 데이터타입 := 상수값;

-- 예제1
/*
DECLARE
    EMP_ID NUMBER;
    EMP_NAME VARCHAR2(30); 
    VAR_NUM CONSTANT NUMBER := 1; --상수 선언 
    
BEGIN
    EMP_ID := 888;
    EMP_NAME := 'JUNG';
    DBMS_OUTPUT.PUT_LINE('EMP_ID: ' || EMP_ID);
    DBMS_OUTPUT.PUT_LINE('EMP_NAME: ' || EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('VAR_NUM: ' || VAR_NUM);
END;
*/

-- 예제2 
/*
DECLARE
   VAR_NUM NUMBER := 5;
   VAR_NUM2 NUMBER := 5;
    
BEGIN
    DBMS_OUTPUT.PUT_LINE(VAR_NUM + VAR_NUM2);
END;
*/



-- 조건문
/*
IF 조건 THEN
  처리문1;
ELSIF 조건2 THEN
  처리문2;
ELSE
  처리문3;
END IF;
*/

-- 조건문 예제1 
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



-- CASE문 
/*
CASE WHEN 조건 THEN
    처리문1
WHEN 조건2 THEN
    처리문2
ELSE
    처리문3
END CASE;     
    
*/

-- CASE문 예제1 
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


-- MOD함수 :  주어진 숫자를 나눈 나머지를 반환하는 함수
-- MOD(M,N) M을 N으로 나눴을 때 나머지 값을 반환한다. 


--EX) 값을 2로 나눴을 때 짝수 
/*
DECLARE 
    T_NUMBER NUMBER := 10;
    
BEGIN 

    IF MOD( T_NUMBER,2) = 0 THEN 
        DBMS_OUTPUT.PUT_LINE('짝수');
    
    END IF; 
    
END;  
*/
-- TRUNC함수 : 숫자나 날짜를 지정된 자릿수로 절삭(Truncate)하는 함수
-- TRUNC('값','옵션')
-- 주로 소수점 날짜의 시간을 없앨 때 사용한다. 
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

--  T_NUMBER 변수의 값인 80을 10으로 나눈 후에 TRUNC 함수를 사용하여 절삭된 결과는 8 따라서 B 출력 
*/



-- LOOP : 반복문 사용
/*
LOOP 
    처리문;
    EXIT 조건;
END LOOP;    
*/
/*
DECLARE
    T_NUMBER NUMBER := 1; --초기값
BEGIN
    LOOP --반복문 시작
        DBMS_OUTPUT.PUT_LINE('LOOP 반복 횟수 :' || T_NUMBER);
        T_NUMBER := T_NUMBER +1;  -- 1씩 증가
        EXIT WHEN T_NUMBER > 4; -- 4 이상이면 반복문 종료 
END LOOP;
END;
*/

-- WHILE문
/*
DECLARE
    T_NUMBER NUMBER := 0; --초기값
BEGIN
    WHILE T_NUMBER <= 10 LOOP --반복문 시작
        DBMS_OUTPUT.PUT_LINE('LOOP 반복 횟수 :' || T_NUMBER);
        T_NUMBER := T_NUMBER +1;  -- 1씩 증가
END LOOP;
END;
*/

/*
-- FOR LOOP 문법 
- 반복 횟수 지정할 때

FOR 변수 IN 시작..끝
    처리문
END LOOP;    
    
*/
/*
BEGIN
    FOR I IN 1..5 LOOP 
        DBMS_OUTPUT.PUT_LINE('LOOP 반복 횟수:' || I);
    END LOOP;
END;
/
*/


-- CONTINUE 문 :  반복문 내에서 사용되며, 현재 반복을 중단하고 다음 반복으로 이동하는 데 사용
/*
BEGIN
    FOR I IN 1..5 LOOP 
        CONTINUE WHEN I = 3;
        
        DBMS_OUTPUT.PUT_LINE('LOOP 반복 횟수:' || I);
    END LOOP;
END;
*/







-- 문제1 :
/*
인터넷 쇼핑몰에서 반지를 제작하여 판다. 판매 중인 반지는 9~12호 까지 제작할 수 있다. 
    손가락 둘레가 51mm 초과 52mm이하인 사람은 9호,
    52mm 초과 53mm 이하인 사람은 10호,
    53mm 초과 54mm 이하인 사람은 11호,
    54mm 초과 55mm 이하인 사람은 12호,
    51mm 이하이거나, 55mm 초과인 사람은 제작이 불가능하다고 알려준다.
    수지의 손가락 둘레가 52.1mm일 때, 알맞은 사이즈의 반지를 추천하는 프로그램을 작성해보자. 
*/

/*
DECLARE
   RINGSIZE NUMBER := 52.1; 
BEGIN
    CASE 
    WHEN RINGSIZE > 51 AND RINGSIZE <= 52 THEN
        DBMS_OUTPUT.PUT_LINE('9호');
    WHEN RINGSIZE > 52 AND RINGSIZE <= 53 THEN
        DBMS_OUTPUT.PUT_LINE('10호');
    WHEN RINGSIZE > 53 AND RINGSIZE <= 54 THEN
        DBMS_OUTPUT.PUT_LINE('12호');    
    ELSE
        DBMS_OUTPUT.PUT_LINE('제작 불가');
    
END CASE;

END;
/

*/

-- 문제2 : 세 개의 양의 정수를 입력 받아 그 합이 짝수이면 가장 큰 수를 출력하고, 홀수이면 그냥 그 합을 출력하는 프로그램을 작성하시오. 
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

        dbms_output.put_line('가장 큰 수: ' || max_num);
    ELSE
        dbms_output.put_line('합: ' || sum1);
    END IF;

END;
/

*/


-- 문제3 : 10부터 20 사이에 홀수를 출력하는 프로그램을 for문을 이용하여 작성해보자.
/*
BEGIN
    FOR I IN 10..20 LOOP 
        CONTINUE WHEN MOD(I,2) = 0;
        
        DBMS_OUTPUT.PUT_LINE(I || ' IS A ODD NUMBER');
    END LOOP;
END;
/

*/


-- 문제4 : "10번 찍어 안 넘어가는 나무 없다" 라는 속담이 있다. 이 속담을 반복문 중 while 문을 이용하여 구현해보자. 
/*
DECLARE
    T_NUMBER NUMBER := 1; --초기값
BEGIN
    WHILE T_NUMBER <= 10 LOOP --반복문 시작
        DBMS_OUTPUT.PUT_LINE('나무를 ' || T_NUMBER || '번 찍었다.');
        T_NUMBER := T_NUMBER +1;  -- 1씩 증가
END LOOP;
END;
/

*/


-- 문제5 : 섭씨 온도 화씨 온도로 변환하기 
/*
1. 사용자가 변환할 섭씨 온도를 입력한다.
2. 화씨 온도 변환 계산식을 사용하여 화씨 온도로 변환한다.
3. 화씨 온도를 출력한다. 
*/

/*
DECLARE

    TEMPERATURE NUMBER; 
    CHANGE_TEMP NUMBER;

BEGIN
    TEMPERATURE := &TEMPERATURE;
    CHANGE_TEMP := (TEMPERATURE * 9/5) + 32   ;  -- 화씨 온도 변환 계산식 

        DBMS_OUTPUT.PUT_LINE('입력한 섭씨 온도 -> 화씨 온도 변환 결과: ' || CHANGE_TEMP);
END; 
/
*/

-- 문제6 : meter를 feet와 yard로 변환하기 

/*
1. 사용자가 변환할 meter를 입력한다. 
2. 다음과 같은 수식을 사용하여 feet와 yard로 변환한다. 
feet = meter / 0.305
yard = meter * 1.0936
3. 변환된 feet와 yard를 출력한다. 
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
        
        DBMS_OUTPUT.PUT_LINE('FEET 변환값: ' || FEET);
        DBMS_OUTPUT.PUT_LINE('YARD 변환값: ' || YARD);

END;
/

*/

-- 문제7 : 소비자로부터 제품 가격과 부가가치세 구하기
/*
제품의 소비자가를 입력받아 제품 가격과 부가가치세를 출력하는 프로그램
1. 사용자가 제품의 소비자가격 TOTALPRICE를 입력한다.
2. 구해진 제품가격(PRODUCTPRICE)와 부가가치세(TAX)에 대해 출력한다.
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

        DBMS_OUTPUT.PUT_LINE('제품 가격은 ' || PRODUCTPRICE || '원');
        DBMS_OUTPUT.PUT_LINE('부가가치세는 ' || TAX || '원 입니다.');

END;
/
*/

--문제8 : 통신사 최종 요금 계산하기 

/* 
사용 개월 수, 신용카드 코드, 계약 금액을 입력받아 최종 요금을 출력하는 프로그램
1. 사용자가 계약금액 CONTRACTPRICE, 사용 개월 수 PERIOD, 카드코드 CARDCODE를 입력
2. 입력한 값을 수식에 따라 최종요금으로 계산한다. 
- 사용 개월 수에 따른 할인 금액 = (계약 금액) * (사용 개월 수 할인율)
- 신용카드 종류에 따른 할인 금액 = (계약 금액) * (신용카드 할인율)
3. 최종 요금 FINALPRICE를 출력한다. 
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
            dbms_output.put_line('가입기간 할인 불가');
    END CASE;

    CASE
        WHEN cardcode = 11 THEN
            contractprice := contractprice;
        WHEN cardcode = 12 THEN
            contractprice := contractprice - ( contractprice * 0.1 );
        WHEN cardcode = 13 THEN
            contractprice := contractprice - ( contractprice * 0.2 );
        ELSE
            dbms_output.put_line('카드 할인 불가');
    END CASE;

    finalprice := contractprice;
    dbms_output.put_line('최종 요금은: ' || finalprice || '원 입니다.');
END;
/
*/

-- 문제9: 점수의 평균, 최고, 최저점 구하기
/*
1. 점수 리스트를 인자로 받는다.
2. 평균, 최고, 최저점을 출력한다.
*/

/*
DECLARE 
    SCORE1 NUMBER := &SCORE1; -- 값을 입력받는 동시에 변수에 할당 
    SCORE2 NUMBER := &SCORE2;
    SCORE3 NUMBER := &SCORE3;
    AVG_SCORE NUMBER;
    MAX_SCORE NUMBER;
    MIN_SCORE NUMBER; 

BEGIN 
    
    AVG_SCORE := (SCORE1 + SCORE2 + SCORE3) / 3; -- 평균 구하기 
    MAX_SCORE := GREATEST(SCORE1, SCORE2, SCORE3); -- 최고점 구하기 (GREATEST함수 사용)
    MIN_SCORE := LEAST(SCORE1, SCORE2, SCORE3); -- 최저점 구하기 (LEAST함수 사용)
    
    DBMS_OUTPUT.PUT_LINE('평균 점수: ' || AVG_SCORE);
    DBMS_OUTPUT.PUT_LINE('최고 점수: ' || MAX_SCORE);
    DBMS_OUTPUT.PUT_LINE('최저 점수: ' || MIN_SCORE);
    
END;
/
*/

-- 문제10 : 커피 구매하기 
/*
1. 커피 종류는 아메리카노, 카페모카, 카페라떼, 그린티라떼가 있다. 
2. 사이즈는 Grande, Regular, Short 사이즈가 있다.
3. 각 비용을 다 더해서 출력해야 한다. 
*/

/*
DECLARE 
    COFFEE VARCHAR2(30);
--    SIZE VARCHAR2(30) := &SIZE;
    PRICE NUMBER = 0;
    
BEGIN

    COFFEE := '&COFFEE';
     CASE COFFEE
        WHEN COFFEE LIKE '%아메리카노%' THEN
            PRICE := PRICE + 1000;
        WHEN COFFEE LIKE '%카페모카%' THEN
           PRICE := PRICE + 2000;
        WHEN COFFEE LIKE '%카페라떼%' THEN
            PRICE := PRICE + 3000;
        WHEN COFFEE LIKE '%그린티라떼%' THEN
            PRICE := PRICE + 4000;
        ELSE
            dbms_output.put_line('없는 메뉴');
    END CASE;

     DBMS_OUTPUT.PUT_LINE(PRICE);
   
END;
/
*/



/*
함수(Function)이란?
 데이터베이스에서 함수는 일반적인 프로그래밍에서의 함수와 동일합니다.
 매개변수를 받아 특정 계산(작업)을 수행하고 결과를 반환하는 구조로 되어 있습니다.
 즉, 특정 동작을 수행하는 코드 부분을 의미합니다.
 데이터베이스 내에서는 특정 값(매개변수)을 입력 받아 여러 쿼리문을 작업한 뒤 반환하는
 기능을 의미합니다.
 
오라클에서 제공하는 함수는 내장함수 
사용자 정의 함수
 

CREATE OR REPLACE FUNCTION 함수이름(파라미터1이름 타입, 파라미터2이름 타입...)
RETURN 반환할타입
IS
	변수 선언
BEGIN
	실행문 작성
	RETURN 반환할값
END;


CREATE OR REPLACE FUNCTION
    함수 생성
    
매개변수 : 함수로 전달되는 매개변수로 (이름 타입)  매개변수가 생략: ()    


*/
/*
CREATE OR REPLACE FUNCTION my_mod(num1 number, num2 number)
RETURN NUMBER -- 반환 NUMBER
IS 
    var_rem number := 0; --반환할 나머지
    var_quo number := 0; -- 몫

BEGIN
    var_quo := floor(num1/num2);
    RETURN var_quo;   
END;
/

-- 호출
SELECT my_mod(14,3) res
FROM DUAL;
*/

/*
함수는 특정 연산을 수행한 뒤 결과 값을 반환하지만, 프로시저는 특정한 로직을 처리하기만 하고 결과 값을 반환하지 않는 서브 

프로시저
데이터베이스에 대한 일련의 작업을 정리한 절차를 관계형 데이터베이스 관리 시스템에 저장한 것으로 영구저장모듈(Persistent Storage Module)이라고도 불립니다.
보통 저장 프로시저를 프로시저라고 부르며, 일련의 쿼리를 마치 하나의 함수처럼 실행하기 위한 쿼리의 집합입니다.
즉, 특정 작업을 위한 쿼리들의 블록입니다.

CREATE OR REPLACE PROCEDURE 프로시저 이름
        (매개변수명1[IN |OUT | IN OUT] 데이터타입[:= 디폴트 값],
         매개변수명2[IN |OUT | IN OUT] 데이터타입[:= 디폴트 값],
         ...
         
         *매개변수 : IN 입력, OUT 출력, IN OUT 입력과 출력을 동시에 한다 의미! 
                    아무것도 작성하지 않으면 기본 IN 
                    변수: 저장 프로시저나 트리거 내에서 사용하는 값 
                    특정 작업을 수행하는 이름이 있는 PL/SQL 블록이다. 
        )
    IS[AS]
      변수, 상수 등 선언
    BEGIN
      실행부
    　
    [EXCEPTION
      예외 처리부]
    END [프로시저 이름];

*/

/*
CREATE TABLE JOB (
EMPNO NUMBER(4),
ENAME VARCHAR2(10),
JOB VARCHAR2(10),
DEPTNO NUMBER(2)
);
 
INSERT INTO JOB (EMPNO, ENAME, JOB, DEPTNO)
VALUES(001, '한여진', '경찰', 24);
 
INSERT INTO JOB (EMPNO, ENAME, JOB, DEPTNO)
VALUES(002, '황시목', '검사', 37);
 
INSERT INTO JOB (EMPNO, ENAME, JOB, DEPTNO)
VALUES(003, '강원철', '검사', 50);
 
INSERT INTO JOB (EMPNO, ENAME, JOB, DEPTNO)
VALUES(004, '장건', '경찰', 22);
 
INSERT INTO JOB (EMPNO, ENAME, JOB, DEPTNO)
VALUES(005, '이연재', 'CEO', 80);
 
SELECT * FROM JOB;
*/

/*
DECLARE
   CURSOR CUR_JOB IS SELECT * FROM JOB; -- 커서 선언
   V_JOB JOB%ROWTYPE; --변수 선언, 모든 열의 데이터를 갖고 옴(행참조 : %ROWTYPE)
BEGIN
    OPEN CUR_JOB; --커서 열기
    LOOP --반복
    FETCH CUR_JOB INTO V_JOB; --CUR_JOB의 한 행을 V_JOB에 넣음
    IF CUR_JOB%NOTFOUND THEN
    EXIT;
    END IF; --조건문을 통해 루프 탈출
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
        DBMS_OUTPUT.PUT_LINE('회원번호 불일치');
    ELSIF V_DEPTNO <> V_JOB.DEPTNO THEN
        DBMS_OUTPUT.PUT_LINE('부서번호 불일치');
    ELSE
        DBMS_OUTPUT.PUT_LINE('인증 성공');
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
 
EXEC INSERTCAFE(14, '스타벅스', '신세계', 7000);
EXEC INSERTCAFE(20, '이디야', '이디야', 4500);
EXEC INSERTCAFE(03, '빽다방', '백종원', 3000);
SELECT * FROM CAFE;
*/



