-- 코드를 입력하세요
SELECT b.CATEGORY, sum(s.SALES) TOTAL_SALES
from BOOK b
join BOOK_SALES s on b.BOOK_ID=s.BOOK_ID
where s.SALES_DATE like '2022-01%'
group by b.CATEGORY
order by b.CATEGORY

 -- 구하는 게 뭔지 잘 읽기 