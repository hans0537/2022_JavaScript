-- 참조: https://www.oracletutorial.com/plsql-tutorial/plsql-cursor-for-loop/
 
-- Cursor
-- SELECT 문으로 읽어들인 레코드를 cursor에 담아
-- FOR LOOP 등에서 사용 가능.
 
-- 기본구문]
-- FOR record IN cursor_name
-- LOOP
--    처리 구문들..;
-- END LOOP;
 
BEGIN
	FOR r_student IN (
		SELECT name, grade FROM t_student 
		ORDER BY grade DESC
	)
	LOOP 
		DBMS_OUTPUT.PUT_LINE(r_student.name || ' : ' || r_student.grade);
	END LOOP;
END;
/


-- CURSOR 객체를 선언해줄수 있다
DECLARE
	CURSOR c_student	-- c_student 라는 이름의 CURSOR 정의
	IS
		SELECT name, grade FROM T_STUDENT 
		ORDER BY grade DESC;
BEGIN 
	FOR r_student IN c_student
	LOOP 
		DBMS_OUTPUT.PUT_LINE(r_student.name || ' : ' || r_student.grade);
	END LOOP;
END;
/
 
 

