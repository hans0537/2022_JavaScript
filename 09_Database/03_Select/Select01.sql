-- dual 은 row 1개짜리 dummy table
SELECT 'abcde' FROM DUAL;

SELECT 100, 200, 100*2 FROM dual;

-- 이클립스 단축키 사용
-- Lower case: CTRL+SHIFT+Y
-- Upper case: CTRL+SHIFT+X


-- SELECT - 데이터 조회/질의
-- SELECT [컬럼명 또는 표현식] FROM [테이블명, 뷰명]

-- ‘모든 컬럼’ 조회  :  * 사용 
SELECT * FROM t_emp;

-- 원하는 컬럼만 조회
SELECT empno, ename FROM t_emp;

-- 순서, 갯수 무관
SELECT ename, empno, job, job, job FROM t_emp;

-- 표현식 사용하여 출력
SELECT name FROM T_PROFESSOR;

SELECT name, '교수님 싸랑해요' FROM T_PROFESSOR;

-- 컬럼 별칭(alias) 사용하여 출력
SELECT studno 학번, name 이름 FROM T_STUDENT;

-- " " 쌍따옴표, AS 사용 가능
SELECT studno "학생 학번", name AS 이름 FROM T_STUDENT;

SELECT HEIGHT, NAME 
FROM T_STUDENT;


-- 연습1
-- t_emp 테이블에서  empno 를 '사원번호',  
-- ename을 '사원명',  
-- job을 '직업'으로 별명을 설정하여 출력
 
 SELECT empno 사원번호, ename 사원명, job 직업 FROM T_EMP;

-- tdept 테이블을 사용하여 deptno를 '부서#',
-- dname을 '부서명',
-- loc를 '위치' 로 별명을 설정하여 출력

SELECT deptno 부서#, dname 부서명, loc 위치 FROM T_DEPT;

-- DISTINCT - 중복값 제거하고 출력
-- SELECT  DISTINCT [컬럼명 또는 표현식] FROM [테이블명, 뷰명] ;
SELECT DISTINCT deptno FROM T_EMP;

-- DISTINCT 연습
-- 학생테이블(t_student) 에서
-- 제1전공 (deptno1) 을 중복값을 제거하여 출력해보기
SELECT DISTINCT deptno1 FROM T_STUDENT ;

-- 직원(t_emp) 들의 직책(job) 을 중복값 제거하여 출력해보기
SELECT DISTINCT job FROM T_EMP ;

-- ||  :  필드, 문자열 연결
SELECT name, POSITION FROM t_professor;

SELECT name || '-' || POSITION FROM t_professor;

-- 학생테이블(t_student)를 사용하여 
-- 모든 학생들이 
-- ‘서진수의 키는 180cm, 몸무게는 55kg 입니다’ 
-- 와 같은 형식으로 출력되도록 문자를 추가하고, 
-- 칼럼 이름은 ‘학생의 키와 몸무게’ 라는 별명으로 출력하세요	

SELECT 
	NAME || '의 키는 ' || HEIGHT || 'cm, ' || 
		'몸무게는 ' || WEIGHT || 'kg 입니다' "학생의 키와 몸무게" 
FROM 
	T_STUDENT ;








