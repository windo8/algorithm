-- 코드를 입력하세요
SELECT
    ai.animal_id,
    ai.animal_type,
    ai.name
from ANIMAL_INS as ai
left join ANIMAL_OUTS as ao
on ao.animal_id = ai.animal_id
where
    ai.SEX_UPON_INTAKE in ('Intact Male', 'Intact Female')
    and ao.SEX_UPON_OUTCOME in ('Neutered Male', 'Spayed Female')
