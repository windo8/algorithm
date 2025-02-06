-- 코드를 입력하세요
with most_view_board as (
    select
        BOARD_ID
    from USED_GOODS_BOARD 
    order by
        VIEWS desc
    limit 1
)

SELECT
    concat('/home/grep/src/', f.BOARD_ID, '/', f.FILE_ID, f.FILE_NAME,
          f.FILE_EXT) as FILE_PATH
from most_view_board  as b
left join USED_GOODS_FILE  as f
on b.BOARD_ID = f.BOARD_ID
order by
    f.FILE_ID desc

