CREATE TABLE test_emp_a (
	emp_id NUMBER,
	emp_name VARCHAR2(100)
);

CREATE TABLE test_emp_b (
	emp_id NUMBER,
	emp_name VARCHAR2(100)
);

-- 한개 row 씩 INSERT 
INSERT INTO test_emp_a VALUES(101, '아이언맨');

INSERT INTO test_emp_b VALUES(101, '캡틴그놈');

SELECT * FROM test_emp_a;
SELECT * FROM test_emp_b;

-- ORACLE 에서 동시에 여러개 테이블에 INSERT 하기
INSERT ALL
	INTO test_emp_a VALUES(102, '블랙위도우')
	INTO test_emp_b VALUES(202, '비젼')
SELECT * FROM dual;

-- INSERT 할때 sub query 로 INSERT 가능
INSERT INTO test_emp_a (SELECT 400, '설현아' FROM dual);

-- 테이블 x2 배로 만들기
INSERT INTO test_emp_a (SELECT * FROM test_emp_a);


SELECT * FROM test_emp_a;

INSERT INTO test_emp_b(emp_id) (SELECT emp_id FROM test_emp_a);

SELECT * FROM test_emp_b;

SELECT * FROM PHONEBOOK ORDER BY id ASC; 
INSERT INTO PHONEBOOK (SELECT * FROM PHONEBOOK); -- 에러, PK 중복

INSERT INTO PHONEBOOK (id, name, phone, email)
(SELECT phonebook_seq.nextval, name, PHONE, email FROM phonebook);

UPDATE phonebook SET id = id + 1000;

-- CREATE TABLE 에도 subquery 사용
CREATE TABLE test_phonebook
AS
SELECT * FROM phonebook;

SELECT * FROM test_phonebook;


-- UNION ALL



