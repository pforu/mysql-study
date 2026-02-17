-- 코드를 입력하세요
with cte as (
    select MEMBER_ID, rank() over (order by count(*) desc) rnk
    from REST_REVIEW
    group by MEMBER_ID -- partition by는 각 그룹별 1위 구하는 거라 group by 사용 
)

SELECT m.MEMBER_NAME, r.REVIEW_TEXT, date_format(r.REVIEW_DATE, '%Y-%m-%d') REVIEW_DATE
from MEMBER_PROFILE m
join REST_REVIEW r on m.MEMBER_ID=r.MEMBER_ID
join cte c on m.MEMBER_ID=c.MEMBER_ID
where c.rnk=1
order by r.REVIEW_DATE, r.REVIEW_TEXT


-- ROW_NUMBER(): "1, 2, 3, 4", 공동 순위 없음
-- RANK(): "1, 1, 1, 4", 공동 1등이 3명이면 다음은 4등
-- DENSE_RANK(): "1, 1, 1, 2", 공동 1등이 많아도 다음은 바로 2등