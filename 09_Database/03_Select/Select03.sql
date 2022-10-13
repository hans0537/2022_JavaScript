-- 1번
SELECT name, height FROM t_student WHERE HEIGHT >= 180;

-- 2번
SELECT name, weight FROM t_student WHERE weight BETWEEN 60 AND 80;

-- 3번
SELECT name, deptno1 FROM t_student WHERE DEPTNO1 IN (101, 201);

-- 4번
SELECT name FROM T_STUDENT WHERE name LIKE '김%';

-- 5번
SELECT name, grade, height FROM T_STUDENT 
WHERE grade = 4 AND HEIGHT >= 170;

-- 6번
SELECT name, height, grade, WEIGHT FROM T_STUDENT 
WHERE grade = 1 or WEIGHT >= 80;

-- 7번
SELECT name, grade, HEIGHT, WEIGHT FROM T_STUDENT 
WHERE grade = 2 AND HEIGHT > 180 and WEIGHT > 70;

-- 8번
SELECT name, grade, height, weight FROM T_STUDENT
WHERE grade = 2 AND (HEIGHT > 180 OR WEIGHT > 70);

-- 9번
SELECT ename, hiredate FROM T_EMP 
WHERE HIREDATE < '1992-01-01';

-- 10번
SELECT name, BIRTHDAY, HEIGHT, WEIGHT FROM T_STUDENT
WHERE grade = 1
ORDER BY BIRTHDAY;

-- 11번
SELECT name AS 이름, height AS 키 FROM T_STUDENT
WHERE grade = 1
ORDER BY name;

-- 12번
SELECT name, birthday FROM T_EMP2
WHERE BIRTHDAY BETWEEN '1980-01-01' AND '1989-12-31';