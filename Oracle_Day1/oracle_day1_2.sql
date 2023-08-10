--SQL03_SELECT(Option).pdf 문제풀이 

SELECT * FROM TB_STUDENT;

-- 1. 학생이름과 주소지를 표시하시오. 단, 출력 헤어는 "학생 이름", "주소지"로 하고, 정렬은 이름으로 오름차순 표시하도록 한다. 
SELECT STUDENT_NAME AS "학생이름", STUDENT_ADDRESS AS "주소지" 
FROM TB_STUDENT
ORDER BY student_name DESC;

-- 2. 휴학중인 학생들의 이름과 주민번호를 나이가 적은 순서로 화면에 출력하시오. 

SELECT STUDENT_NAME, STUDENT_SSN 
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY STUDENT_SSN DESC;

-- 3. 주소지가 강원도나 경기도인 학생들 중 1900년대 학번을 가진 학생들의 이름과 학번, 주소를 이름의 오름차순으로 화면에 출력하시오. 
-- 단, 출력헤더에는 "학생이름","학번","거주지 주소" 가 출력되도록 한다. 

SELECT STUDENT_NAME "학생이름", STUDENT_NO "학번", STUDENT_ADDRESS "거주지 주소"
FROM TB_STUDENT
WHERE STUDENT_NO LIKE '9%' AND (STUDENT_ADDRESS LIKE '강원도%' OR STUDENT_ADDRESS LIKE '경기도%')
ORDER BY STUDENT_NAME DESC;

-- 4. 현재 법학과 교수 중 가장 나이가 많은 사람부터 이름을 확인할 수 있는 SQL 문장을 작성하시오. 
SELECT * FROM TB_PROFESSOR;
SELECT * FROM TB_DEPARTMENT;

SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO 
                        FROM TB_DEPARTMENT
                        WHERE DEPARTMENT_NO = 005
                        )
ORDER BY PROFESSOR_SSN ASC; 


-- 5. 2004년 2학기에 'C3118100' 과목을 수강한 학생들의 학점을 조회하려고 한다.
-- 학점이 높은 학생부터 표시하고, 학점이 같으면 학번이 낮은 학생부터 표시하는 구문을 작성하시오. 

SELECT * FROM TB_GRADE;

SELECT STUDENT_NO, POINT
FROM TB_GRADE
WHERE TERM_NO = '200402' AND CLASS_NO = 'C3118100'
ORDER BY POINT DESC, STUDENT_NO ASC;

-- 6. 학생 번호, 학생 이름, 학과 이름을 학생 이름으로 오름차순 정렬하여 출력하는 SQL문을 작성하시오.

--SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME 
--FROM TB_STUDENT JOIN TB_DEPARTMENT ;

SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
FROM TB_STUDENT JOIN TB_DEPARTMENT ON TB_STUDENT.DEPARTMENT_NO = TB_DEPARTMENT.DEPARTMENT_NO
ORDER BY STUDENT_NAME ASC;

-- 7. 춘 기술대학교의 과목 이름과 과목의 학과 이름을 출력하는 SQL 문장을 작성하시오.
SELECT * FROM TB_DEPARTMENT;
SELECT * FROM TB_CLASS;

SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS JOIN TB_DEPARTMENT USING(DEPARTMENT_NO);

-- 8. 과목별 교수 이름을 찾으려고 한다. 과목 이름과 교수 이름을 츨력하는 SQL 문을 작성하시오. 

SELECT CLASS_NAME, PROFESSOR_NAME 
FROM TB_CLASS JOIN TB_PROFESSOR USING(DEPARTMENT_NO);

-- 9. 8번의 결과 중 '인문사회' 계열에 속한 과목의 교수 이름을 찾으려고 한다. 이에 해당하는 과목 이름과 교수 이름을 출력하는 SQL 문을 작성하시오. 

SELECT CLASS_NAME, PROFESSOR_NAME 
FROM TB_CLASS JOIN TB_PROFESSOR USING(DEPARTMENT_NO)
              JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
              JOIN TB_CLASS_PROFESSOR USING(CLASS_NO)
WHERE CATEGORY = '인문사회';

-- 10. '음악학과' 학생들의 평점을 구하려고 한다. 음악학과 학생들의 "학번", "학생 이름", "전체 평점"을 출력하는 SQL 문장을 작성하시오.
-- 단, 평점은 소수점 1자리까지만 반올림하여 표시한다. 

SELECT STUDENT_NO 학번, STUDENT_NAME "학생 이름", ROUND(AVG(POINT),1) "전체 평점"
FROM TB_STUDENT JOIN TB_GRADE USING(STUDENT_NO)
                JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '음악학과'
GROUP BY STUDENT_NO, STUDENT_NAME
ORDER BY STUDENT_NO;


