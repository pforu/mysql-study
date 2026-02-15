-- 코드를 작성해주세요
select p.ID, count(c.ID) CHILD_COUNT --c.ID 세야 null은 0으로 들어감 
from ECOLI_DATA p
left join ECOLI_DATA c on p.ID=c.PARENT_ID --자식을 부모에 각각의 행으로 붙임(조합)
group by p.ID --증식한 행을 부모 하나에 카테고리 하나로 묶음 
order by p.ID

-- 서브쿼리, 외부변수 e가 서브쿼리에 있기 때문에 for문처럼 동작, 성능 저하 
select ID, (select count(*) from ECOLI_DATA where PARENT_ID=e.ID) CHILD_COUNT
from ECOLI_DATA e