-- 비등가 조인 (Non-Equi Join)

-- #6201) 
-- t_customer 테이블, t_gift 테이블을 join 하여  
-- 고객의 마일리지 포인트별로 받을수 있는 상품을 조회하여 
-- 고객의 '이름(c_name)'과 포인트(c_point) 상품명(g_name)을 출력하세요
-- BETWEEN ~ AND ~ 사용

-- ORACLE
SELECT c.C_NAME 이름, c.C_POINT 포인트, g.G_NAME
FROM T_CUSTOMER c, T_GIFT g
WHERE c.C_POINT BETWEEN g.G_START AND g.G_END;

-- ANSI
SELECT c.C_NAME 이름, c.C_POINT 포인트, g.G_NAME
FROM T_CUSTOMER c 
	JOIN T_GIFT g ON c.C_POINT BETWEEN g.G_START AND g.G_END;

--  #6202) 연습 
-- 앞 예제에서 조회한 상품의 이름(gname)과 필요수량이 몇개인지 조회하세요
-- (그룹함수 동원되어야 한다)
-- ORACLE
SELECT g.G_NAME 상품명, count(*) 필요수량
FROM T_GIFT g, T_CUSTOMER c
WHERE c.C_POINT BETWEEN g.G_START AND g.G_END
GROUP BY g.G_NAME;

-- ANSI
SELECT g.G_NAME 상품명, count(*) 필요수량
FROM T_GIFT g
	JOIN T_CUSTOMER c ON c.C_POINT BETWEEN g.G_START AND g.G_END
GROUP BY g.G_NAME;

-----------------------------------
-- OUTER JOIN

-- #6206)
--t_student 테이블과 t_professor 테이블 Join : 
--학생이름과 지도교수 이름을 출력하세요. 
--단! 지도교수가 결정되지 않은 학생의 명단도 함께 출력하세요

--** 기존의 INNER Join 방식으로 먼저 만들어 보고 OUTER Join 을 해보고 비교해보자
SELECT s.name 학생이름, p.name 교수이름
FROM T_STUDENT s
	INNER JOIN T_PROFESSOR p ON s.PROFNO = p.PROFNO;

-- OUTER JOIN 은 ANSI 구문만 가능
SELECT s.name 학생이름, p.name 교수이름
FROM T_STUDENT s
	LEFT OUTER JOIN T_PROFESSOR p ON s.PROFNO = p.PROFNO;

-- #6207)
--t_student, t_professor 테이블 join :  
--학생이름과 지도교수 이름을 출력, 
--단! 지도 학생이 결정되지 않은 교수 명단도 출력

SELECT s.name 학생이름, p.name 교수이름
FROM T_STUDENT s
	RIGHT OUTER JOIN T_PROFESSOR p ON s.PROFNO = p.PROFNO;

-- #6208)
--t_student, t_professor 테이블 join :  
--학생이름과 지도교수 이름을 출력, 
--단! 지도 학생이 결정되지 않은 교수 명단, 
--지도교수가 결정되지 않은 학생명단 모두 출력

SELECT s.name 학생이름, p.name 교수이름
FROM T_STUDENT s
	FULL OUTER JOIN T_PROFESSOR p ON s.PROFNO = p.PROFNO;

-- OUTER JOIN 은 INNER JOIN 에 비해 성능이 떨어진다.


SELECT * FROM T_DEPT2;
------------------------------------------------
-- self join

-- #6209) 
-- t_dept2 테이블에서 
-- 부서명 과 그 부서의 상위부서명을 출력하세요
SELECT d1.DNAME 부서명, d2.DNAME 상위부서명
FROM T_DEPT2 d1, T_DEPT2 d2
WHERE d1.PDEPT = d2.DCODE;



