-- 코드를 입력하세요
SELECT
    aptm.APNT_NO,
    p.PT_NAME,
    p.PT_NO,
    d.MCDP_CD,
    d.DR_NAME,
    aptm.APNT_YMD
from APPOINTMENT as aptm
left join PATIENT as p
on aptm.PT_NO = p.PT_NO
left join DOCTOR as d
on aptm.MDDR_ID = d.DR_ID
where
    aptm.APNT_CNCL_YN = 'N'
    and d.MCDP_CD = 'CS'
    and date(aptm.APNT_YMD) = '2022-04-13'
order by
    aptm.APNT_YMD 
    
    