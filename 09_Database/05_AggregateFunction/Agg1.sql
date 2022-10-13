
-- ★ 그룹함수에서는 NULL 값은 (기본적으로) 계산에서 제외된다.
SELECT count(*), count(name), count(hpage) FROM t_professor;

SELECT * FROM t_professor; 

SELECT COUNT(bonus), SUM(bonus) FROM T_PROFESSOR;
SELECT AVG(bonus)FROM T_PROFESSOR; -- NULL 은 계산에 포함 안돼서 전체 평균이 아님

SELECT MAX(HIREDATE), MIN(HIREDATE) FROM T_EMP;

-- 교수님들의 보너스 평균값 출력 ( AVG() 사용)
-- 그룹함수는 null 값은 계산안하기 때문에
-- null 허용 필드에 대해 계산할때는 반드시 nvl, nvl2 사용해야 함.

SELECT 
	avg(BONUS),
	avg(nvl(bonus, 0))
FROM t_professor;

-- #####################################
-- GROUP BY

-- 학과별로 교수들의 평균 보너스 출력

-- 아래와 같이 ,  그룹함수와 그룹함수가 아닌 결과는 같이 SELECT 불가
SELECT deptno, avg(nvl(bonus,0))
FROM t_professor;

-- 그룹함수가 아닌 것을 GROUP BY 로 묶어주자
SELECT deptno, round(avg(nvl(bonus,0)),1) "보너스평균"
FROM t_professor
GROUP BY deptno;

SELECT deptno, POSITION, avg(pay) "평균급여"
FROM T_PROFESSOR
GROUP BY deptno, POSITION
ORDER BY deptno, POSITION;

-- 학과별 평균급여를 출력하되, 평균급여가 450 보다 많은 학과만 SELECT
SELECT deptno, avg(pay) "평균급여"
FROM t_professor
WHERE avg(pay) > 450  -- 에러!  ★ 그룹함수는 WHERE 조건절에서 사용 불가!
GROUP BY deptno
;

SELECT deptno, avg(pay) "평균급여"
FROM t_professor
GROUP BY deptno
HAVING avg(pay) > 300
;

-- <SELECT 쿼리문 순서>    <처리순서>
-- 	SELECT              - (5)
-- 	FROM                - (1)
-- 	WHERE               - (2)
-- 	GROUP BY            - (3)
-- 	HAVING              - (4)
--  ORDER BY            - (6)


-- #5102)연습
-- t_emp 테이블: 매니저별(MGR)로 관리하는 직원들의 
-- ‘매니저’, ‘직원수’와 ‘급여총액’과 ‘급여평균’과 ‘교통비 (COMM) 평균’ 지급액 을 출력하세요.  
-- 단 사장님은 (job = president)제외
SELECT 
		MGR 매니저
		, COUNT(ENAME) 직원수
		, SUM(SAL) 급여총액
		, AVG(SAL) 급여평균
		, AVG(NVL(COMM,0)) 교통비평균
FROM
		T_EMP
WHERE 
		job <> 'PRESIDENT'
GROUP BY
		MGR;
	
-- #5103
SELECT
		DEPTNO 
		, COUNT(*) 총인원
		, AVG(SYSDATE - HIREDATE) 근속평균
		, AVG(PAY) 급여평균
		, AVG(NVL(bonus,0)) 보너스평균
FROM T_PROFESSOR
WHERE POSITION IN ('정교수', '조교수')
GROUP BY deptno
--ORDER BY "보너스평균" DESC
ORDER BY 5 DESC;
-- #5104
SELECT 
		DEPTNO1 학과
		, MAX(WEIGHT) - MIN(WEIGHT) 최대최소몸무게차 
FROM T_STUDENT
GROUP BY DEPTNO1;

-- #5105
SELECT 
		DEPTNO1 학과
		, MAX(WEIGHT) - MIN(WEIGHT) 최대최소몸무게차 
FROM T_STUDENT
GROUP BY DEPTNO1
HAVING MAX(WEIGHT) - MIN(WEIGHT) >= 30;
