-- 코드를 작성해주세요
select sum(SCORE) SCORE, e.EMP_NO, e.EMP_NAME, e.POSITION, e.EMAIL
from HR_EMPLOYEES e
join HR_GRADE g on e.EMP_NO=g.EMP_NO
where YEAR like '2022%'
group by e.EMP_NO
order by SCORE desc
limit 1