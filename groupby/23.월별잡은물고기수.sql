-- 코드를 작성해주세요
select count(*) FISH_COUNT, month(TIME) MONTH
from FISH_INFO 
group by MONTH
order by MONTH

-- 월 2자리 포맷팅
-- SELECT LPAD(MONTH(기록일), 2, '0') AS MONTH_STR
-- SELECT DATE_FORMAT(기록일, '%m') AS MONTH_STR