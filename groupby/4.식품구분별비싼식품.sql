-- 코드를 입력하세요
SELECT CATEGORY, PRICE, PRODUCT_NAME
from
    (select CATEGORY, rank() over(partition by CATEGORY order by PRICE desc) rnk,
    PRODUCT_NAME, PRICE
    from FOOD_PRODUCT) z
where CATEGORY in ('과자', '국', '김치', '식용유') and rnk=1
order by PRICE desc
