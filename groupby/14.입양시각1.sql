-- 코드를 입력하세요
SELECT hour(DATETIME) HOUR, count(*) COUNT
from ANIMAL_OUTS 
where hour(DATETIME) between 9 and 19
group by HOUR
order by HOUR
