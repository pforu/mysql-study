-- 코드를 입력하세요
SELECT u.USER_ID, u.NICKNAME, concat_ws(' ', CITY, STREET_ADDRESS1, STREET_ADDRESS2) 전체주소, insert(insert(TLNO, 4, 0, '-'), 9, 0, '-') 전화번호
from USED_GOODS_BOARD b
join USED_GOODS_USER u on b.WRITER_ID=u.USER_ID
group by b.WRITER_ID
having count(*)>=3
order by u.USER_ID desc


-- 전화번호 출력
SELECT CONCAT(SUBSTR(phone, 1, 3), '-', SUBSTR(phone, 4, 4), '-', SUBSTR(phone, 8, 4)) AS formatted_phone
SELECT REGEXP_REPLACE(phone, '(^[0-9]{3})([0-9]{3,4})([0-9]{4})$', '$1-$2-$3') as phone_format

-- 문자열 함수 
-- 첫 인덱스는 1임 
-- 자릿수 맞춰 채우기: RPAD, LPAD('12', 5, '0') → 00012    
-- 앞뒤 공백 제거: TRIM, LTRIM, RTRIM(' asdf  ')
-- 문자열 치환: REPLACE('010-1234-5678', '-', '')
-- 위치 반환: INSTR('abc@gmail.com', '@') → 4
-- 대소문자 변환: UPPER, LOWER(email)

-- 문자열 슬라이싱: SUBSTR(phone, 4, 4) : 4번째부터 길이 4만큼 

-- 특정 문자 기준으로 슬라이싱 
-- email = 'ai.assistant.gemini@google.com'
-- SUBSTRING_INDEX(email, '@', 1) → 'ai.assistant.gemini' : 첫 번째 @ 기준 왼쪽 전체
-- SUBSTRING_INDEX(email, '@', -1) → 'google.com' : 첫 번째 @ 기준 오른쪽 전체
-- SUBSTRING_INDEX(email, '.', 2) → 'ai.assistant' : 두 번째 . 기준 왼쪽 전체
-- '서울시-강남구-역삼동'에서 '강남구' 뽑기
-- SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(addr, '-', 2), '-', -1)
-- 칼럼에 문자열 부여 
-- SELECT 
--     SUBSTRING_INDEX(email, '@', 1) AS ID,
--     SUBSTRING_INDEX(email, '@', -1) AS DOMAIN