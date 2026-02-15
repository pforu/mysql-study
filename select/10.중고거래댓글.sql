-- 코드를 입력하세요
SELECT b.TITLE, b.BOARD_ID, r.REPLY_ID, r.WRITER_ID, r.CONTENTS, date_format(r.CREATED_DATE, '%Y-%m-%d') CREATED_DATE
from USED_GOODS_BOARD b join USED_GOODS_REPLY r on b.BOARD_ID = r.BOARD_ID
where b.CREATED_DATE like '2022-10%'
order by r.CREATED_DATE, b.TITLE

-- 문제 조건 잘 읽기, 칼럼명 잘 읽기, join 시 전체에 별칭으로 출처 달아주기
-- select에서 함수 사용 시 칼럼명 새로 부여 확인 