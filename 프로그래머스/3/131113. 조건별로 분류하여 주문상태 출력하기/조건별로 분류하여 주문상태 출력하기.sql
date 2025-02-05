-- 코드를 입력하세요
SELECT
    ORDER_ID,
    PRODUCT_ID,
    date_format(OUT_DATE, '%Y-%m-%d'),
    case 
        when DATE '2022-05-01' >= OUT_DATE then '출고완료'
        when DATE '2022-05-01' < OUT_DATE then '출고대기'
    else '출고미정'
    end as 출고여부
from FOOD_ORDER 
# where
#     # DATE '2022-05-01' < OUT_DATE
#     OUT_DATE is null
order by
    ORDER_ID
                   