-- 코드를 작성해주세요
select concat(max(LENGTH), 'cm') MAX_LENGTH
from FISH_INFO 


CONCAT('ID: ', ID, ' / 이름: ', FISH_NAME) -- 여러 인자 가능
CONCAT('길이: ', NULL, 'cm') -- 하나라도 null이면 NULL
SELECT CONCAT_WS('-', '2026', '02', '16') -- 결과: 2026-02-16
SELECT CAST(123 AS CHAR) -- 숫자를 문자열로 강제 변환