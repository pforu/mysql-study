-- 코드를 입력하세요
SELECT FACTORY_ID, FACTORY_NAME, ADDRESS
from FOOD_FACTORY
where ADDRESS like '강원도%'
order by FACTORY_ID

-- '강원도%': 강원도로 시작하는 데이터
-- '%강원도': 강원도로 끝나는 데이터
-- '%강원도%': 중간에 강원도가 포함된 모든 데이터
