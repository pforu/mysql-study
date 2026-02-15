-- 코드를 작성해주세요
select d3.ID
from ECOLI_DATA d3
join ECOLI_DATA d2 on d3.PARENT_ID=d2.ID
join ECOLI_DATA d1 on d2.PARENT_ID=d1.ID
where d1.PARENT_ID is null
order by d3.ID
