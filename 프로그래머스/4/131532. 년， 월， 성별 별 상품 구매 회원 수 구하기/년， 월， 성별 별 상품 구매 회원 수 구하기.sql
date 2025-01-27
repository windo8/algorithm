-- 코드를 입력하세요
with basic as (
    SELECT
        *
    from user_info
    where 
        gender is not null
)

select 
    # *
    extract(year from os.sales_date) as year,
    extract(month from os.sales_date) as month,
    b.gender,
    count(distinct os.user_id) as users
from online_sale as os
inner join basic as b
on b.user_id = os.user_id
group by 
    year, month, b.gender
order by 
    year, month, gender