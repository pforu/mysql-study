-- 코드를 작성해주세요
with recursive generationCTE as (
    select ID, PARENT_ID, 1 generation
    from ECOLI_DATA 
    where PARENT_ID is null
    
    union all
    
    select e.ID, e.PARENT_ID, g.generation+1
    from ECOLI_DATA e
    join generationCTE g on e.PARENT_ID=g.ID
)
select count(*) COUNT, generation GENERATION
from generationCTE g
where not exists (select 1 from ECOLI_DATA e where e.PARENT_ID=g.ID)
group by generation
order by generation


-- 코드를 작성해주세요
with recursive generationCTE as (
    select ID, PARENT_ID, 1 generation
    from ECOLI_DATA 
    where PARENT_ID is null
    
    union all
    
    select e.ID, e.PARENT_ID, g.generation+1
    from ECOLI_DATA e
    join generationCTE g on e.PARENT_ID=g.ID
)
select count(*) COUNT, generation GENERATION
from generationCTE g
left join ECOLI_DATA e on g.ID=e.PARENT_ID
where e.ID is null
group by generation
order by generation

-- 자식 → 부모, """내 부모가 누구지?""", 나.PARENT_ID = 부모.ID
-- 부모 → 자식, """내 자식이 누구지?""", 나.ID = 자식.PARENT_ID
-- 항상 부모 쪽이 id를 가짐 