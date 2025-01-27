-- 코드를 입력하세요
SELECT
    extract(hour from datetime) as hour,
    count(datetime) as count
from animal_outs
where 
    TIME(datetime) BETWEEN '09:00:00' AND '19:59:59'
group by 
    hour
order by
    hour