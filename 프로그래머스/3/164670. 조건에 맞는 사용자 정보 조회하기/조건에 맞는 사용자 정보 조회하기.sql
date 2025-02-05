-- 코드를 입력하세요
SELECT
    u.USER_ID,
    u.NICKNAME,
    concat(u.CITY, ' ', u.STREET_ADDRESS1, ' ', u.STREET_ADDRESS2) as 전체주소,
    concat(substring(u.TLNO, 1, 3), '-',
           substring(u.TLNO, 4, 4), '-',
           substring(u.TLNO, 8, 4)) as 전화번호
from USED_GOODS_BOARD as b
left join USED_GOODS_USER as u 
on b.WRITER_ID = u.USER_ID
group by
    u.USER_ID,
    u.NICKNAME,
    전체주소,
    전화번호
having
    count(b.BOARD_ID) >= 3
order by
    u.USER_ID desc

# USER_ID	NICKNAME	POST_COUNT
# xlqpfh2	잉여킹	        5
# xlaortm1	투더문	        4
# spdlqj12	크크큭	        6
# s2s2123	이회장	        3
# miyeon89	러브러브	   4
# kwag98	미금러	        3
# hwahwa2	당근	         3
# hong02	자바한명	    5
# hoho1112	코딩쟁이	    3
# hakju88	에코	          4
# dhfkzmf09	찐찐	         5

# SELECT
#     u.USER_ID,
#     u.NICKNAME,
#     COUNT(b.BOARD_ID) AS POST_COUNT  -- ✅ 유저별 게시글 개수 계산
# FROM USED_GOODS_BOARD AS b
# LEFT JOIN USED_GOODS_USER AS u 
# ON b.WRITER_ID = u.USER_ID
# GROUP BY 
#     u.USER_ID,
#     u.NICKNAME  -- ✅ BOARD_ID 제거
# HAVING 
#     COUNT(b.BOARD_ID) >= 3  -- ✅ 유저별 게시글 개수가 3개 이상인 경우
# ORDER BY 
#     u.USER_ID DESC;


