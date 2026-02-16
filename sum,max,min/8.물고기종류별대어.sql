-- 코드를 작성해주세요
select f.ID, n.FISH_NAME, f.LENGTH
from FISH_INFO f
join FISH_NAME_INFO n on f.FISH_TYPE=n.FISH_TYPE
where (f.FISH_TYPE, f.LENGTH) in (select FISH_TYPE, max(LENGTH) from FISH_INFO group by FISH_TYPE)
order by f.ID

-- 코드를 작성해주세요
select f.ID, n.FISH_NAME, f.LENGTH
from (
    select ID, FISH_TYPE, LENGTH, rank() over (partition by FISH_TYPE order by LENGTH desc) rnk
    from FISH_INFO) f
join FISH_NAME_INFO n on f.FISH_TYPE=n.FISH_TYPE
where rnk=1
order by ID
