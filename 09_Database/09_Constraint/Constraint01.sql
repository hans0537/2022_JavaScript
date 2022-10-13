
-- 제약조건 (Contraint)

SELECT * FROM t_dept2;

-- #9001
-- 테이블 생성시 동시에 설정하기
DROP TABLE t_emp4 CASCADE CONSTRAINT PURGE;
CREATE TABLE t_emp4 (
	NO NUMBER(4) PRIMARY KEY
	, name VARCHAR2(10) NOT NULL
	, jumin VARCHAR2(13) NOT NULL UNIQUE  -- 제약조건 여러개 설정 가능
	, area NUMBER(1) CHECK(area < 5)
	, deptno VARCHAR(6) REFERENCES t_dept2(dcode)  -- FK: 외래키
);

-- 제약조건을 별도의 항목으로도 정의 가능
DROP TABLE t_emp4 CASCADE CONSTRAINT PURGE;
CREATE TABLE t_emp4 (
	NO NUMBER(4)
	, name VARCHAR2(10) NOT NULL
	, jumin VARCHAR2(13) NOT NULL
	, area NUMBER(1)
	, deptno VARCHAR(6)
	, PRIMARY KEY(no)
	, UNIQUE(jumin)
	, CHECK(area < 5)
	, FOREIGN KEY (deptno) REFERENCES t_dept2(dcode)
);


-- #9003) 설정되어 있는 제약조건 조회
SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS 
FROM USER_CONSTRAINTS 
WHERE table_name = 'T_EMP4'  -- 테이블명 대문자로
;
-- CONSTRAINT TYPE
-- 'C' : NN, CK
-- 'P' : PK
-- 'U' : UK
-- 'R' : FK

-- #9002
-- 제약조건명을 명시하여 정의
DROP TABLE t_emp3 CASCADE CONSTRAINT PURGE;
CREATE TABLE t_emp3 (
	NO NUMBER(4) CONSTRAINT emp3_no_pk PRIMARY KEY
	, name VARCHAR2(10) CONSTRAINT emp3_name_nn NOT NULL
	, jumin VARCHAR2(13)
			CONSTRAINT emp3_jumin_nn NOT NULL 
			CONSTRAINT emp3_jumin_uk UNIQUE
	, area NUMBER(1) CONSTRAINT emp3_area_ck CHECK(area < 5)
	, deptno VARCHAR(6) CONSTRAINT emp3_deptno_fk REFERENCES t_dept2(dcode)  -- FK: 외래키
);

-- 별도 항목으로 정의 가능
DROP TABLE t_emp3 CASCADE CONSTRAINT PURGE;
CREATE TABLE t_emp3 (
	NO NUMBER(4) 
	, name VARCHAR2(10) CONSTRAINT emp3_name_nn NOT NULL
	, jumin VARCHAR2(13) CONSTRAINT emp3_jumin_nn NOT NULL 			
	, area NUMBER(1) 
	, deptno VARCHAR(6)
	, CONSTRAINT emp3_no_pk PRIMARY KEY(no)
	, CONSTRAINT emp3_jumin_uk UNIQUE(jumin)
	, CONSTRAINT emp3_area_ck CHECK(area < 5)
	, CONSTRAINT emp3_deptno_fk FOREIGN KEY(deptno) REFERENCES t_dept2(dcode)  -- FK: 외래키
);

SELECT OWNER, CONSTRAINT_NAME, CONSTRAINT_TYPE, STATUS 
FROM USER_CONSTRAINTS 
WHERE table_name = 'T_EMP3'

-- #9005
-- 제약조건에 위배될때
INSERT INTO t_emp3 VALUES(
	1, '오라클', '1234561234567', 4, 1000
);
-- 두번 실행하면 오류
-- ORA-00001: unique constraint (SCOTT726.EMP3_NO_PK) violated

INSERT INTO t_emp3 VALUES(
	2, '오라클', '1234561234567', 4, 1000
); -- jumin UK 오류
-- ORA-00001: unique constraint (SCOTT726.EMP3_JUMIN_UK) violated

INSERT INTO t_emp3 VALUES(
	2, '오라클', '22222222222222222222', 4, 1000
); -- VARCHAR2(13) 초과 오류
-- ORA-12899: value too large for column "SCOTT726"."T_EMP3"."JUMIN" (actual: 20, maximum: 13)

INSERT INTO t_emp3 VALUES(
	2, 'tigers', '2222222222222', 3, 2000
); -- FK 오류
--  ORA-02291: integrity constraint (SCOTT726.EMP3_DEPTNO_FK) violated - parent key not found

SELECT * FROM t_dept2;

INSERT INTO t_emp3 VALUES(
	2, '우영우', '2222222222222', 10, 1000
); -- area CK 위배 오류
-- ORA-01438: value larger than specified precision allowed for this column

INSERT INTO t_emp3(NO, jumin, area, deptno) VALUES(
	2, '3333333333333', 4, 1001
); -- name NN 위배 오류
-- ORA-01400: cannot insert NULL into ("SCOTT726"."T_EMP3"."NAME")

SELECT * FROM t_emp3;

UPDATE t_emp3 SET area = 10 WHERE NO = 1;  -- area CK 위배 오류

DELETE FROM t_dept2 WHERE dcode = 1000;  -- 참초하고 있는 부모는 삭제 불가  
-- ORA-02292: integrity constraint (SCOTT726.EMP3_DEPTNO_FK) violated - child record found

-- ON DELETE RESTRICT : (기본) 참조되는 부모쪽 삭제 허용 안함
-- ON DELETE CASCADE : 참조되는 부모쪽 삭제되면 참조하는 자식도 함께 삭제됨

-- #9005 ALTER 명령 사용하여 테이블에 제약조선 추가 가능
ALTER TABLE t_emp4
ADD CONSTRAINT emp4_name_uk UNIQUE(name)
;

-- #9006
-- t_emp4.area 컬럼에 NOT NULL 제약조건 추가
ALTER TABLE t_emp4
ADD CONSTRAINT emp4_area_nn NOT NULL(area) -- 에러
;
-- 이미 테이블 컬럼에 기본값인 NULL 로 되어 있기 때문에 ADD 가 아닌 MODIFY 로 해야 한다

ALTER TABLE t_emp4
MODIFY (area CONSTRAINT emp4_area_nn NOT NULL);

-- #9007 외래키 추가
-- t_emp4 테이블의 no 컬럼이 t_emp2 테이블의 
-- empno 컬럼의 값을 참조하도록 참조키 제약조건을 설정하세요
-- 그러나! 참조되는 부모테이블의 컬럼은 Primary Key 이거나 Unique 이어야 한다

ALTER TABLE t_emp4
ADD CONSTRAINT emp4_name_fk FOREIGN KEY(name) REFERENCES t_emp2(name);
-- ORA-02270: no matching unique or primary key for this column-list

-- 부모테이블의 name 을 UNIQUE 제약조건 부여하고 다시 위 쿼리 수행
ALTER TABLE T_EMP2 
ADD CONSTRAINT emp2_name_uk UNIQUE(name);

-- #9008)    t_emp3 테이블을 DROP 하고, 이전과 같은 조건으로 다시 만들되
-- t_dept2(dcode)를 참조하는 detpno 컬럼은 
-- 부모테이블의 해당 데이터가 삭제되면 함께 삭제되도록 설정
DROP TABLE t_emp3 CASCADE CONSTRAINT PURGE;
CREATE TABLE t_emp3 (
	NO NUMBER(4) CONSTRAINT emp3_no_pk PRIMARY KEY
	, name VARCHAR2(10) CONSTRAINT emp3_name_nn NOT NULL
	, jumin VARCHAR2(13)
			CONSTRAINT emp3_jumin_nn NOT NULL 
			CONSTRAINT emp3_jumin_uk UNIQUE
	, area NUMBER(1) CONSTRAINT emp3_area_ck CHECK(area < 5)
	, deptno VARCHAR(6) CONSTRAINT emp3_deptno_fk REFERENCES t_dept2(dcode)  -- FK: 외래키
			ON DELETE CASCADE -- 부모테이블의 참조가 삭제되면 자식도 함께 삭제
			-- ON DELETE RESTRICT -- 참조되는 부모테이블 삭제 금지
			-- ON DELETE SET NULL -- 참조되는 부모가 삭제되면 자식은 NULL 로 변경
			
			-- ON UPDATE ...  	  -- 부모쪽이 변경되면 ... (오라클은 지원안함)
);

-- 기존 제약조건 삭제
ALTER TABLE t_emp3 
DROP CONSTRAINT emp3_deptno_fk;









       
