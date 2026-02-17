-- 코드를 입력하세요
with recursive cte as (
    select 0 hour
    union all
    select hour+1 from cte where hour<23
)
SELECT c.hour HOUR, count(DATETIME) COUNT
from cte c
left join ANIMAL_OUTS a on c.hour=hour(a.DATETIME) --이렇게 쓸 수 있음 
group by HOUR
order by HOUR
-- 기록이 없어도 포함해야 하므로 left join, null을 자동 제외하기 위해 count(*) 말고 DATETIME 칼럼 부여
-- recursive에서 where은 다음 걸 만들지 말지 결정하는 거라서 N까지면 <N
