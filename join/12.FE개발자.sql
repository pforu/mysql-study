-- 코드를 작성해주세요
with s as (
    select sum(CODE)
    from SKILLCODES 
    where CATEGORY='Front End'
)

select ID, EMAIL, FIRST_NAME, LAST_NAME
from DEVELOPERS
where SKILL_CODE&(select * from s)
order by ID



SELECT DISTINCT
    D.ID, 
    D.EMAIL, 
    D.FIRST_NAME, 
    D.LAST_NAME
FROM DEVELOPERS D
JOIN SKILLCODES S ON (D.SKILL_CODE & S.CODE) = S.CODE --on에서 연산 가능
WHERE S.CATEGORY = 'Front End'
ORDER BY D.ID;
-- 카테시안 곱 기반, d의 각 행에 s가 전체 돌면서 해당하면 결합함
-- 여러 개일 경우 여러 행이 나오니까 distinct 필수 



SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPERS D
WHERE EXISTS ( -- exists 사용 
    SELECT 1 
    FROM SKILLCODES S 
    WHERE S.CATEGORY = 'Front End' 
      AND (D.SKILL_CODE & S.CODE) = S.CODE
)
ORDER BY ID;
-- d의 각 행에 대해 만족하는 s의 행이 하나라도 있으면 true
-- 그럼 select에 의해 해당 d의 행이 택해짐 


-- 비트연산 어떻게 작동하는지, 어떤 조건은 어떻게 써야 되는지 익히기 
A 기술을 포함하는가? (SKILL_CODE & A_CODE) > 0
A 기술을 포함하는가? (SKILL_CODE & A_CODE) = A_CODE
A 또는 B 중 하나라도? (SKILL_CODE & (A_CODE + B_CODE)) > 0 