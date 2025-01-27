-- 코드를 입력하세요
SELECT
    ai.name,
    ai.datetime
from ANIMAL_INS as ai
left join ANIMAL_OUTS as ao
on ao.animal_id = ai.animal_id
where
    ao.animal_id is null
order by 
    ai.datetime
limit 3