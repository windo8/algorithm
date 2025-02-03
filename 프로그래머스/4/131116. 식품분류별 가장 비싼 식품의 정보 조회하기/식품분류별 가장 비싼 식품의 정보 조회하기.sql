-- 코드를 입력하세요
# with products as (
#     select 
#         category,
#         price,
#         product_name,
#         ROW_NUMBER() OVER (PARTITION BY category ORDER BY price DESC) as rank
#     from FOOD_PRODUCT 
# )

# select 
#     category,
#     price as max_price,
#     product_name
# from products
# where 
#     rank = 1
# order by 
#     max_price desc
-- #1. PARTITION BY category: 결과를 category별로 그룹화합니다.
-- #2. ORDER BY price DESC: 각 category 내에서 price를 기준으로 내림차순 정렬합니다.
-- #3. ROW_NUMBER(): 정렬된 각 행에 순차적인 번호를 부여합니다.


# select
#     category,
#     max(price) as max_price,
#     product_name
# from FOOD_PRODUCT
# where
#     category in ('과자', '국', '김치', '식용유')
# group by 
#     category,
#     product_name
# order by
#     max_price desc

SELECT
    category,
    price as max_price,
    product_name
FROM FOOD_PRODUCT as fp
WHERE price = (
    SELECT 
        MAX(price) 
    FROM FOOD_PRODUCT 
    WHERE 
        category = fp.category
        and category in ('과자', '국', '김치', '식용유')
)
order by
    max_price desc
