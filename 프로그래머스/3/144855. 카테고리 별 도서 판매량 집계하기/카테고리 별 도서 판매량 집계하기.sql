-- 코드를 입력하세요
SELECT
    b.category,
    sum(bs.sales)
from BOOK_SALES as bs
left join BOOK as b
on bs.book_id = b.book_id
where
    2022 = year(bs.sales_date)
    and 1 = month(bs.sales_date)
group by 
    b.category
order by
    b.category