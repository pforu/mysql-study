-- 코드를 작성해주세요
select
    ID, 
    case
        when PER<=0.25 then 'CRITICAL'
        when PER<=0.50 then 'HIGH'
        when PER<=0.75 then 'MEDIUM'
        else 'LOW'
    end COLONY_NAME
from (
    select ID, percent_rank() over (order by SIZE_OF_COLONY desc) PER
    from ECOLI_DATA) as sub
order by ID 

-- 윈도우 함수, 칼럼을 새로 붙인 새로운 테이블 반환 
함수(컬럼) OVER (
  [PARTITION BY 컬럼] -- 어디서 계산을 끊어갈 것인가?
  [ORDER BY 컬럼]     -- 어떤 순서로 계산할 것인가?
  [ROWS | RANGE BETWEEN 시작 AND 끝] -- 현재 행 기준 어디까지 계산에 넣을 것인가?
) -- 괄호 필수

-- from 절의 서브쿼리는 새로운 가상 테이블 만드는 것, as ALIAS로 테이블 명 부여 필수

-- select 절의 서브쿼리는 모든 행에 한 칸씩 더 붙이는 것, 스칼라 서브쿼리 
SELECT 
    ID, 
    (SELECT COUNT(*) FROM ECOLI_DATA) AS TOTAL_COUNT -- 모든 행 옆에 전체 개수를 붙여줌
FROM ECOLI_DATA;

-- where 절의 서브쿼리는 in을 쓰기 위해 목록 만드는 것, 서브쿼리 필터 
SELECT * FROM ECOLI_DATA
WHERE PARENT_ID IN (SELECT ID FROM ECOLI_DATA WHERE SIZE_OF_COLONY > 1000);
-- 크기가 1000 넘는 부모를 둔 자식들만 골라내기