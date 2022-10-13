-- JOIN
-- FROM 절의 테이블에도 별명(alias) 를 줄수 있다

-- 20 레코드
SELECT s.STUDNO, s.name, s.DEPTNO1, grade
FROM t_student s
;

-- 12 레코드
SELECT d.deptno, d.dname
FROM t_department d
;

-- 카티션곱 (Cartesian Product)
-- 두개의 테이블을 JOIN 하게 되면, 
-- 각 테이블의 레코드들의 모든 조합이 출력된다.
-- WHERE 나 ON 등으로 JOIN 조건이 주어지지 않으면 
-- 모든 카티션곱이 출력된다. 

-- 240개 = 20 x 12
SELECT 
	s.STUDNO, s.NAME, s.DEPTNO1,
	d.DEPTNO, d.DNAME
FROM t_student s, t_department d; -- Oracle JOIN 구문

SELECT 
	s.STUDNO, s.NAME, s.DEPTNO1,
	d.DEPTNO, d.DNAME
FROM t_student s CROSS JOIN t_department d; -- ANSI SQL 구문

-- 위의 카티션 곱에서 조건을 주면 원한는 레코드만 추출 가능.

-----------------------------------------------------------------------------------
-- Equi Join (등가 Join)
-- 일반적으로 많이 쓰이는 Join 이며, 양쪽 테이블 Join 한 카티션곱에서 ‘같은조건’이 존재할 경우만 값을 가져오는 것

-- 예) #6101 
-- t_student 테이블과 t_department 테이블을 사용하여 학생이름, 1전공 학과번호, 1전공 학과 이름을 출력하세요

-- ANSI 구문
SELECT 
		s.NAME 학생이름
		, s.DEPTNO1 학과번호
		, d.DNAME 학과이름 
FROM T_STUDENT s 
	JOIN T_DEPARTMENT d ON s.DEPTNO1 = d.DEPTNO ;

-- ORACLE JOIN 구문
SELECT 
		s.NAME 학생이름
		, s.DEPTNO1 학과번호
		, d.DNAME 학과이름 
FROM T_STUDENT s, T_DEPARTMENT d
WHERE s.DEPTNO1 = d.DEPTNO ;

-- 제2전공은?
-- ★ null 은 join 조건에 참여 안함.
SELECT s.name "학생이름", s.deptno2 "제2전공번호", d.dname "제2전공이름"
FROM T_STUDENT s, T_DEPARTMENT d
WHERE s.deptno2 = d.deptno;

-- #6102
-- t_student 테이블, t_professor 테이블 을 join하여 
-- ‘학생이름’, ‘지도교수번호’, ‘지도교수이름’ 을 출력하세요

-- ORACLE
SELECT s.name 학생이름, s.PROFNO 지도교수번호, p.name 지도교수이름
FROM T_STUDENT s, T_PROFESSOR p
WHERE s.PROFNO = p.PROFNO;

-- ANSI
SELECT s.name 학생이름, s.PROFNO 지도교수번호, p.name 지도교수이름
FROM T_STUDENT s 
	JOIN T_PROFESSOR p ON s.PROFNO = p.PROFNO;

--#6103
-- 3테이블을 JOIN
-- t_student, t_department, t_professor 테이블 을 join 하여 
--  학생의 이름, 학과이름, 지도교수 이름  을 출력하세요

-- 3개 테이블 join  ORACLE 구문
SELECT s.name, d.DNAME, p.NAME
FROM T_STUDENT s, T_DEPARTMENT d, T_PROFESSOR p
WHERE s.DEPTNO1 = d.DEPTNO AND s.PROFNO = p.PROFNO 

-- ANSI
SELECT s.name, d.DNAME, p.NAME
FROM 
	T_STUDENT s
	JOIN T_DEPARTMENT d ON s.DEPTNO1 = d.DEPTNO
	JOIN T_PROFESSOR p ON s.PROFNO = p.PROFNO;

-- #6104
-- t_emp2 테이블과 t_post 테이블을 조회하여 
-- 사원의 이름과 직급, 현재연봉, 
-- 해당직급의 연봉의 하한금액(s_pay)과 
-- 상한금액(e_pay)을 출력하세요SELECT e.name 사원이름, e.post 현재 , e.pay 현재연봉, p.S_PAY 하한금액, p.E_PAY 상한금액 
FROM T_EMP2 e, T_POST p
WHERE e.post = p.post;

SELECT e.name 사원이름, e.post 현재 , e.pay 현재연봉, p.S_PAY 하한금액, p.E_PAY 상한금액 
FROM T_EMP2 e
	JOIN T_POST p ON e.post = p.post;

-- #6105
-- t_student - t_professor 테이블 join 하여 
-- 제1전공(deptno1) 이 101번인 학생들의 
-- 학생이름과 지도교수 이름을 출력하세요

-- ORACLE 구문
SELECT s.NAME "학생이름", p.NAME "교수이름"
FROM T_STUDENT s,T_PROFESSOR p
WHERE 
	s.PROFNO = p.PROFNO -- JOIN 조건
	AND s.DEPTNO1 = 101 -- 일반 검색 조건  (위 Join 조건보다 먼저 수행 --> 카티션 곱의 크기를 줄일수 있다)

-- ANSI 구문
SELECT s.NAME "학생이름", p.NAME "교수이름"
FROM T_STUDENT s
	JOIN T_PROFESSOR p ON s.PROFNO = p.PROFNO
WHERE 	 
	s.DEPTNO1 = 101
;

SELECT s.NAME "학생이름", p.NAME "교수이름"
FROM T_STUDENT s
	JOIN T_PROFESSOR p ON s.PROFNO = p.PROFNO AND s.DEPTNO1 = 101
;










