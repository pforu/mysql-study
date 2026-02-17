-- 코드를 입력하세요
SELECT 
h.HISTORY_ID, 
floor(c.DAILY_FEE * (datediff(h.END_DATE, h.START_DATE)+1) * (1-ifnull(p.DISCOUNT_RATE/100, 0))) FEE
from CAR_RENTAL_COMPANY_CAR c
join CAR_RENTAL_COMPANY_RENTAL_HISTORY h on c.CAR_ID=h.CAR_ID
left join CAR_RENTAL_COMPANY_DISCOUNT_PLAN p on c.CAR_TYPE=p.CAR_TYPE
-- 7일 미만이어도 기록은 존재해야 하므로 left join 
and p.DURATION_TYPE = (case
    when datediff(h.END_DATE, h.START_DATE)+1 >= 90
    then '90일 이상'
    when datediff(h.END_DATE, h.START_DATE)+1 >= 30
    then '30일 이상'
    when datediff(h.END_DATE, h.START_DATE)+1 >= 7
    then '7일 이상'
    else null
end)
where c.CAR_TYPE='트럭'
order by FEE desc, h.HISTORY_ID desc

-- on에 저렇게 조건 달 수 있음 
-- left join을 했으므로 7일 미만인 자동차도 p.DURATION_TYPE = null로 있으나, 
-- where에서 대여기간별 할인을 case로 파악하면 null = null : unknown으로 false,
-- 결국 7일 미만 대여한 자동차는 없어짐

-- 7일 미만인 자동차는 p.DURATION_TYPE = null로, p.DISCOUNT_RATE/100로 할인율 계산이 불가
-- 할인율 등 연산 시, ifnull() 사용 필요한지 꼭 살피기 

-- 90, 30, 7일 순으로 하지 않으면 30, 90도 7일 이상에 걸려버림
-- case 조건 순서 narrow한 것부터 잘 정하기 

-- 정수만 출력 등, floor 처리조건 잘 살피기

-- datediff(종료일, 시작일) 순서, 기간은 +1

-- select case~ from 테이블 처럼 쓰지 않아도, 단순 case문만 사용 가능 


WITH rental_info AS (
    SELECT 
        h.HISTORY_ID, 
        c.DAILY_FEE, 
        c.CAR_TYPE,
        DATEDIFF(h.END_DATE, h.START_DATE) + 1 AS duration,
        CASE 
            WHEN DATEDIFF(h.END_DATE, h.START_DATE) + 1 >= 90 THEN '90일 이상'
            WHEN DATEDIFF(h.END_DATE, h.START_DATE) + 1 >= 30 THEN '30일 이상'
            WHEN DATEDIFF(h.END_DATE, h.START_DATE) + 1 >= 7 THEN '7일 이상'
            ELSE '할인없음' -- NULL 대신 명시적으로 표현
        END AS duration_type
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY h
    JOIN CAR_RENTAL_COMPANY_CAR c ON h.CAR_ID = c.CAR_ID
    WHERE c.CAR_TYPE = '트럭'
)

SELECT 
    r.HISTORY_ID,
    FLOOR(r.DAILY_FEE * r.duration * (1 - IFNULL(p.DISCOUNT_RATE, 0) / 100)) AS FEE
FROM rental_info r
LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN p 
    ON r.CAR_TYPE = p.CAR_TYPE AND r.duration_type = p.DURATION_TYPE
ORDER BY FEE DESC, r.HISTORY_ID DESC;