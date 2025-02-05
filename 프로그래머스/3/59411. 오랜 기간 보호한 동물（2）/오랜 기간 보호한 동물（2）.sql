-- 코드를 입력하세요
SELECT
    ai.ANIMAL_ID,
    ai.NAME
from ANIMAL_INS as ai
inner join ANIMAL_OUTS as ao
on ai.ANIMAL_ID = ao.ANIMAL_ID
order by
    date(ao.DATETIME) - date(ai.DATETIME) desc
limit 2
  