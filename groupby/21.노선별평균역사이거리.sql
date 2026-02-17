-- 코드를 작성해주세요
select ROUTE, concat(round(sum(D_BETWEEN_DIST), 1), 'km') TOTAL_DISTANCE, concat(round(avg(D_BETWEEN_DIST), 2), 'km') AVERAGE_DISTANCE
from SUBWAY_DISTANCE 
group by ROUTE
order by sum(D_BETWEEN_DIST) desc
-- 정말주의:: TOTAL_DISTANCE는 concat한 문자열, 이건 수일 때와 정렬이 다름
-- sum(D_BETWEEN_DIST)이라고 원본값으로 정렬해야 함 