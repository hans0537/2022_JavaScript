SELECT 
	name, pay, bonus, pay + bonus
FROM t_professor;

-- nvl() 함수

SELECT 
	name, pay, bonus, pay + nvl(bonus, 0)
FROM t_professor;

SELECT name, hiredate
FROM T_PROFESSOR ;

-- #4201
-- t_professor 테이블 : 
-- 101번 학과 교수들의 이름(name), 급여(pay), 보너스(bonus ), "연봉" 출력하기.
-- "연봉"은 pay * 12 + bonus 로 계산,  bonus 가 없는 교수는 0 으로 계산	
SELECT name, pay, nvl(bonus, 0) BONUS,
	(pay * 12 + nvl(bonus, 0)) "연봉"
FROM t_professor WHERE deptno = 101;

-- nvl2() 사용
SELECT name, pay, nvl(bonus, 0) BONUS,
	nvl2(bonus, pay * 12 + bonus, pay * 12) "연봉"
FROM t_professor WHERE deptno = 101;
