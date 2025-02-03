-- 코드를 작성해주세요
-- 평가 등급 점수별 grade 80 <= C
-- 성과금 = 연봉의 +N% 80 <= 0%

-- # HR_DEPARTMENT
# DEPT_ID	DEPT_NAME_KR	DEPT_NAME_EN	  LOCATION
# D0001	    법무팀	          Law Dep	        그렙타워 4층
# D0002	    인사팀	          Human resources	그렙타워 4층
# D0003	    총무팀	          General Affairs	그렙타워 4층


-- # HR_EMPLOYEE
# EMP_NO	EMP_NAME	DEPT_ID	POSITION	EMAIL	                COMP_TEL	    HIRE_DATE	 SAL
# 2017002	정호식	      D0001	  팀장	     hosick_jung@grep.com	 031-8000-1101	 2017-03-01	  65000000
# 2018001	김민석	      D0001	  팀원	     minseock_kim@grep.com	 031-8000-1102	 2018-03-01	  60000000
# 2019001	김솜이	      D0002	  팀장	     somi_kim@grep.com	     031-8000-1106	 2019-03-01	  60000000
# 2020002	김연주	      D0002	  팀원	     yeonjoo_kim@grep.com	 031-8000-1107	 2020-03-01	  53000000
# 2020005	양성태	      D0003	  팀원	     sungtae_yang@grep.com	 031-8000-1112	 2020-03-01	  53000000


-- # HR_GRADE
# EMP_NO	YEAR	HALF_YEAR	SCORE
# 2017002	2022	1	        92
# 2017002	2022	2	        84
# 2018001	2022	1	        89
# 2018001	2022	2	        89
# 2019001	2022	1	        94
# 2019001	2022	2	        81
# 2020002	2022	1	        90
# 2020002	2022	2	        91
# 2020005	2022	1	        92
# 2020005	2022	2	        81

-- 📌 문제 해결 접근 방법

-- # HR_GRADE 
-- 한 명의 사원이 1년 동안 두 번의 평가(상반기, 하반기)를 받으므로 평균 점수를 구해야 함
-- 점수 기준에 따라 S, A, B, C 등급을 부여
with grades as (
    select 
        EMP_NO,
        case 
            when avg(score) >= 96 then 'S' 
            when avg(score) >= 90 then 'A' 
            when avg(score) >= 80 then 'B' 
            else 'C' 
        end as GRADE
    from HR_GRADE
    group by 
        EMP_NO    
)

-- HR_EMPLOYEES - LEFT JOIN - GRADES
-- SAL * (성과금 비율)로 계산
-- CASE WHEN을 사용하여 등급에 맞는 보너스 금액을 산정
-- S: 20%, A: 15%, B: 10%, C: 0%.
select 
    he.EMP_NO,
    he.EMP_NAME,
    g.grade,
    case
        when GRADE = 'S' then round(he.sal * 0.2)
        when GRADE = 'A' then round(he.sal * 0.15)
        when GRADE = 'B' then round(he.sal * 0.1)
        else 0
    end as BONUS
from HR_EMPLOYEES as he
left join GRADES as g
on he.EMP_NO = g.EMP_NO
order by 
    he.EMP_NO
    
-- ✅ 1️⃣ CTE를 사용하여 코드 가독성 및 성능 최적화
-- ✅ 2️⃣ AVG(SCORE) 사용으로 사원의 연평균 점수 정확하게 계산
-- ✅ 3️⃣ CASE WHEN을 활용하여 등급과 성과금 처리
-- ✅ 4️⃣ ROUND()를 사용하여 보너스 금액을 정수로 변환
-- ✅ 5️⃣ 사번(EMP_NO) 기준으로 ORDER BY를 적용하여 정렬


