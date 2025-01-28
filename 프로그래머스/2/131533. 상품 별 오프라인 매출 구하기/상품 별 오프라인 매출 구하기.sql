-- 코드를 입력하세요
SELECT
    p.product_code,
    sum(os.sales_amount) * p.price as SALES
from OFFLINE_SALE as os
left join PRODUCT as p
on os.PRODUCT_ID = p.PRODUCT_ID
group by
    p.product_code
order by
    SALES desc, 
    p.product_code

-- # 검증
# SELECT
#     *
# from OFFLINE_SALE as os
# left join PRODUCT as p
# on os.PRODUCT_ID = p.PRODUCT_ID
# where 
#     p.product_code = 'A3000001'
