-- 코드를 입력하세요
SELECT
    CAR_ID,
    case 
        when sum(case 
                    when '2022-10-16' between START_DATE and END_DATE 
                    then 1 else 0 
                 end) > 0 
        then '대여중' 
        else '대여 가능' 
    end as AVAILABILITY
from CAR_RENTAL_COMPANY_RENTAL_HISTORY
group by
    CAR_ID
order by
    CAR_ID desc


# CASE WHEN으로 대여 여부 확인
# 특정 날짜(2022-10-16)에 대여 중인지 확인해야 함.
# MAX(END_DATE) >= '2022-10-16' → 해당 자동차의 가장 늦은 반납 날짜가 10월 16일 이후라면, 대여 중일 가능성이 있음.
# MIN(START_DATE) <= '2022-10-16' → 해당 자동차의 가장 빠른 대여 시작 날짜가 10월 16일 이전이라면, 해당 기간 내 대여된 적이 있음.
