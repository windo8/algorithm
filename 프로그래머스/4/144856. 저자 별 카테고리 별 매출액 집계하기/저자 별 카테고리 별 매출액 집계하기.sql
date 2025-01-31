-- 코드를 입력하세요
SELECT
    a.AUTHOR_ID,
    a.AUTHOR_NAME,
    b.CATEGORY,
    sum(b.price * sales) as TOTAL_SALES
from BOOK_SALES as bs
left join BOOK as b
on bs.BOOK_ID = b.BOOK_ID
left join AUTHOR as a
on b.AUTHOR_ID = a.AUTHOR_ID
where 
    2022 = year(bs.SALES_DATE)
    and 1 = month(bs.SALES_DATE)
group by
    a.AUTHOR_ID,
    a.AUTHOR_NAME,
    b.CATEGORY
order by
    a.AUTHOR_ID,
    b.CATEGORY desc
    
