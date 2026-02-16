-- 코드를 작성해주세요
select YEAR, (maxsize - SIZE_OF_COLONY) as YEAR_DEV, ID
from (
    select ID, year(DIFFERENTIATION_DATE) YEAR, SIZE_OF_COLONY, max(SIZE_OF_COLONY) over (partition by year(DIFFERENTIATION_DATE)) maxsize
    from ECOLI_DATA) maxed
order by YEAR, YEAR_DEV

-- 밖에서는 서브쿼리의 select 절에서 붙인 alias에만 접근 가능 
-- 서브쿼리 안에서 같은 층의 다른 별칭을 참조하는 건 안 됨 