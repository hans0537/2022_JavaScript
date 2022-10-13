-- view

-- 특정 계정이 view 생성 가능한지 권한 확인
-- ★SYSTEM 계정으로 확인
SELECT PRIVILEGE  -- 해피함 ♡♡♡
FROM DBA_SYS_PRIVS
WHERE GRANTEE = 'SCOTT726'
;

-- #8101)
-- t_professor 테이블의 profno, name, email, hpage 칼럼만 
-- 사용하는 view를 생성하세요 view 의 이름은 v_prof로 하세요

CREATE OR REPLACE VIEW v_prof 
AS
SELECT profno, name, email, hpage
FROM t_professor;

SELECT * FROM v_prof;

-- View 생성시 별도의 컬럼 이름을 
CREATE OR REPLACE VIEW v_prof (pfno, nm, em, hp)
AS
SELECT profno, name, email, hpage
FROM t_professor;

SELECT tname FROM tab;

--#8102)  예제
--t_professor, t_department 테이블을 join 하여 
--교수번호와 교수이름과 소속학과 이름을 조회하는 view 를 생성하세요.  
--(이름: v_prof_dept)

CREATE OR REPLACE VIEW v_prof_dept 
AS
SELECT p.PROFNO 교수번호, p.NAME 교수이름, d.DNAME 소속학과
FROM T_PROFESSOR p, T_DEPARTMENT d
WHERE p.DEPTNO = d.DEPTNO;

SELECT * FROM v_prof_dept;

-- 인라인뷰
-- View 는 한번 만들어 놓으면 계속 사용할수 있습니다.
-- 그러나 1회용으로만 사용할 경우는 FROM 절의 서브쿼리 형태로 만들수 있습니다. 
-- 이러한 뷰를 Inline View 라 합니다.

--#8103) 예제
-- t_student, t_department 테이블 : 
-- 학과별로 학생들의 최대키와 최대몸무게, 학과 이름을 출력하세요

SELECT deptno1, MAX(height) max_height, MAX(weight) max_weight
FROM t_student
GROUP BY deptno1
;

SELECT
	d.dname "학과명",
	s.max_height "최대키",
	s.max_weight "최대몸무게"
FROM (
	SELECT deptno1, MAX(height) max_height, MAX(weight) max_weight
	FROM t_student
	GROUP BY deptno1
) s, t_department d
WHERE s.deptno1 = d.deptno
;

-- 도전: 위 쿼리를 스칼라 서브쿼리로 만든다면??
SELECT
	(SELECT dname FROM T_DEPARTMENT d WHERE s.deptno1 = d.deptno) "학과명", 
	MAX(s.height) "최대키",
	MAX(s.WEIGHT) "최대몸무게"
FROM T_STUDENT s
GROUP BY s.DEPTNO1
;

SELECT 
   d.dname "학과명"
   , (SELECT max(height) FROM t_student WHERE DEPTNO1 = d.DEPTNO) "최대키"
   , (SELECT max(weight) FROM t_student WHERE DEPTNO1 = d.DEPTNO) "최대몸무게"
FROM 
   t_department d
WHERE 
   0 < (SELECT count(*) FROM t_student WHERE deptno1 = d.deptno)
;












