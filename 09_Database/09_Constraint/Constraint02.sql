-- 복합키 제약조건

CREATE TABLE test_member (
    mb_uid NUMBER NOT NULL,
    mb_nick VARCHAR2(10) NOT NULL,
    mb_name VARCHAR2(10) NOT NULL,
    CONSTRAINT test_member_pk PRIMARY KEY(mb_uid, mb_nick)
);

INSERT INTO test_member values(1, 'aaa', 'john');
INSERT INTO test_member values(1, 'bbb', 'john');
INSERT INTO test_member values(2, 'aaa', 'john');

SELECT * FROM test_member;



