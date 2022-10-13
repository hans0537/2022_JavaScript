-- 산술연산자 
-- + , - , * , / 

-- 직원이름(ename), 급여(sal), 급여10%인상분
SELECT 
	ENAME, SAL, sal * 1.1 AS "10% 인상"
FROM 
	T_EMP;
	
-- WHERE : 원하는 조건만 검색

-- SELECT [컬럼명 또는 표현식] 
-- FROM [테이블명, 뷰명]  
-- WHERE [조건절] ;

-- 직원 테이블(t_emp) 에서 직책(job)이 salesman 인 사람만 조회 
-- 저장된 문자열 데이터는 대소문자 구별

SELECT * FROM t_emp WHERE job = 'SALESMAN';

-- 직원 테이블(t_emp) 에서 10번 부서(deptno)에 근무하는 직원의  
-- 원의 이름(ename)과 급여(sal)와 부서번호(deptno) 출력
 SELECT ename, sal, deptno
 FROM t_emp
 WHERE deptno = 10;
 
--직원 테이블(t_emp) 에서 급여(sal) 가 2000보다 큰 사람의
--이름(ename)과 급여(sal)를 출력하세요
 SELECT ename, sal
 FROM T_EMP 
 WHERE sal > 2000;
 
--직원 테이블(t_emp) 에서 이름이 SCOTT인 사람의
--이름(ename)과 사원번호(empno), 급여(sal) 출력
SELECT ename, empno, sal
FROM T_EMP 
WHERE ename = 'SCOTT';

-- 학생 테이블(t_student) 에서
-- 2,3 학년(grade) 학생의  이름(name), 학년(grade) 출력
SELECT name, grade
FROM T_STUDENT 
WHERE grade = 2 OR grade = 3;

SELECT name, grade
FROM T_STUDENT 
WHERE grade IN (2, 3);

SELECT name, grade
FROM T_STUDENT 
WHERE grade BETWEEN 2 AND 3;

-- 교수님 (t_professor) 중에서
-- 급여 (pay) 가 300 보다 크고,
-- 직급 (position) 이 '정교수' 인 분들의
-- 이름(name), 급여(pay), 직급(position) 을 출력하세요
SELECT name, pay, POSITION 
FROM T_PROFESSOR 
WHERE pay > 300 AND POSITION = '정교수';

-- 보너스(bonus)를 못받고 있는 
-- 교수님의 이름(name)과 직급(position)를 출력하세요
SELECT name, POSITION 
FROM T_PROFESSOR 
WHERE bonus IS NULL;

-- 주의!) null 값과 다른값과의 연산결과는 null 이다!!!
SELECT name, pay, bonus, pay + bonus
FROM T_PROFESSOR;

-- LIKE 와 같이 쓰는 와일드 카드  % ,  _
-- % : 글자수 제한 없고 어떤 글자가 와도 됨
-- _ : 글자수는 한글자가 반드시 와야 되고 어떤 글자 와도 좋음
	
-- 연습
-- 교수님 중에서 김씨 성을 가진 교수님의 이름만 출력 (LIKE 사용)
SELECT name FROM T_PROFESSOR WHERE name LIKE '김%';

-- 직원 테이블(t_emp)에서 직원이름 (ename) 중에
-- NE 문자열이 포함된 직원만 출력
SELECT ename FROM t_emp WHERE ENAME LIKE '%NE%';

-- 직원 테이블(t_emp)에서 직원이름 (ename) 중에
-- 두번째 글자가 'A' 인 사람의 이름(ename)만 출력
SELECT ename FROM t_emp WHERE ename LIKE '_A%';

---------------------------------

-- ORDER BY
-- 직원중 이름에 L 이 들어간 사람의 이름을 사전내림차순으로 출력하기
SELECT ename FROM t_emp 
WHERE ename LIKE '%L%' 
ORDER BY ename DESC; 

-- 직원의 이름,직책, 급여를 출력하되
-- 우선은 직책(job) 사전 내림차순으로, 
-- 그리고 급여(sal) 오름차순으로 출력
SELECT ename, job, sal 
FROM t_emp
ORDER BY job DESC, sal ASC;

-- 연습
-- 학생 테이블(t_student) 에서  학생의 이름(name)과 학년(grade)와 키(height)를 출력하세요, 
-- 단 학년은 1학년부터 출력하고,  키는 큰사람부터  출력하세요
SELECT name, grade, height FROM T_STUDENT
ORDER BY grade ASC, HEIGHT DESC;
































