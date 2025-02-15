-- 코드를 작성해주세요
WITH ranked_fish AS (
    SELECT 
        fi.ID, 
        fni.FISH_NAME, 
        COALESCE(fi.LENGTH, 10) AS LENGTH,
        RANK() OVER (PARTITION BY fi.FISH_TYPE ORDER BY COALESCE(fi.LENGTH, 10) DESC) AS rank_value
    FROM FISH_INFO AS fi
    LEFT JOIN FISH_NAME_INFO AS fni
    ON fi.FISH_TYPE = fni.FISH_TYPE
    WHERE fi.LENGTH > 10
)
SELECT 
    ID, 
    FISH_NAME, 
    LENGTH
FROM ranked_fish
where
    rank_value = 1
ORDER BY 
    ID



