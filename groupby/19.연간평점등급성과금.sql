-- 코드를 작성해주세요
with info as (
    select EMP_NO, 
        case 
            when SCORE>=96 then 1
            when SCORE>=90 then 2
            when SCORE>=80 then 3
            else 4
        end gradeinfo
    from (
        select EMP_NO, avg(SCORE) SCORE
        from HR_GRADE
        group by EMP_NO
    ) z
)

select e.EMP_NO, e.EMP_NAME, 
    if(i.gradeinfo=1, 'S',
       if(i.gradeinfo=2, 'A',
         if(i.gradeinfo=3, 'B',
           'C'))) as GRADE,
    if(i.gradeinfo=1, 0.20,
       if(i.gradeinfo=2, 0.15,
         if(i.gradeinfo=3, 0.10,
           0.00))) * e.SAL as BONUS
from HR_EMPLOYEES e
join info i on e.EMP_NO=i.EMP_NO
order by e.EMP_NO




WITH GRADE_CALC AS (
    -- 사원별 평균 점수와 그에 따른 등급/비율을 한 번에 계산
    SELECT 
        EMP_NO,
        CASE 
            WHEN AVG(SCORE) >= 96 THEN 'S'
            WHEN AVG(SCORE) >= 90 THEN 'A'
            WHEN AVG(SCORE) >= 80 THEN 'B'
            ELSE 'C' 
        END AS GRADE,
        CASE 
            WHEN AVG(SCORE) >= 96 THEN 0.2
            WHEN AVG(SCORE) >= 90 THEN 0.15
            WHEN AVG(SCORE) >= 80 THEN 0.1
            ELSE 0 
        END AS BONUS_RATIO
    FROM HR_GRADE
    GROUP BY EMP_NO
)

SELECT 
    E.EMP_NO, 
    E.EMP_NAME, 
    G.GRADE, 
    E.SAL * G.BONUS_RATIO AS BONUS
FROM HR_EMPLOYEES E
JOIN GRADE_CALC G ON E.EMP_NO = G.EMP_NO
ORDER BY E.EMP_NO;



-- 보통 GROUP BY를 하면 SELECT 절에는 두 가지 종류만 올 수 있음
-- 기준 컬럼: GROUP BY 뒤에 적어준 칼럼 (EMP_NO)
-- 집계 함수: 그 그룹을 뭉쳐서 계산한 결과 (AVG, SUM, COUNT 등)

-- 집계 함수 안에 '조건 CASE'이나 '중복 제거 DISTINCT' 넣기
-- COUNT(DISTINCT ID): 중복 제외하고 몇 명인지 셀 때.
-- SUM(CASE WHEN GENDER='M' THEN 1 ELSE 0 END): 남자 수만 따로 합칠 때.