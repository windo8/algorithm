-- 코드를 입력하세요
SELECT
    ao.animal_id,
    ao.name
from ANIMAL_OUTS as ao
left join ANIMAL_INS as ai
on ai.animal_id = ao.animal_id
where 
    ai.animal_id is null