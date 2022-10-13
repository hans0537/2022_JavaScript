--console.log(1 + '1')   -- '11'

-- 묵시적 형변환 (자동 형변환)
SELECT 1 + '1' FROM dual;

SELECT 1 + to_number('1') FROM dual;
-- 묵시적 형변환은 편한것 같지만, 
-- 튜닝에서 뜻하지 않은 성능저하를 가져올수 있다.

SELECT 1 + 'A' FROM dual; -- 에러

-- 명시적 형변환 함수들..

-- TO_CHAR 함수 (날짜 -> 문자)

SELECT
	SYSDATE,
	TO_CHAR(SYSDATE, 'YYYY') 연도4자리,
	TO_CHAR(SYSDATE, 'YY') 연도2자리,
	TO_CHAR(SYSDATE, 'YEAR') 연도영문
FROM dual;

SELECT
	TO_CHAR(SYSDATE, 'MM') 월2자리,
	TO_CHAR(SYSDATE, 'MON') 월3자리,
	TO_CHAR(SYSDATE, 'MONTH') 월전체,
	TO_CHAR(SYSDATE, 'month') 월전체,
	TO_CHAR(SYSDATE, 'Month') 월전체,
	TO_CHAR(SYSDATE, 'Month', 'NLS_DATE_LANGUAGE=ENGLISH') 월전체
FROM dual;

SELECT
	TO_CHAR(SYSDATE, 'DD') 일숫자2자리,
	TO_CHAR(SYSDATE, 'DDTH') 몇번째날,
	TO_CHAR(SYSDATE, 'DAY') 요일,
	TO_CHAR(SYSDATE, 'Dy') 요일앞자리
FROM dual;

SELECT 
	TO_CHAR(SYSDATE, 'HH24') 시24hr,
	TO_CHAR(SYSDATE, 'HH')  시12hr,
	TO_CHAR(SYSDATE, 'MI') 분,
	TO_CHAR(SYSDATE, 'SS') 초
FROM dual;

-- #4301
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS') 날짜
FROM dual;


SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY"년"MM"월"DD"일" HH24"시"MI"분"SS"초"') 날짜
FROM dual;

-- #4302
SELECT name, to_char(birthday, 'YYYY-MM-DD') 생일
FROM T_STUDENT WHERE to_char(birthday, 'MM') = '03';


