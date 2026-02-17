-- 코드를 입력하세요
SELECT j.FLAVOR
from JULY j
left join FIRST_HALF f on j.SHIPMENT_ID=f.SHIPMENT_ID
group by j.FLAVOR
order by sum(ifnull(j.TOTAL_ORDER, 0))+sum(ifnull(f.TOTAL_ORDER, 0)) desc
limit 3

-- null 포함한 계산은 결과가 null, ifnull() 써야 함 
-- left join을 했을 경우, 묶은 기준 칼럼을 제외하고는, 양쪽에 있을 것 같아도 웬만하면 왼쪽에서 접근 
-- 데이터가 더 많은 쪽을 무조건 left에 둬야 함