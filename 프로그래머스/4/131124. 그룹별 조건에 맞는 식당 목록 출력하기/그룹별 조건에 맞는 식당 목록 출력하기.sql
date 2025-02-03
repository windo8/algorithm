-- 코드를 입력하세요
select
    mp.MEMBER_NAME,
    rr.REVIEW_TEXT,
    date_format(rr.REVIEW_DATE, '%Y-%m-%d')
from REST_REVIEW as rr
left join MEMBER_PROFILE as mp
on rr.MEMBER_ID = mp.MEMBER_ID
where
    rr.MEMBER_ID = (
        SELECT
            MEMBER_ID
        from REST_REVIEW 
        group by
            MEMBER_ID
        order by
            count(distinct REVIEW_ID) desc
        limit 1
    )
order by
    rr.REVIEW_DATE,
    REVIEW_TEXT