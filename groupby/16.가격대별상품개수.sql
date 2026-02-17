-- 코드를 입력하세요
SELECT truncate(PRICE, -4) PRICE_GROUP, count(*) PRODUCTS
from PRODUCT 
group by PRICE_GROUP
order by PRICE_GROUP

-- 예시 15.9, -15.1
-- FLOOR: 정수로 내림 (더 작은 정수), 15, -16
-- CEIL: 정수로 올림 (더 큰 정수), 16, -15
-- TRUNCATE: 지정한 위치 아래를 그냥 삭제, 15, -15
-- ROUND: 지정한 위치로 반올림, 16, -15
