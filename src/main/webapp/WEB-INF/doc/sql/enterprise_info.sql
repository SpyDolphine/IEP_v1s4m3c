/**********************************/
/* Table Name: 기업정보 */
/**********************************/ 


DROP TABLE enterprise_info;



CREATE TABLE enterprise_info(
    ei_no                             NUMBER(7)            NOT NULL,                        -- 기업정보 번호
    ei_corporationname                VARCHAR2(50)         NOT NULL,                        -- 회사 이름
    ei_slotname                       VARCHAR2(50)         NOT NULL,                        -- 대표자 이름
    ei_crn                            VARCHAR2(50)         NOT NULL,                        -- 사업자등록 번호
    ei_employees                      NUMBER(17)           DEFAULT 0     NULL,              -- 사원수
    ei_established                    VARCHAR2(15)             NULL,                        -- 설립일
    ei_business                       VARCHAR2(50)         NOT NULL,                        -- 직무별 (직종)
    ei_url                            VARCHAR2(500)            NULL,                        -- 회사 URL
    ei_ci                             VARCHAR2(1000)       NOT NULL,                        -- 기업 소개 (Company Introduction)
    ei_majorbusiness                  VARCHAR2(1000)       NOT NULL,                        -- 주요 업무
    ei_logofile1                      VARCHAR2(100)            NULL ,                       -- 로고파일명 1
    ei_logofile2                      VARCHAR2(100)            NULL,                        -- 로고파일명 2
    ei_logosize2                      NUMBER(8)            DEFAULT 0     NULL,              -- 로고크기 2
    ei_map                            VARCHAR2(1024)           NULL,                        -- 회사지도
    ei_tpic                           VARCHAR2(30)         NOT NULL,                        -- 채용담당자
    ei_date                           DATE                 NOT NULL,                        -- 등록날짜
    me_no                             NUMBER(7)            NOT NULL,                        -- 회원 번호
    PRIMARY KEY (ei_no),                                                                    -- 기업정보 번호 PRIMARY KEY
    -- FOREIGN KEY (me_no)      REFERENCES IEP_MEMBER (me_no)                                  -- 회원번호 FOREIGN KEY
);


SELECT * FROM enterprise_info;


-- 기업정보 등록


INSERT INTO enterprise_info (ei_no, me_no, ei_corporationname, ei_slotname, ei_crn, ei_employees, ei_established, 
                             ei_business, ei_url, ei_ci, ei_majorbusiness, ei_logofile1, ei_logofile2, ei_logosize2, 
                             ei_map, ei_tpic, ei_date)
VALUES((SELECT NVL(MAX(ei_no), 0)+1 as ei_no FROM enterprise_info), 1, 'IEP', 'iep', '101-86-50485', 9500, '2009-10-01', 
        'IT·정보통신', 'http://www.soldesk.net/', '인프라웨어는 차별화된 소프트웨어 기술력을 지닌 IT·서비스 전문 기업입니다. 
        글로벌 시장 70% 이상의 점유율 가진 대표 제품 Polaris Office는 스마트폰 및 태블릿PC에 기본 탑재되어 있습니다. 
        기존 모바일 솔루션에 이어 클라우드 기반 오피스 서비스를 2014년 4월 런칭 하였으며, 런칭 1년 반 만에 글로벌 3천만 가입자
        를 확보하였습니다. 특히 3천만 가입자 중 해외 사용자의 비율이 92%로 압도적으로 높다. 미국, 일본, 영국, 독일 등의 비중이 
        45% 이상으로 대표적인 IT 선진국에서 눈에 띄는 성과를 거두며 글로벌 서비스로서의 가능성을 인정받고 있습니다. 
        계열사는 디오텍, 인프라웨어 테크놀러지, 셀바스, 자원메디칼 등이 있습니다.', '전자상거래솔루션 등 소프트웨어', 
        'logo.gif', 'logo.gif', 171379, '지도', '채용', sysdate);
        
     
        
        
        
-- 기업정보 전체 조회

        
SELECT ei_no, me_no, ei_corporationname, ei_slotname, ei_crn, ei_employees, ei_established, ei_business, ei_url, ei_ci, 
       ei_majorbusiness, ei_logofile1, ei_logofile2, ei_logosize2, ei_map, ei_tpic, ei_date
FROM enterprise_info
ORDER BY ei_no ASC;




-- 기업정보 검색 조회


SELECT ei_no, me_no, ei_corporationname, ei_slotname, ei_crn, ei_employees, ei_established, ei_business, ei_url, 
       ei_ci,  ei_majorbusiness, ei_logofile1, ei_logofile2, ei_logosize2, ei_map, ei_tpic, ei_date
FROM enterprise_info
WHERE ei_no = 1;



-- 기업정보 페이징 구현

-- step 3         
SELECT ei_no, me_no, ei_corporationname, ei_slotname, ei_crn, ei_established, ei_business, ei_url, ei_logofile1, 
       ei_logosize1, ei_map, ei_tpic, ei_date, r
FROM(
         SELECT ei_no, me_no, ei_corporationname, ei_slotname, ei_crn, ei_established, ei_business, ei_url, ei_logofile1, 
                ei_logosize1, ei_map, ei_tpic, ei_date, rownum as r 
         FROM(
                  SELECT ei_no, me_no, ei_corporationname, ei_slotname, ei_crn, ei_established, ei_business, ei_url, ei_logofile1, 
                         ei_logosize1, ei_map, ei_tpic, ei_date
                  FROM enterprise_info
                  WHERE me_no=1
                  -- WHERE ei_no=1
                  ORDER BY me_no DESC
         )
)
WHERE r >=1 AND r <= 3;


UPDATE enterprise_info
SET ei_corporationname='IEP', ei_slotname='iep', ei_crn='101-86-50485', ei_employees=9500, ei_established='2009-10-01', 
    ei_business='IT·정보통신', ei_url='http://www.soldesk.net/', ei_ci='인프라웨어는 차별화된 소프트웨어 기술력을 
    지닌 IT·서비스 전문 기업입니다. 글로벌 시장 70% 이상의 점유율 가진 대표 제품 Polaris Office는 스마트폰 및 태블릿PC에 
    기본 탑재되어 있습니다. 기존 모바일 솔루션에 이어 클라우드 기반 오피스 서비스를 2014년 4월 런칭 하였으며, 런칭 1년 반만에 
    글로벌 3천만 가입자를 확보하였습니다. 특히 3천만 가입자 중 해외 사용자의 비율이 92%로 압도적으로 높다. 
    미국, 일본, 영국, 독일 등의 비중이 45% 이상으로 대표적인 IT 선진국에서 눈에 띄는 성과를 거두며 글로벌 
    서비스로서의 가능성을 인정받고 있습니다. 계열사는 디오텍, 인프라웨어 테크놀러지, 셀바스, 자원메디칼 등이 있습니다.', 
    ei_majorbusiness='전자상거래솔루션 등 소프트웨어', ei_logofile1='logo.gif', ei_logofile2='logo.gif', ei_logosize2=171379, 
    ei_map='지도', ei_tpic='채용'    
WHERE ei_no = 1


       
-- 기업정보 삭제
DELETE FROM enterprise_info
WHERE ei_no=1;