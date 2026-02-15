-- 코드를 작성해주세요
select c.ID, c.GENOTYPE GENOTYPE, p.GENOTYPE PARENT_GENOTYPE
from ECOLI_DATA c
join ECOLI_DATA p on c.PARENT_ID=p.ID 
where (c.GENOTYPE & p.GENOTYPE) = p.GENOTYPE -- 부모 형질 모두 가짐 
order by c.ID

-- left join의 경우, 부모가 없으니 p.GENOTYPE 값은 NULL
-- 그럼 (c.GENOTYPE & NULL)으로, NULL은 비트연산이 불가능해서 런타임에러 