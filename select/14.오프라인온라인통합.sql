-- 코드를 입력하세요
SELECT date_format(SALES_DATE, '%Y-%m-%d') SALES_DATE, PRODUCT_ID, USER_ID, SALES_AMOUNT
from ONLINE_SALE
where SALES_DATE like '2022-03%'

union all

SELECT date_format(SALES_DATE, '%Y-%m-%d'), PRODUCT_ID, NULL, SALES_AMOUNT
from OFFLINE_SALE
where SALES_DATE like '2022-03%'

order by SALES_DATE, PRODUCT_ID, USER_ID

-- 위아래로 합치는 것, union all은 중복데이터 검사 안 함 (union)
-- 각각 해줘야 하고, 없는 칼럼은 순서 맞춰서 표시형식 정해주기 
-- 위쪽에서 별칭 다 지정했으면 아래쪽은 안 써도 무방 