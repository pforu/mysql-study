-- 코드를 작성해주세요
select ID, EMAIL, FIRST_NAME, LAST_NAME
from DEVELOPERS 
where SKILL_CODE & (select `CODE` from SKILLCODES where NAME='Python')
or
SKILL_CODE & (select `CODE` from SKILLCODES where NAME='C#')
order by ID

-- 비트연산 적용됨, >0 써주는 게 권장됨 
-- where은 한 번만 사용 가능 