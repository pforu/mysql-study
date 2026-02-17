-- 코드를 입력하세요
SELECT ANIMAL_ID, NAME
from ANIMAL_INS 
where ANIMAL_TYPE='Dog' and lower(NAME) like '%el%'
order by NAME
-- 문제 잘 읽기, '개' 조건 빠뜨림 