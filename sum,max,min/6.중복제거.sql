-- 코드를 입력하세요
SELECT count(distinct NAME) count
from ANIMAL_INS 
-- where NAME is not null -- 필요없음, distinct는 자동으로 null 제외 

