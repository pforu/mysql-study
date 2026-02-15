-- 코드를 작성해주세요
select i.ITEM_ID, i.ITEM_NAME, i.RARITY
from ITEM_INFO i join ITEM_TREE t on i.ITEM_ID=t.ITEM_ID
where t.PARENT_ITEM_ID in (
    select ITEM_ID
    from ITEM_INFO
    where RARITY='RARE')
order by i.ITEM_ID desc

-- join하면 참조가 아니라 실제로 합쳐진다고 이해하기
-- 특정 정보가 필요하면 미리 뽑아놓고(식별자, 즉 id로) in 판단 가능 