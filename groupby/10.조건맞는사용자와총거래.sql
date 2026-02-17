-- 코드를 입력하세요
SELECT b.WRITER_ID, u.NICKNAME, sum(b.PRICE) TOTAL_SALES
from USED_GOODS_BOARD b
join USED_GOODS_USER u on b.WRITER_ID=u.USER_ID
where b.WRITER_ID in (select WRITER_ID from USED_GOODS_BOARD where STATUS='DONE' group by WRITER_ID having sum(PRICE)>=700000) and b.STATUS='DONE'
group by b.WRITER_ID
order by TOTAL_SALES

-- 코드를 입력하세요
select sub.WRITER_ID, u.NICKNAME, TOTAL_SALES
from USED_GOODS_USER u
join (select WRITER_ID, sum(PRICE) TOTAL_SALES
     from USED_GOODS_BOARD
     where STATUS='DONE'
     group by WRITER_ID
     having sum(PRICE)>=700000) sub on u.USER_ID=sub.WRITER_ID
order by TOTAL_SALES
-- 인라인뷰로 할 경우 서브/메인쿼리의 중복이 없어짐, 가장 깔끔 

-- 코드를 입력하세요
SELECT b.WRITER_ID, u.NICKNAME, sum(b.PRICE) TOTAL_SALES
from USED_GOODS_BOARD b
join USED_GOODS_USER u on b.WRITER_ID=u.USER_ID
where b.STATUS='DONE' and 
    exists(
        select 1
        from USED_GOODS_BOARD tmp
        where STATUS='DONE' and tmp.WRITER_ID=b.WRITER_ID
        group by WRITER_ID
        having sum(PRICE)>=700000)
group by b.WRITER_ID
order by TOTAL_SALES
-- exists 써도 맨 위 중첩 서브쿼리랑 사실상 비슷해서 계산 한 번 더 해야 함 


-- 스칼라 서브쿼리: SELECT 절, 결과로 단 하나의 값(1행 1열)만 반환해야 합니다.
-- 인라인 뷰: FROM 절, 서브쿼리 결과가 마치 가상 테이블처럼 작동합니다. 별칭(Alias)이 필수입니다.
-- 중첩 서브쿼리: WHERE / HAVING 절, 조건을 걸 때 사용하며, 반환 값의 형태에 따라 다시 나뉩니다.
--  - 단일 행 서브쿼리: 결과가 딱 1줄인 경우. =, <, > 연산자 사용.
--  - 다중 행 서브쿼리: 결과가 여러 줄인 경우. IN, ANY, ALL, EXISTS 연산자 사용.
--  - 다중 컬럼 서브쿼리: 결과가 여러 열(Column)인 경우. WHERE (A, B) IN (SELECT A, B ...) 처럼 사용.

-- 비상관 서브쿼리: 서브쿼리 먼저 1회 실행 → 그 결과를 메인 쿼리가 사용.
-- WHERE ID IN (SELECT ID FROM TABLE_B) 

-- 상관 서브쿼리: 서브쿼리 안에 메인 쿼리의 컬럼이 들어가 있음,
-- 메인 쿼리의 한 행 한 행마다 서브쿼리가 계속 다시 계산
-- WHERE EXISTS (SELECT 1 FROM TABLE_B b WHERE b.ID = a.ID)
-- 인라인뷰는 상관이 불가 