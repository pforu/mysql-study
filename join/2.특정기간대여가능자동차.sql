-- 코드를 입력하세요
with impos as (
    select distinct CAR_ID
    from CAR_RENTAL_COMPANY_RENTAL_HISTORY
    where START_DATE <= '2022-11-30' and END_DATE >= '2022-11-01'
    -- 대여 가능한지 조건거는 방법 외우기 
)

SELECT c.CAR_ID, c.CAR_TYPE,
round((1-p.DISCOUNT_RATE/100) * c.DAILY_FEE * 30) as FEE
from CAR_RENTAL_COMPANY_CAR c
join CAR_RENTAL_COMPANY_DISCOUNT_PLAN p on c.CAR_TYPE=p.CAR_TYPE
where c.CAR_TYPE in ('세단', 'SUV') and c.CAR_ID not in (select * from impos) and p.DURATION_TYPE='30일 이상'
having FEE >= 500000 and FEE <= 2000000
order by FEE desc, c.CAR_TYPE, c.CAR_ID desc


-- GROUP BY가 없이도 HAVING 사용 가능
-- 1. 집계 함수(SUM, COUNT 등)를 쓰면: 조건 만족 안 할 시 테이블 통째로 증발
-- 2. select절의 alias를 쓰면: 각 행마다 검사해서 조건 맞는 행만 남김