-- 코드를 입력하세요
with car_rental_history as (
    SELECT
        *
    from CAR_RENTAL_COMPANY_RENTAL_HISTORY 
    where
        year(START_DATE) = 2022 and month(START_DATE) between 8 and 10
), RECORDS_gte_5 as (
    SELECT
        CAR_ID
    from car_rental_history
    group by
        CAR_ID
    having 
        count(history_id) >= 5
)

SELECT
    month(START_DATE) as MONTH,
    CAR_ID,
    count(HISTORY_ID) as RECORDS
from car_rental_history 
where 
    CAR_ID in (
        select
            CAR_ID
        from RECORDS_gte_5
    )
group by
    MONTH,
    CAR_ID
order by
    MONTH,
    CAR_ID desc
    
    
