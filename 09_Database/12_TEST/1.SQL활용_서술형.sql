-- ────────────────────────────────────────────────────────────
-- #01
-- 테이블 : t_customer
-- 질의사항: 
--     여성 고객들의 point 합을 계산하세요.
-- 출력컬럼이름: [point합]
-- ↓ 쿼리를 작성하세요
SELECT sum(C_POINT) "point합"
FROM t_customer
WHERE substr(c_jumin, 7, 1) = '2'
;

-- ────────────────────────────────────────────────────────────
-- #02
-- 테이블: t_customer
-- 질의사항: 
--     point 가 500000 이상 700000 미만인 고객들의 평균나이를 계산하세요
--     나이는 '현재날짜' 기준으로 계산합니다
--     평균나이는 소숫점 1자리까지 출력
-- 출력컬럼: [평균나이]
-- ↓ 쿼리를 작성하세요

SELECT TRUNC(AVG(to_char(sysdate, 'YYYY') - ('19' || substr(c_jumin, 1, 2)) + 1), 1) "평균나이" 
FROM T_CUSTOMER 
WHERE C_POINT >= 500000 AND C_POINT < 700000 ;

-- ────────────────────────────────────────────────────────────
-- #03
-- 테이블: t_emp, t_dept 
-- 질의사항:
--   CHICAGO 와 DALLAS 에 근무하는 직원들의 숫자와 교통비(comm) 평균 을 계산해보세요.
--   교통비 평균은 반올림하여 표시
-- 출력컬럼: [지역명][직원수][교통비평균]
-- 정렬: 교통비평균 내림차순
-- 출력예시: https://docs.google.com/presentation/d/1yRKE20j6qwZBUjeOMoYzgNIBLJkGtzs6gQJNjQXKypQ/edit#slide=id.g14b31bc663c_0_88
-- ↓ 쿼리를 작성하세요
SELECT d.LOC "지역명", COUNT(*) "직원수", round(AVG(nvl(e.comm, 0))) "교통비평균"
FROM t_emp e, t_dept d
WHERE d.loc IN ('CHICAGO', 'DALLAS') AND e.DEPTNO = d.DEPTNO 
GROUP BY d.loc
ORDER BY "교통비평균" DESC;


-- ────────────────────────────────────────────────────────────
-- #04
-- 테이블: t_sales, t_product
-- 질의사항: 상품별 로 총판매수량 과 판매금액합계 출력
--     
-- 출력컬럼: [상품명][총판매수량][판매금액합계]
-- 정렬: 총판매수량 내림차순, 
-- 출력예시: https://docs.google.com/presentation/d/1yRKE20j6qwZBUjeOMoYzgNIBLJkGtzs6gQJNjQXKypQ/edit#slide=id.g14b31bc663c_0_95
-- ↓ 쿼리를 작성하세요

SELECT p.P_NAME "상품명", sum(s.S_QTY) "총판매수량", sum(s.S_TOTAL) "판매금액합계"
FROM t_sales s, t_product p
WHERE s.S_CODE = p.P_CODE
GROUP BY p.P_NAME
ORDER BY "총판매수량" DESC;
















