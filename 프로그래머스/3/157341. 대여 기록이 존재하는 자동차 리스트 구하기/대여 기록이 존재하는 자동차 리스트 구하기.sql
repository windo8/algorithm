-- 코드를 입력하세요
SELECT
    distinct c.CAR_ID
from CAR_RENTAL_COMPANY_RENTAL_HISTORY as h
left join CAR_RENTAL_COMPANY_CAR as c
on h.CAR_ID = c.CAR_ID
where
    c.CAR_TYPE = '세단'
    and 10 = month(h.START_DATE)
order by
    c.CAR_ID desc