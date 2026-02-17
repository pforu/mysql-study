-- 코드를 입력하세요
SELECT ANIMAL_TYPE, count(*) count
from ANIMAL_INS 
where ANIMAL_TYPE in ('Cat', 'Dog')
group by ANIMAL_TYPE
order by ANIMAL_TYPE
