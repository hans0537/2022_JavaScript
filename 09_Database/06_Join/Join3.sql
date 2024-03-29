SELECT * FROM t_emp;
SELECT * FROM T_DEPT;

SELECT t_emp.deptno, t_emp.empno, t_emp.ename, t_dept.dname
FROM t_emp INNER JOIN t_dept
ON t_emp.deptno = t_dept.deptno
;

-- NATURAL JOIN 은 두 테이블 간의 동일한 이름을 갖는 모든 컬럼들에 대해
-- EQUI JOIN 수행한다
-- NATURAL JOIN 이 수행되면, 추가로 USING 조건절, ON 조건절, WHERE 조건절에서
-- JOIN 조건을 정의할수 없다.
-- (** MS SQL Server 는 지원안함)


-- 사원 번호와 사원 이름， 소속부서 코드와 소속부서 이름을 찾아본다
-- #6301
-- t_emp, t_dept 테이블에서  
-- 사원번호, 사원이름， 
-- 소속부서코드, 소속부서 이름 출력 
-- 부서번호(deptno), 직원번호(empno) 오름차순 정렬

SELECT deptno, empno, ename, dname
FROM t_emp NATURAL JOIN t_dept
ORDER BY deptno, empno
;

-- 위에서는 비록 별도의 JOIN 조건 컬럼을 지정하지 않았으나
-- deptno 가 공통칼럼으로 '자동으로' 인식하여 JOIN 처리

-- 사실상 아래와 같으나.  NATURAL JOIN 에는  JOIN 조건 절이 없다.
SELECT e.deptno, empno, e.ename, d.dname 
FROM t_emp e, t_dept d
WHERE e.deptno = d.deptno
ORDER BY empno;

-- JOIN 에 사용된 컬럼 들은 같은 데이터 유형이어야 한다.
-- ALIAS 나 테이블 명과 같은 접두어 줄수 없다
 
-- #6302
SELECT t_emp.deptno, empno, ename, dname
FROM t_emp NATURAL JOIN t_dept
;
-- ORA-25155: column used in NATURAL join cannot have qualifier

-- -----------------------------------------------------------
-- 임시테이블 
CREATE TABLE dept_temp
AS
SELECT * FROM t_dept;

SELECT * FROM dept_temp;

-- #6306
UPDATE dept_temp SET dname = 'R&D' WHERE dname = 'RESEARCH';
UPDATE dept_temp SET dname = 'MARKETING' WHERE dname = 'SALES';

SELECT * FROM dept_temp;
SELECT * FROM t_dept;
-- ↑ 위 두 테이블은 컬럼이름은 같고, 20, 30번 부서의 내용만 서로 다르다.

-- #6307
SELECT * FROM t_dept NATURAL JOIN dept_temp;
-- 그 결과 NATURAL JOIN 하게 되면 20, 30번 부서만 JOIN 에서 빠진다.

-- INNER JOIN 의 경우
SELECT * FROM t_dept, dept_temp
WHERE t_dept.DEPTNO = dept_temp.deptno
AND t_dept.dname = dept_temp.dname AND t_dept.loc = dept_temp.loc;

---------------------------------------------------------------------------------
-- USING 조건절

-- NATURAL JOIN에서는 모든 일치되는 칼럼들에 대해 JOIN이 이루어지지만 
-- FROM 절의 USING 조건절을 이용하면 같은 이름을 가진 칼럼들 중에서 원하는 칼럼에 대해서만 선택적으로 EQUI JOIN을 할 수가 있다. 다만， 이 기능은 SQL Server에서는 지원하지 않는다. 

SELECT * FROM t_dept JOIN dept_temp USING (deptno);

-- 위 SQL의 ’*’ 와일드카드처럼 별도의 칼럼 순서를 지정하지 않으면 
-- USING 조건절의 기준이 되는 칼럼이 다른 칼럼보다 먼저 출력된다 
-- (ex: DEPTNO가 첫 번째 칼럼이 된다 ) 
-- 이때 USING JOIN은 JOIN에 사용된 같은 이름의 칼럼을 하나로 처 리한다 
 

-- [예제]
-- USING 조건절을 이용한 EQUI JOIN에서도 NATURAL JOIN과 마찬가지로 
-- JOIN 칼럼에 대해서는 ALIAS나 태이블 이름과 같은 접두사를 붙일 수 없다 (DEPT.DEPTNO • DEPTNO) ·

-- 에러! : USING 절의 열 부분은 식별자를 가질수 없다.
SELECT t_dept.DEPTNO, t_dept.dname, t_dept.loc, dept_temp.dname, dept_temp.loc
FROM t_dept JOIN dept_temp USING (deptno);

-- USING의 컬럼 식별자 제거하면 OK!!
SELECT DEPTNO, t_dept.dname, t_dept.loc, dept_temp.dname, dept_temp.loc
FROM t_dept JOIN dept_temp USING (deptno);

-- #6312
SELECT *
FROM t_dept JOIN dept_temp USING (deptno);

SELECT *
FROM t_dept JOIN dept_temp USING (loc, deptno);
-- loc, deptno 컬럼이 맨 앞에 딱 한번 select 됨. JOIN 에 참여하지 않은 dname 컬럼은 중복되어 select

SELECT *
FROM t_dept JOIN dept_temp USING (deptno, dname);
-- 위 SQL의 경우 DNAME의 내용이 바뀐 부서번호 20, 30의 경우는 결과에서 제외된 것을 알 수 있다. 
-- 그리고 USING에 사용된 DEPTNO, DNAME이 첫 번째， 
-- 두 번째 칼럼으로 출력된 것과 함께， JOIN 조건에 참여하지 않은 LOC가 2개의 칼럼으로 표시된 것을 알 수 있다 













