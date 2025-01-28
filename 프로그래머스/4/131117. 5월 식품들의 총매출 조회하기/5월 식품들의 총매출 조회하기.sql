-- 코드를 입력하세요
SELECT
    fp.product_id,
    fp.product_name,
    sum(fp.price * fo.amount) as total_sales
from FOOD_PRODUCT as fp
left join FOOD_ORDER  as fo
on fo.PRODUCT_ID = fp.PRODUCT_ID
where
    2022 = year(fo.PRODUCE_DATE)
    and 5 = month(fo.PRODUCE_DATE)
group by 
    fp.product_id,
    fp.product_name
order by
    total_sales desc,
    fp.product_id