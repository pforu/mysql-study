-- 코드를 입력하세요
SELECT i.REST_ID, i.REST_NAME, i.FOOD_TYPE, i.FAVORITES, i.ADDRESS, round(avg(REVIEW_SCORE), 2) SCORE
from REST_INFO i join REST_REVIEW r on i.REST_ID=r.REST_ID
where i.ADDRESS like '서울%'
group by i.REST_ID
order by SCORE desc, i.FAVORITES desc
                                                            

-- LEFT JOIN시,
-- WHERE 절에서 필터링된 식당 중 리뷰가 하나도 없는 식당이 
-- NULL이라는 하나의 그룹으로 묶여버림
-- i.REST_ID로 묶어야 하고, inner join 사용해야 함 
-- 리뷰가 없는 식당은 점수(SCORE) 칸이 비어있는(NULL) 식당들이 결과에 포함됨 