
-- #CAR_RENTAL_COMPANY_CAR 
# car_id	car_type	daily_fee	options
# 1	        트럭	       102000	   주차감지센서,열선시트
# 2	        SUV	        148000	    주차감지센서,후방카메라
# 3	        세단	       55000	   스마트키,통풍시트,가죽시트
# 4	        SUV	        150000	  주차감지센서,스마트키,열선시트,후방카메라,가죽시트
# 5	        SUV	        127000	    주차감지센서,스마트키
# 6	        트럭	       133000	   주차감지센서,스마트키
# 7	        승합차	      150000	  스마트키,통풍시트,열선시트,후방카메라
# 8	        트럭	       107000	   주차감지센서,통풍시트,열선시트
# 9	        SUV	         84000	    주차감지센서,스마트키
# 10	    세단	       162000	   주차감지센서,스마트키,후방카메라

-- #CAR_RENTAL_COMPANY_RENTAL_HISTORY
# history_id	car_id	start_date	            end_date
# 506	        15	    2022-08-01 00:00:00	    2022-08-02 00:00:00
# 507	        26	    2022-08-01 00:00:00	    2022-11-09 00:00:00
# 508	        27	    2022-08-01 00:00:00	    2022-08-02 00:00:00
# 510	        29	    2022-08-02 00:00:00	    2022-08-05 00:00:00
# 511	        13	    2022-08-03 00:00:00	    2022-08-07 00:00:00
# 512	        27	    2022-08-03 00:00:00	    2022-08-04 00:00:00
# 513	        28	    2022-08-03 00:00:00	    2022-08-03 00:00:00
# 517	        2	    2022-08-05 00:00:00	    2022-08-07 00:00:00
# 518	        5	    2022-08-05 00:00:00	    2022-08-08 00:00:00
# 519	        23	    2022-08-05 00:00:00	    2022-08-06 00:00:00

-- #TRUCK_DISCOUNT_PLAN
# plan_id	  car_type	 duration_type	discount_rate
# 10	      트럭	    7일 이상	     5(%)
# 11	      트럭	    30일 이상	     8(%)
# 12	      트럭	    90일 이상	     15(%)

-- #TRUCK_RENTAL_HISTORY
# HISTORY_ID	car_id	CAR_TYPE	DAILY_FEE	rental_days
# 524	        8	    트럭	       107000	   1

with TRUCK_DISCOUNT_PLAN as (
    select
        *
    from CAR_RENTAL_COMPANY_DISCOUNT_PLAN  
    where 
        CAR_TYPE = '트럭'
), TRUCK_RENTAL_HISTORY as (
    select 
        history.HISTORY_ID,
        history.car_id,
        car.DAILY_FEE,
        datediff(END_DATE, START_DATE) + 1 as RENTAL_DAYS
    from CAR_RENTAL_COMPANY_RENTAL_HISTORY as history
    left join CAR_RENTAL_COMPANY_CAR  as car
    on history.CAR_ID = car.CAR_ID
    where 
        car.CAR_TYPE = '트럭'
)

select 
    h.HISTORY_ID,
    round(
        h.DAILY_FEE * h.RENTAL_DAYS * (1 - ifnull(
            (select 
                max(DISCOUNT_RATE)
             from TRUCK_DISCOUNT_PLAN as d
             where 
                case 
                   when h.RENTAL_DAYS >= 90 then d.DURATION_TYPE = '90일 이상'
                   when h.RENTAL_DAYS between 30 and 89 then d.DURATION_TYPE = '30일 이상'
                   when h.RENTAL_DAYS between 7 and 29 then d.DURATION_TYPE = '7일 이상'
                   else FALSE
                end
            ) / 100, 0)
        ), 0
    ) as FEE
from TRUCK_RENTAL_HISTORY as h
order by 
    FEE desc, 
    HISTORY_ID desc
     
    



