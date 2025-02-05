-- 코드를 입력하세요
SELECT
    FOOD_TYPE,
    REST_ID,
    REST_NAME,
    FAVORITES
from REST_INFO as ri
where
    FAVORITES = (
        select
            max(FAVORITES)
        from REST_INFO 
        where
            FOOD_TYPE = ri.FOOD_TYPE
    )
group by
    FOOD_TYPE
order by
    FOOD_TYPE desc