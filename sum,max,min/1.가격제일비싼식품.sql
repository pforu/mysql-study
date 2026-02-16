-- 코드를 입력하세요
SELECT *
from FOOD_PRODUCT 
order by PRICE desc
limit 1

-- 코드를 입력하세요
SELECT *
from FOOD_PRODUCT 
where PRICE=(select max(PRICE) from FOOD_PRODUCT)
