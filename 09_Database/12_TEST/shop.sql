
/* Drop Tables */

DROP TABLE test_add_friend CASCADE CONSTRAINTS;
DROP TABLE test_comment CASCADE CONSTRAINTS;
DROP TABLE test_like CASCADE CONSTRAINTS;
DROP TABLE test_otheruser CASCADE CONSTRAINTS;
DROP TABLE test_picture CASCADE CONSTRAINTS;
DROP TABLE test_post CASCADE CONSTRAINTS;
DROP TABLE test_user CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE test_add_friend
(
	user_id varchar2(20) NOT NULL,
	other_id varchar2(20) NOT NULL
);


CREATE TABLE test_comment
(
	comment_id number NOT NULL,
	comment_content varchar2(100),
	comment_date date NOT NULL,
	post_id number NOT NULL,
	user_id varchar2(20) NOT NULL,
	PRIMARY KEY (comment_id)
);


CREATE TABLE test_like
(
	like_id number NOT NULL,
	user_id varchar2(20) NOT NULL,
	post_id number NOT NULL,
	PRIMARY KEY (like_id)
);


CREATE TABLE test_otheruser
(
	other_id varchar2(20) NOT NULL,
	PRIMARY KEY (other_id)
);


CREATE TABLE test_picture
(
	pic_info varchar2(20) NOT NULL,
	post_id number NOT NULL,
	user_id varchar2(20) NOT NULL,
	PRIMARY KEY (pic_info)
);


CREATE TABLE test_post
(
	post_id number NOT NULL,
	post_title varchar2(20),
	post_content varchar2(100),
	-- 0=공개, 1=비공개
	post_public number DEFAULT 0 NOT NULL 0, 1,
	post_views number,
	post_regdate date NOT NULL,
	user_id varchar2(20) NOT NULL,
	CONSTRAINT public PRIMARY KEY (post_id),
	public
)
public in (0, 1);


CREATE TABLE test_user
(
	user_id varchar2(20) NOT NULL,
	user_password varchar2(50) NOT NULL,
	PRIMARY KEY (user_id)
);



/* Create Foreign Keys */

ALTER TABLE test_add_friend
	ADD FOREIGN KEY (other_id)
	REFERENCES test_otheruser (other_id)
;


ALTER TABLE test_comment
	ADD FOREIGN KEY (post_id)
	REFERENCES test_post (post_id)
;


ALTER TABLE test_like
	ADD FOREIGN KEY (post_id)
	REFERENCES test_post (post_id)
;


ALTER TABLE test_picture
	ADD FOREIGN KEY (post_id)
	REFERENCES test_post (post_id)
;


ALTER TABLE test_add_friend
	ADD FOREIGN KEY (user_id)
	REFERENCES test_user (user_id)
;


ALTER TABLE test_comment
	ADD FOREIGN KEY (user_id)
	REFERENCES test_user (user_id)
;


ALTER TABLE test_like
	ADD FOREIGN KEY (user_id)
	REFERENCES test_user (user_id)
;


ALTER TABLE test_picture
	ADD FOREIGN KEY (user_id)
	REFERENCES test_user (user_id)
;


ALTER TABLE test_post
	ADD FOREIGN KEY (user_id)
	REFERENCES test_user (user_id)
;



/* Comments */

COMMENT ON COLUMN test_post.post_public IS '0=공개, 1=비공개';



