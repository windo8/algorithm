-- 코드를 입력하세요
with heavy_user_host_id as (
    SELECT
        HOST_ID
    from PLACES 
    group by
        HOST_ID
    having
        count(*) >= 2
)

select 
    *
from PLACES
where
    HOST_ID in (
        select
            HOST_ID
        from heavy_user_host_id 
    )
order by
    id
