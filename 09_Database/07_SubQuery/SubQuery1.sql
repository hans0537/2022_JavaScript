----------------------------------------
-- Sub Query

-- #7101
--t_emp 테이블에서 
-- scott 보다 급여를 많이 받는 사람의 이름과 급여 출력

SELECT ename, SAL 
FROM T_EMP
WHERE sal > (SELECT sal FROM t_emp WHERE ename = 'SCOTT');

-- #7102
-- t_student 테이블에서 가장 키 큰 학생의 '이름'과 '키'를 출력

SELECT name, height 
FROM T_STUDENT
WHERE height = (SELECT max(height) FROM t_student);

-- 1. 단일행 쿼리
-- 결과가 한개 1행만 나오는 것.
-- 단일행 Sub Query 의  WHERE 에서 사용되는 연산자
-- = , <> , >, >= , <, <= 

--#7103)연습
--t_student, t_department 테이블 사용하여
--이윤나 학생과 1전공(deptno1)이 동일한 학생들의
--이름(name)과 1전공이름(dname)을 출력하세요
  
SELECT s.NAME "학생이름", d.DNAME "1전공" 
FROM T_STUDENT s, T_DEPARTMENT d 
WHERE d.DEPTNO = s.DEPTNO1
	AND d.DEPTNO = (SELECT deptno1 FROM T_STUDENT WHERE name = '이윤나');

-- #7104) 연습
--t_professor, t_department 테이블 :
--입사일이 송도권 교수보다 나중에 입사한 사람의
--이름과 입사일, 학과명을 출력하세요

SELECT p.name 교수명, to_char(p.hiredate, 'YYYY-MM-DD') 입사일, d.DNAME 학과명  
FROM t_professor p, T_DEPARTMENT d
WHERE p.DEPTNO = d.DEPTNO 
	AND p.HIREDATE > (SELECT HIREDATE FROM T_PROFESSOR WHERE name = '송도권');

-- #7105) 연습
--t_student 테이블 :
--1전공이 101번인 학과의 평균 몸무게보다 몸무게가 많은 학생들의
--이름과 몸무게를 출력하세요
 SELECT name 이름, weight 몸무게
 FROM T_STUDENT
 WHERE weight > (SELECT avg(WEIGHT) FROM T_STUDENT WHERE DEPTNO1 = 101); 
           
--#7106) 연습
--t_professor 테이블에서
--심슨 교수와 같은 입사일에 입사한 교수 중,
--조인형 교수보다 월급을 적게 받는 교수의
--이름과 급여, 입사일을 출력하세요

SELECT name 이름, pay 급여, to_char(hiredate, 'YY/MM/DD') 입사일
FROM T_PROFESSOR 
WHERE HIREDATE = (SELECT hiredate FROM T_PROFESSOR WHERE name = '심슨')
	AND pay < (SELECT pay FROM t_professor WHERE name = '조인형');

-- 2. 다중행 쿼리
-- Sub Query 결과가 2건 이상 출력되는 것을 말합니다.
-- 다중행 Sub Query 와 함께 사용하는 연산자
--		 IN 같은 값을 찾음
--		>ANY 최소값을 반환함 (서브쿼리 결과중 가장작은것보다 큰 즉 서브쿼리 결과 어떤것보다 크면 됨) 
--		<ANY 최대값을 반환함 (서브쿼리 결과중 가장큰것보다 작은)
--		<ALL 최소값을 반환함 (서브쿼리 결과중 가장작은것보다 작은)
--		>ALL 최대값을 반환함 (서브쿼리 결과중 가장큰것보다 큰)
--		EXIST Sub Query 값이 있을 경우 반환


--#7107) 예제
--t_emp2, dept2 테이블 : 
--근무지역 (t_dept2.area) 이 서울 지사인 모든 사원들의 
--사번(empno)과 이름(name), 부서번호(deptno)를 출력하세요
SELECT * FROM t_dept2;

SELECT empno, name, deptno
FROM t_emp2
WHERE deptno IN (SELECT dcode FROM t_dept2 WHERE area = '서울지사')
;

-- #7108) 연습
--t_emp2 테이블 : 
--전체직원중 과장 직급의 최소연봉자보다 
--연봉이 높은 사람의 
--이름(name)과 직급(post), 연봉(pay)을 출력하세요.  
--단, 연봉 출력 형식은 천 단위 구분 기호와 원 표시를 하세요
SELECT name "이름", post "직급", to_char(pay, '999,999,999') 연봉
FROM t_emp2
WHERE pay > ANY (SELECT pay FROM t_emp2 WHERE post='과장');

-- #7109
SELECT name 이름, grade 학년, weight 몸무게
FROM T_STUDENT
WHERE WEIGHT < ALL (SELECT weight FROM T_STUDENT WHERE grade = 4)
;





