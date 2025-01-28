-- 코드를 입력하세요
with total_user as (
    select 
        count(*) as total
    from USER_INFO 
    where
     2021 = year(joined)
), monthly_purchases as (
    SELECT
        extract(year from os.SALES_DATE) as year,
        extract(month from os.SALES_DATE) as month,
        count(distinct ui.user_id) as purchased_users
    from ONLINE_SALE  as os
    left join USER_INFO  as ui
    on ui.user_id = os.user_id
    where
         2021 = extract(year from ui.joined)
    group by 
        year,
        month
)
select 
    year,
    month,
    purchased_users,
    round(purchased_users / total, 1)
from total_user, monthly_purchases