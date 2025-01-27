-- 코드를 입력하세요
# SELECT
#     extract(hour from datetime) as hour,
#     count(distinct animal_id) as count
# from ANIMAL_OUTS 
# group by 
#     hour
# order by
#     hour
WITH RECURSIVE hours AS (
    SELECT 0 AS HOUR
    UNION ALL
    SELECT HOUR + 1 FROM hours WHERE HOUR < 23
)
SELECT 
    h.HOUR,
    COUNT(ANIMAL_OUTS.DATETIME) AS COUNT
FROM 
    hours h
LEFT JOIN 
    ANIMAL_OUTS ON h.HOUR = HOUR(ANIMAL_OUTS.DATETIME)
GROUP BY 
    h.HOUR
ORDER BY 
    h.HOUR;


