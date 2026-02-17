-- 코드를 작성해주세요
select count(f.ID) FISH_COUNT, n.FISH_NAME
from FISH_NAME_INFO n
join FISH_INFO f on n.FISH_TYPE=f.FISH_TYPE
group by n.FISH_NAME
order by FISH_COUNT desc
-- select에 group by에서 안 쓴 칼럼을 쓰면 안 됨(fish_type으로 묶으면 안 됨)