-- 코드를 입력하세요
SELECT i.ANIMAL_ID, i.ANIMAL_TYPE, i.NAME
from ANIMAL_INS i
join ANIMAL_OUTS o on i.ANIMAL_ID=o.ANIMAL_ID
where i.SEX_UPON_INTAKE regexp 'Intact' and o.SEX_UPON_OUTCOME regexp 'Spayed|Neutered'
order by i.ANIMAL_ID
