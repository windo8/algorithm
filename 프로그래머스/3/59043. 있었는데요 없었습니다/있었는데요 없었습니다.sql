-- 코드를 입력하세요
SELECT
    ai.animal_id,
    ai.name
from ANIMAL_OUTS as ao
inner join ANIMAL_INS as ai
on ao.animal_id = ai.animal_id
where 
    ai.DATETIME > ao.DATETIME
order by
    ai.DATETIME 