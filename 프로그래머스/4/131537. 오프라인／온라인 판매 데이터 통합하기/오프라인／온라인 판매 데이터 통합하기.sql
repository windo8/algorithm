-- 코드를 입력하세요
with all_data as (
    SELECT
        SALES_DATE,
        PRODUCT_ID,
        USER_ID,
        SALES_AMOUNT
    FROM ONLINE_SALE
    where
        2022 = year(SALES_DATE)
        and 3 = month(SALES_DATE)

    union all

    select 
        SALES_DATE,
        PRODUCT_ID,
        null as USER_ID,
        SALES_AMOUNT
    from OFFLINE_SALE
    where
        2022 = year(SALES_DATE)
        and 3 = month(SALES_DATE)
)

select
    date_format(SALES_DATE,'%Y-%m-%d') as SALES_DATE,
    PRODUCT_ID,
    USER_ID,
    SALES_AMOUNT
from all_data
order by
    SALES_DATE,
    PRODUCT_ID,
    USER_ID