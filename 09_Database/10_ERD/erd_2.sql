
/* Drop Tables */

DROP TABLE NEW_TABLE CASCADE CONSTRAINTS;
DROP TABLE lecture CASCADE CONSTRAINTS;
DROP TABLE prof CASCADE CONSTRAINTS;
DROP TABLE stu CASCADE CONSTRAINTS;
DROP TABLE dept CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE dept
(
	dept_no number NOT NULL,
	dept_name varchar2(10) NOT NULL,
	dept_tel varchar2(20),
	dept_office varchar2(20),
	PRIMARY KEY (dept_no)
);


CREATE TABLE lecture
(
	lectno number NOT NULL,
	lectname varchar2(10) NOT NULL,
	lectcredit number NOT NULL,
	lectenrno number,
	lectroom varchar2(10),
	lectyear date,
	pno number NOT NULL,
	PRIMARY KEY (lectno)
);


CREATE TABLE NEW_TABLE
(
	stno number NOT NULL,
	lectno number NOT NULL
);


CREATE TABLE prof
(
	pno number NOT NULL,
	pname varchar2(10) NOT NULL,
	pjumin varchar2(14) NOT NULL,
	padress varchar2(50),
	pnumber varchar2(20),
	pposition varchar2(10),
	phiredate date,
	dept_no number NOT NULL,
	PRIMARY KEY (pno)
);


CREATE TABLE stu
(
	stno number NOT NULL,
	name varchar2(10) NOT NULL,
	jumin varchar2(14) NOT NULL UNIQUE,
	grade number NOT NULL,
	tel varchar2(20),
	adress varchar2(50),
	dept_no number NOT NULL,
	PRIMARY KEY (stno)
);



/* Create Foreign Keys */

ALTER TABLE prof
	ADD FOREIGN KEY (dept_no)
	REFERENCES dept (dept_no)
;


ALTER TABLE stu
	ADD FOREIGN KEY (dept_no)
	REFERENCES dept (dept_no)
;


ALTER TABLE NEW_TABLE
	ADD FOREIGN KEY (lectno)
	REFERENCES lecture (lectno)
;


ALTER TABLE lecture
	ADD FOREIGN KEY (pno)
	REFERENCES prof (pno)
;


ALTER TABLE NEW_TABLE
	ADD FOREIGN KEY (stno)
	REFERENCES stu (stno)
;



