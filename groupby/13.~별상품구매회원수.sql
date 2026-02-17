-- 코드를 입력하세요
SELECT year(s.SALES_DATE) YEAR, month(s.SALES_DATE) MONTH, i.GENDER, count(distinct i.USER_ID) USERS
from USER_INFO i
join ONLINE_SALE s on i.USER_ID=s.USER_ID
where i.GENDER is not null
group by YEAR, MONTH, i.GENDER
order by YEAR, MONTH, i.GENDER

-- distinct
-- SELECT DISTINCT : 'GENDER + YEAR' 세트가 중복되는 것을 제거
-- SELECT DISTINCT GENDER, YEAR FROM USER_INFO; 

-- 특정 컬럼만 집계 함수(COUNT, SUM 등) 안에 쓰는 경우:
-- SELECT 절에 여러 집계 함수를 쓰면서 각각 다른 중복 제거 가능 
-- SELECT COUNT(DISTINCT USER_ID) FROM ONLINE_SALE;