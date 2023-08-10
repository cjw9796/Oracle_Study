--SQL03_SELECT(Option).pdf ����Ǯ�� 

SELECT * FROM TB_STUDENT;

-- 1. �л��̸��� �ּ����� ǥ���Ͻÿ�. ��, ��� ���� "�л� �̸�", "�ּ���"�� �ϰ�, ������ �̸����� �������� ǥ���ϵ��� �Ѵ�. 
SELECT STUDENT_NAME AS "�л��̸�", STUDENT_ADDRESS AS "�ּ���" 
FROM TB_STUDENT
ORDER BY student_name DESC;

-- 2. �������� �л����� �̸��� �ֹι�ȣ�� ���̰� ���� ������ ȭ�鿡 ����Ͻÿ�. 

SELECT STUDENT_NAME, STUDENT_SSN 
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
ORDER BY STUDENT_SSN DESC;

-- 3. �ּ����� �������� ��⵵�� �л��� �� 1900��� �й��� ���� �л����� �̸��� �й�, �ּҸ� �̸��� ������������ ȭ�鿡 ����Ͻÿ�. 
-- ��, ���������� "�л��̸�","�й�","������ �ּ�" �� ��µǵ��� �Ѵ�. 

SELECT STUDENT_NAME "�л��̸�", STUDENT_NO "�й�", STUDENT_ADDRESS "������ �ּ�"
FROM TB_STUDENT
WHERE STUDENT_NO LIKE '9%' AND (STUDENT_ADDRESS LIKE '������%' OR STUDENT_ADDRESS LIKE '��⵵%')
ORDER BY STUDENT_NAME DESC;

-- 4. ���� ���а� ���� �� ���� ���̰� ���� ������� �̸��� Ȯ���� �� �ִ� SQL ������ �ۼ��Ͻÿ�. 
SELECT * FROM TB_PROFESSOR;
SELECT * FROM TB_DEPARTMENT;

SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO 
                        FROM TB_DEPARTMENT
                        WHERE DEPARTMENT_NO = 005
                        )
ORDER BY PROFESSOR_SSN ASC; 


-- 5. 2004�� 2�б⿡ 'C3118100' ������ ������ �л����� ������ ��ȸ�Ϸ��� �Ѵ�.
-- ������ ���� �л����� ǥ���ϰ�, ������ ������ �й��� ���� �л����� ǥ���ϴ� ������ �ۼ��Ͻÿ�. 

SELECT * FROM TB_GRADE;

SELECT STUDENT_NO, POINT
FROM TB_GRADE
WHERE TERM_NO = '200402' AND CLASS_NO = 'C3118100'
ORDER BY POINT DESC, STUDENT_NO ASC;

-- 6. �л� ��ȣ, �л� �̸�, �а� �̸��� �л� �̸����� �������� �����Ͽ� ����ϴ� SQL���� �ۼ��Ͻÿ�.

--SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME 
--FROM TB_STUDENT JOIN TB_DEPARTMENT ;

SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
FROM TB_STUDENT JOIN TB_DEPARTMENT ON TB_STUDENT.DEPARTMENT_NO = TB_DEPARTMENT.DEPARTMENT_NO
ORDER BY STUDENT_NAME ASC;

-- 7. �� ������б��� ���� �̸��� ������ �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
SELECT * FROM TB_DEPARTMENT;
SELECT * FROM TB_CLASS;

SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS JOIN TB_DEPARTMENT USING(DEPARTMENT_NO);

-- 8. ���� ���� �̸��� ã������ �Ѵ�. ���� �̸��� ���� �̸��� �����ϴ� SQL ���� �ۼ��Ͻÿ�. 

SELECT CLASS_NAME, PROFESSOR_NAME 
FROM TB_CLASS JOIN TB_PROFESSOR USING(DEPARTMENT_NO);

-- 9. 8���� ��� �� '�ι���ȸ' �迭�� ���� ������ ���� �̸��� ã������ �Ѵ�. �̿� �ش��ϴ� ���� �̸��� ���� �̸��� ����ϴ� SQL ���� �ۼ��Ͻÿ�. 

SELECT CLASS_NAME, PROFESSOR_NAME 
FROM TB_CLASS JOIN TB_PROFESSOR USING(DEPARTMENT_NO)
              JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
              JOIN TB_CLASS_PROFESSOR USING(CLASS_NO)
WHERE CATEGORY = '�ι���ȸ';

-- 10. '�����а�' �л����� ������ ���Ϸ��� �Ѵ�. �����а� �л����� "�й�", "�л� �̸�", "��ü ����"�� ����ϴ� SQL ������ �ۼ��Ͻÿ�.
-- ��, ������ �Ҽ��� 1�ڸ������� �ݿø��Ͽ� ǥ���Ѵ�. 

SELECT STUDENT_NO �й�, STUDENT_NAME "�л� �̸�", ROUND(AVG(POINT),1) "��ü ����"
FROM TB_STUDENT JOIN TB_GRADE USING(STUDENT_NO)
                JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE DEPARTMENT_NAME = '�����а�'
GROUP BY STUDENT_NO, STUDENT_NAME
ORDER BY STUDENT_NO;


