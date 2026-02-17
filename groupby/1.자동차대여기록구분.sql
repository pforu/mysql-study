-- 코드를 입력하세요
with cte as (
    select CAR_ID, 
case
    when START_DATE <= '2022-10-16' and END_DATE >= '2022-10-16'
    then '대여중'
    else '대여 가능'
end x
    from CAR_RENTAL_COMPANY_RENTAL_HISTORY 
    )
    
SELECT CAR_ID, max(x) AVAILABILITY -- '대여중' > '대여 가능'이므로 하나만 있어도 '대여중'
from cte
group by CAR_ID
order by CAR_ID desc


-- 코드를 입력하세요
with cte as (
    select CAR_ID, 
case
    when '2022-10-16' between START_DATE and END_DATE then '대여중' --between 사용 
    else '대여 가능'
end x
    from CAR_RENTAL_COMPANY_RENTAL_HISTORY 
)
    
SELECT CAR_ID, max(x) AVAILABILITY 
from cte
group by CAR_ID
order by CAR_ID desc


-- 코드를 입력하세요
SELECT CAR_ID, max(case -- 테이블 정의 없이 바로 넣을 수 있음 
    when '2022-10-16' between START_DATE and END_DATE then '대여중'
    else '대여 가능') AVAILABILITY 
from CAR_RENTAL_COMPANY_RENTAL_HISTORY 
group by CAR_ID
order by CAR_ID desc


-- 코드를 입력하세요
SELECT CAR_ID, if(sum(if('2022-10-16' between START_DATE and END_DATE, 1, 0))>0,
    '대여중', '대여 가능') AVAILABILITY -- if(조건문, t일때값, f일때값) 과 sum()으로 조건 
from CAR_RENTAL_COMPANY_RENTAL_HISTORY
group by CAR_ID
order by CAR_ID desc


-- 코드를 입력하세요
SELECT CAR_ID, 
    case --case로 조건, 서브쿼리로 in 판별 
        when CAR_ID in
            (select CAR_ID
            from CAR_RENTAL_COMPANY_RENTAL_HISTORY
            where '2022-10-16' between START_DATE and END_DATE)
        then '대여중'
        else '대여 가능'
    end AVAILABILITY 
from CAR_RENTAL_COMPANY_RENTAL_HISTORY
group by CAR_ID --group by 사용 
order by CAR_ID desc


-- 코드를 입력하세요
SELECT distinct CAR_ID, -- distinct 사용 
    case
        when CAR_ID in
            (select CAR_ID
            from CAR_RENTAL_COMPANY_RENTAL_HISTORY
            where '2022-10-16' between START_DATE and END_DATE)
        then '대여중'
        else '대여 가능'
    end AVAILABILITY 
from CAR_RENTAL_COMPANY_RENTAL_HISTORY
order by CAR_ID desc

-- select에는 max나 sum같은 집계함수를 쓸 수 있고,
-- 비슷한 기능을 내려면 서브쿼리를 만들어야 함 