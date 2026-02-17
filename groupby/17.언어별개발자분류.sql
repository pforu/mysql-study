-- 코드를 작성해주세요
select GRADE, ID, EMAIL
from (select ID, EMAIL,
    case 
        when SKILL_CODE&(select CODE from SKILLCODES where NAME='Python')>0
      and SKILL_CODE&(SELECT SUM(CODE) FROM SKILLCODES WHERE CATEGORY = 'Front End')>0
      then 'A'
        when SKILL_CODE&(select CODE from SKILLCODES where NAME='C#')>0
      then 'B'
        when SKILL_CODE&(SELECT SUM(CODE) FROM SKILLCODES WHERE CATEGORY = 'Front End') 
      then 'C'
        else null
    end GRADE
from DEVELOPERS) dev
where GRADE is not null
order by GRADE, ID




SELECT GRADE, ID, EMAIL
FROM (
    SELECT 
        D.ID, D.EMAIL,
        CASE 
            WHEN (D.SKILL_CODE & S.FE_CODE) AND (D.SKILL_CODE & S.PY_CODE) THEN 'A'
            WHEN (D.SKILL_CODE & S.CS_CODE) THEN 'B'
            WHEN (D.SKILL_CODE & S.FE_CODE) THEN 'C'
            ELSE NULL 
        END AS GRADE
    FROM DEVELOPERS D
    CROSS JOIN (
        -- 필요한 스킬 코드들을 미리 한 줄에 다 계산해둡니다 (딱 1번만 실행)
        SELECT 
            SUM(CASE WHEN CATEGORY = 'Front End' THEN CODE ELSE 0 END) AS FE_CODE,
            MAX(CASE WHEN NAME = 'Python' THEN CODE ELSE 0 END) AS PY_CODE,
            MAX(CASE WHEN NAME = 'C#' THEN CODE ELSE 0 END) AS CS_CODE
        FROM SKILLCODES
    ) S
) RESULT
WHERE GRADE IS NOT NULL
ORDER BY GRADE, ID;
-- cross join은 ON 조건 없이 카테시안 곱 수행




-- 1. 기준이 되는 스킬 코드들을 미리 정의 (CTE)
WITH SKILL_VALUES AS (
    SELECT 
        SUM(CASE WHEN CATEGORY = 'Front End' THEN CODE ELSE 0 END) AS FE_CODE,
        MAX(CASE WHEN NAME = 'Python' THEN CODE ELSE 0 END) AS PY_CODE,
        MAX(CASE WHEN NAME = 'C#' THEN CODE ELSE 0 END) AS CS_CODE
    FROM SKILLCODES
)

-- 2. 메인 쿼리
SELECT 
    CASE 
        WHEN (D.SKILL_CODE & S.FE_CODE) AND (D.SKILL_CODE & S.PY_CODE) THEN 'A'
        WHEN (D.SKILL_CODE & S.CS_CODE) THEN 'B'
        WHEN (D.SKILL_CODE & S.FE_CODE) THEN 'C'
        ELSE NULL 
    END AS GRADE,
    D.ID, 
    D.EMAIL
FROM DEVELOPERS D, SKILL_VALUES S  -- 여기서 콤마(,)는 CROSS JOIN과 같습니다.
WHERE 
    -- GRADE가 생성되는 조건을 한 번 더 체크 (바깥 쿼리 없이 처리하기 위해)
    (D.SKILL_CODE & S.FE_CODE) OR (D.SKILL_CODE & S.CS_CODE)
ORDER BY GRADE, ID;
-- 이건 조건 체크가 너무 번거롭고 아래 코드가 제일 나음 



-- 최적화 
WITH SKILLVALUES AS (
    SELECT 
        SUM(CASE WHEN CATEGORY = 'Front End' THEN CODE ELSE 0 END) AS FE_CODE,
        MAX(CASE WHEN NAME = 'Python' THEN CODE ELSE 0 END) AS PY_CODE,
        MAX(CASE WHEN NAME = 'C#' THEN CODE ELSE 0 END) AS CS_CODE
    FROM SKILLCODES
)

SELECT *
FROM (
    SELECT
    CASE 
        WHEN (D.SKILL_CODE & S.FE_CODE) AND (D.SKILL_CODE & S.PY_CODE) THEN 'A'
        WHEN (D.SKILL_CODE & S.CS_CODE) THEN 'B'
        WHEN (D.SKILL_CODE & S.FE_CODE) THEN 'C'
        ELSE NULL 
    END AS GRADE,
    D.ID, 
    D.EMAIL
    FROM DEVELOPERS D
    CROSS JOIN SKILLVALUES S
) DEV
WHERE GRADE IS NOT NULL
ORDER BY GRADE, ID;