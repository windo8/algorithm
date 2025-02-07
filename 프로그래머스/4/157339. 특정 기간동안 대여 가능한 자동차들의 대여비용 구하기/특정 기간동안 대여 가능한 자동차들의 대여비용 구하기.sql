-- 코드를 입력하세요
with available_cars  as (
    SELECT
        c.CAR_ID,
        c.CAR_TYPE,
        c.DAILY_FEE
    from CAR_RENTAL_COMPANY_CAR  as c
    where
        c.CAR_TYPE in ('SUV', '세단')
        and not exists (
            select 
                1
            from CAR_RENTAL_COMPANY_RENTAL_HISTORY as h
            where
                h.CAR_ID = c.CAR_ID
                and h.START_DATE <= '2022-11-30'
                and h.END_DATE >= '2022-11-01'
        )
-- not (h.START_DATE <= '2022-11-30' and h.END_DATE >= '2022-11-01') 
), suv_세단_discount as (
    select 
        CAR_TYPE,
        DURATION_TYPE,
        DISCOUNT_RATE
    from CAR_RENTAL_COMPANY_DISCOUNT_PLAN 
    where
        CAR_TYPE in ('SUV', '세단')
        and DURATION_TYPE = '30일 이상'
), final_prices as(
    select 
        a.CAR_ID,
        a.CAR_TYPE,
        round(a.DAILY_FEE * (1 - coalesce(d.DISCOUNT_RATE, 0) / 100), 0) * 30 as FEE
    from available_cars  as a
    left join suv_세단_discount as d
    on a.CAR_TYPE = d.CAR_TYPE
)

select 
    CAR_ID,
    CAR_TYPE,
    FEE
from final_prices
where 
    FEE between 500000 and 2000000
order by
    FEE desc,
    CAR_TYPE,
    CAR_ID desc
    
