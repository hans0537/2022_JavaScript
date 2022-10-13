-- SELECT 결과물중 맨 위의 5개만 출력해보고 싶으면 어케 해야 하나?
-- SELECT 결과물중 n 번째 부터 m 개를 출력하고 싶다면?
--   ex) 게시판.. 페이징

-- DBMS 마다 구현 방법 다름
--	MYSQL : LIMIT
-- 	MS SQL server : TOP
-- 	ORACLE : ROWNUM 

SELECT empno, ename, sal FROM t_emp;

-- SELECT 시 ORACLE 에서 붙여주는 행번호(ROWNUM)
SELECT ROWNUM, empno, ename, sal FROM t_emp;

-- 직원번호 역순에 ROWNUM
SELECT ROWNUM, empno, ename, sal FROM t_emp ORDER BY empno DESC;

-- 상위 5개만 SELECT 하기
SELECT ROWNUM, empno, ename, sal FROM t_emp 
WHERE ROWNUM <= 5
ORDER BY empno DESC;

-- 굳이 ROWNUM 을 SELECT 하지 않아도 ROWNUM 은 존재
SELECT empno, ename, sal FROM t_emp 
WHERE ROWNUM <= 5
ORDER BY empno DESC;

-- ROWNUM 은 SELECT 이후 붙여진다
-- 이후 ORDER BY 를 하면 순서가 망가질수 있다.
SELECT ROWNUM, empno, ename, sal 
FROM t_emp 
WHERE ROWNUM <= 5
ORDER BY sal DESC
;

-- ROWNUM 범위가 1을 포함하지 않으면 안되나?
SELECT ROWNUM, empno, ename, sal 
FROM t_emp 
WHERE ROWNUM > 5  --  안된다?? 왜???
ORDER BY empno DESC
;

-- 상위 5개 출력 (1 페이지)
-- 1행 부터 5행 까지 출력
SELECT ROWNUM, empno, ename, sal 
FROM t_emp 
WHERE ROWNUM >= 1 AND ROWNUM < 6
ORDER BY EMPNO DESC
;

-- 6행 부터 10행 까지 출력 (2 페이지)
SELECT ROWNUM, empno, ename, sal 
FROM t_emp 
WHERE ROWNUM >= 6 AND ROWNUM < 11
ORDER BY EMPNO DESC
;

-- ---------------------------------------------------------------
SELECT T.*
FROM(SELECT empno, ename, sal FROM t_emp ORDER BY empno DESC) T
;

SELECT ROWNUM AS RNUM, T.*
FROM(SELECT empno, ename, sal FROM t_emp ORDER BY empno DESC) T
;

-- 완성
-- Inline View 와 Rownum 활용
SELECT * FROM
(
	SELECT ROWNUM AS RNUM, T.*
	FROM(SELECT empno, ename, sal FROM t_emp ORDER BY empno DESC) T
)
--WHERE RNUM >= 6 AND RNUM < 11 -- 2페이지
WHERE RNUM >= 11 AND RNUM < 16 	-- 3페이지
;

-- #################################################################
-- ROW_NUMBER() OVER (ORDER BY 정렬컬럼1, ... )
-- 특정 컬럼의 값을 기준으로 정렬한뒤 순서 매기기
-- 사용법
-- SELECT ROW_NUMBER() OVER (ORDER BY 정렬컬럼1, ... ), 서브쿼리컬럼 FROM 서브쿼리
-- 

SELECT ROW_NUMBER() OVER (ORDER BY sal DESC) AS RNUM, T.*
FROM (SELECT empno, ename, sal FROM t_emp ORDER BY empno DESC) T
;

-- ########################################
-- RANK() OVER (ORDER BY 정렬컬럼1, ... )

-- 학생 점수
SELECT s.name, e.total
FROM t_student s, t_exam01 e
WHERE s.studno = e.studno;

-- ROW_NUMBER() 붙이기
SELECT ROW_NUMBER() OVER (ORDER BY total DESC) AS RNUM, T.*
FROM (
	SELECT s.name, e.total
	FROM t_student s, t_exam01 e
	WHERE s.studno = e.studno
) T
;

-- ROW_NUMBER() 는 '출력순서'
-- RANK() 는 '순위 통계'

SELECT 
	ROW_NUMBER() OVER (ORDER BY total DESC) AS RNUM
	, RANK() OVER (ORDER BY total DESC) AS RANK
	, T.*
FROM (
	SELECT s.name, e.total
	FROM t_student s, t_exam01 e
	WHERE s.studno = e.studno
) T
;















