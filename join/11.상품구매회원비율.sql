-- 코드를 입력하세요
with cte as (
    select *
    from USER_INFO
    where year(JOINED)=2021)

SELECT 
    year(s.SALES_DATE) YEAR, 
    month(s.SALES_DATE) MONTH, 
    count(distinct s.USER_ID) PURCHASED_USERS, 
    round(count(distinct s.USER_ID)/(select count(*) from cte), 1) PUCHASED_RATIO
from ONLINE_SALE s
join cte c on s.USER_ID=c.USER_ID
group by YEAR, MONTH
order by YEAR, MONTH



WITH cte AS (
    SELECT USER_ID FROM USER_INFO WHERE YEAR(JOINED) = 2021 --user_id만 가져와도 됨
),
total_cnt AS (
    SELECT COUNT(*) AS cnt FROM cte
) -- 이렇게 테이블 여러 개 정의 가능, 쉼표로 잇는 것 주의 
-- 아래 cte는 위의 cte를 참조 가능 

SELECT 
    YEAR(s.SALES_DATE) AS YEAR, 
    MONTH(s.SALES_DATE) AS MONTH, 
    COUNT(DISTINCT s.USER_ID) AS PURCHASED_USERS, 
    ROUND(COUNT(DISTINCT s.USER_ID) / t.cnt, 1) AS PURCHASED_RATIO
FROM ONLINE_SALE s
JOIN cte c ON s.USER_ID = c.USER_ID
CROSS JOIN total_cnt t -- 전체 카운트를 모든 행에 옆으로 붙여줌
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH;