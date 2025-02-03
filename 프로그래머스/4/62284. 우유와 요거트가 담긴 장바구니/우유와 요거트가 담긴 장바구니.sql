-- 코드를 입력하세요
with milk as (
    SELECT
        cart_id,
        name
    from CART_PRODUCTS
    where
        name ='Milk'
), yogurt as (
    select 
        cart_id,
        name
    from CART_PRODUCTS
    where
        name ='Yogurt'
)

select 
    m.cart_id
from milk as m
inner join yogurt as y
on y.cart_id = m.cart_id
order by
    m.cart_id
