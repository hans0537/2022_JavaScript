
SELECT
	SYSDATE "오늘"
	, SYSDATE + 1 "내일"
	, SYSDATE - 2 "그저께"
	, SYSDATE + 1/24 "1시간뒤"
FROM dual;

-- 일 차이 계산
SELECT
	SYSDATE "오늘"
	, SYSDATE - TO_DATE('2022-07-26', 'YYYY-MM-DD') "수업시작한지"
FROM dual;

-- 개월수 차이 : MONTHS_BETWEEN() 
SELECT
	MONTHS_BETWEEN(TO_DATE('2012-03-01', 'YYYY-MM-DD'), TO_DATE('2012-01-01', 'YYYY-MM-DD')) "양수"
	, MONTHS_BETWEEN(TO_DATE('2012-01-01', 'YYYY-MM-DD'), TO_DATE('2012-03-01', 'YYYY-MM-DD')) "음수"
	, MONTHS_BETWEEN(TO_DATE('2012-02-29', 'YYYY-MM-DD'), TO_DATE('2012-02-01', 'YYYY-MM-DD')) "2/29-2/01"
	, MONTHS_BETWEEN(TO_DATE('2012-04-30', 'YYYY-MM-DD'), TO_DATE('2012-04-01', 'YYYY-MM-DD')) "4/30-4/01"
FROM dual;

-- #4501
-- professor 테이블에서 오늘(SYSDATE)을 기준으로 
-- 근속연, 근속개월, 근속일를 계산해서 출력
-- 출력양식은 YYYY-MM-DD 로
-- 근속월, 근속일은 반올림 하여 소수점 1자리까지 표현
SELECT 
		name
		, TO_CHAR(SYSDATE, 'YYYY-MM-DD') 오늘
		, TO_CHAR(HIREDATE , 'YYYY-MM-DD') 입사일
		, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE) / 12) 근속연수 
		, ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE), 1) 근속개월 
		, ROUND(SYSDATE - HIREDATE, 1) 근속일 
FROM
		T_PROFESSOR;