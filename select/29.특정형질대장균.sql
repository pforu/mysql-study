-- 코드를 작성해주세요
select count(*) COUNT
from ECOLI_DATA 
where not (GENOTYPE & 2) and ((GENOTYPE & 1) or (GENOTYPE & 4))


(GENOTYPE & 2) > 0 and (GENOTYPE & 1 > 0 or GENOTYPE & 4 > 0)
GENOTYPE & 2 > 0 and GENOTYPE & 5 > 0
(GENOTYPE & (1 | 4)) > 0
-- 비트연산의 결과는 0(겹치는 게 아예 없음) 또는 비트의 가중치(1, 2, 4, ..)
-- not이나 숫자의 t/f 자동판별 대신 조건문 명확하게 쓰는 게 좋음

-- 코드를 작성해주세요
select count(*) COUNT
from ECOLI_DATA 
where (GENOTYPE & 2) = 0 and (GENOTYPE & (1|4)) > 0