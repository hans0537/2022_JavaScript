-- 집합 연산자 SET Operator

SELECT studno, name, deptno1
FROM t_student 
WHERE deptno1 = 101;

SELECT profno, name, deptno
FROM t_professor
WHERE deptno = 101;

-- UNION 으로 합치기
SELECT studno, name, deptno1
FROM t_student 
WHERE deptno1 = 101
UNION
SELECT profno, name, deptno
FROM t_professor
WHERE deptno = 101;

-- UNION ALL 으로 합치기
SELECT studno, name, deptno1
FROM t_student 
WHERE deptno1 = 101
UNION ALL
SELECT profno, name, deptno
FROM t_professor
WHERE deptno = 101;

-- 위 두 쿼리 결과에서 UNION 은 정렬되어 나타났고,  오른쪽은 그렇지 않았다.

-- #3202)  UNION 을 사용하여
-- t_student 에서 제1전공(deptno1)이 101번학과인 학생과
-- 제2전공(deptno2)이 201번 학과를 전공하는 학생들의 이름을 모두 출력

SELECT name FROM t_student WHERE deptno1 = 101
UNION
SELECT name FROM t_student WHERE deptno2 = 201
;
-- ↑ UNION 은 중복값 제거. 중복되는 서진수는 한번만 SELECT 된다.

SELECT name FROM t_student WHERE deptno1 = 101
UNION ALL
SELECT name FROM t_student WHERE deptno2 = 201
;
-- ↑ 중복되는 서진수. 두번 다 SELECT 된다.

-- 에러: 컬럼 개수 다름!
SELECT name, grade FROM t_student WHERE deptno1 = 101
UNION
SELECT name FROM t_student WHERE deptno2 = 201;

-- 에러: 데이터 타입이 다르다
SELECT grade FROM t_student WHERE deptno1 = 101
UNION
SELECT name FROM t_student WHERE deptno2 = 201;


--  #3202)  INTERSECT 을 사용
-- t_student 에서 제1전공(deptno1)이 101번, 
-- 그리고 제2전공(deptno2)이 201번 을 복수 전공하는 학생들의 이름을 모두 출력
SELECT name FROM t_student WHERE deptno1 = 101
INTERSECT
SELECT name FROM t_student WHERE deptno2 = 201
;

-- #3203) MINUS 사용
--t_professor 교수님들의
--급여를 20% 인상하기 위한 명단(이름, 직급)을 출력
--단, 직급인 전임강사인 사람은 제외

-- 전체명단
SELECT name, position
FROM t_professor
MINUS
SELECT name, position
FROM t_professor
WHERE POSITION = '전임강사'
;








