-- 코드를 입력하세요
with TOTAL as (
    SELECT
        *
    from FIRST_HALF as fh

    union all 

    select
        *
    from JULY as j
), TOTAL_ORDERS as (
    select 
        FLAVOR,
        sum(TOTAL_ORDER) as TOTAL_ORDER
    from TOTAL
    group by
        FLAVOR
)

select
    FLAVOR
from TOTAL_ORDERS 
order by
    TOTAL_ORDER desc
limit 3