-- 코드를 입력하세요
SELECT
    u.USER_ID,
    u.NICKNAME,
    sum(b.price) as TOTAL_SALES
from USED_GOODS_USER as u
left join USED_GOODS_BOARD  as b
on b.WRITER_ID = u.USER_ID
where
    b.STATUS = 'DONE'
group by
    b.WRITER_ID,
    u.NICKNAME
having 
    TOTAL_SALES >= 700000
order by
    TOTAL_SALES
