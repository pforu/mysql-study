-- 코드를 입력하세요
SELECT CAR_TYPE, count(*) CARS
from CAR_RENTAL_COMPANY_CAR 
where (OPTIONS like '%통풍시트%') or (OPTIONS like '%열선시트%') or (OPTIONS like '%가죽시트%')
group by CAR_TYPE
order by CAR_TYPE

-- WHERE OPTIONS REGEXP '통풍시트|열선시트|가죽시트'

-- 연산자 우선순위 
-- 산술 연산: *, /, +, -
-- 비교 연산: =, <, >, LIKE, IN, IS NULL
-- 논리 연산 (NOT): NOT
-- 논리 연산 (AND): AND
-- 논리 연산 (OR): OR (가장 낮음)

-- order에 by 꼭 붙여주기 