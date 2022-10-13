-- 아래의 요구사항을 검토하여 제시된 데이터베이스를 설계하세요
--
-- [요구사항]
--    a. 학생 은 '학생고유번호(PK)', '학생이름', '나이', '학년', '전공학과번호(FK)' 의 속성을 갖습니다 
--
--      1) '학생이름'은 필수입니다
--      2) '나이' 는 0 이상의 정수입니다. 
--      3) '학년'은 1~4 까지의 숫자값만 갖습니다.
--
--    b. 학과 는 '학과고유번호(PK)', '학과명', '건물동번호' 의 속성을 갖습니다.
--       1) '학과명'은 필수 속성이며 고유해야 합니다.
--       2) '건물동번호' 는  'K301', 'A203', 'B306' 세가지중 하나의 값을 갖습니다
--
-- [문제]
--     a. 위 요구사항을 구현할 물리적 설계 (DDL) 을 작성하세요
--         - 테이블명과 컬럼명은 아래와 같이 작성하세요
--	   b. 위 테이블에 학과 3개와 학생 5명의 데이터를 INSERT 하는 쿼리 (DML) 을 작성하세요 
--
-- [학생테이블 (TEST_STUDENT) ]
--
--	학생고유번호	stu_uid
--	학생이름		stu_name
--	나이			stu_age
--	학년			stu_grade
--	전공학과번호	dept_uid
--
-- [학과테이블 (TEST_DEPARTMENT) ]
--
--	학과고유번호	dept_uid
--	학과명		dept_name
--	건물동번호		dept_build        

-- ↓ DDL 을 작성하세요

-- 학과 테이블 먼저 생성 (학생테이블 외래키 때문)
DROP TABLE TEST_DEPARTMENT CASCADE CONSTRAINT PURGE;
CREATE TABLE TEST_DEPARTMENT (
	dept_uid NUMBER PRIMARY KEY
	, dept_name VARCHAR2(20) UNIQUE NOT NULL 
	, dept_build VARCHAR(4) NOT NULL CHECK(dept_build IN ('K301', 'A203', 'B306'))
);

DROP TABLE TEST_STUDENT CASCADE CONSTRAINT PURGE;
CREATE TABLE TEST_STUDENT (
	stu_uid NUMBER PRIMARY KEY
	, stu_name VARCHAR2(10) NOT NULL
	, stu_age int CHECK(stu_age >= 0)
	, stu_grade NUMBER(1) CHECK(stu_grade IN (1, 2, 3 ,4))
	, dept_uid NUMBER REFERENCES TEST_DEPARTMENT(dept_uid)
);



SELECT * FROM test_student;
SELECT * FROM TEST_DEPARTMENT;
-- ↓ DML 을 작성하세요

INSERT INTO TEST_DEPARTMENT VALUES(
	1001, '컴퓨터공학과', 'K301'
);
INSERT INTO TEST_DEPARTMENT VALUES(
	1002, '기계공학과', 'A203'
);
INSERT INTO TEST_DEPARTMENT VALUES(
	1003, '경영학과', 'B306'
);


INSERT INTO TEST_STUDENT VALUES(
	101, '박윤수', 24, 1, 1001
);
INSERT INTO TEST_STUDENT VALUES(
	102, '김선경', 33, 4, 1001
);
INSERT INTO TEST_STUDENT VALUES(
	103, '신성주', 26, 3, 1002
);
INSERT INTO TEST_STUDENT VALUES(
	104, '백태인', 26, 2, 1003
);
INSERT INTO TEST_STUDENT VALUES(
	105, '진윤석', 20, 4, 1003
);

