-- 코드를 입력하세요
SELECT concat('/home/grep/src/', b.BOARD_ID, '/', f.FILE_ID, f.FILE_NAME, f.FILE_EXT) FILE_PATH
from (select *, rank() over(order by VIEWS desc) rnk from USED_GOODS_BOARD) b
join USED_GOODS_FILE f on b.BOARD_ID=f.BOARD_ID
where b.rnk=1
order by f.FILE_ID desc
