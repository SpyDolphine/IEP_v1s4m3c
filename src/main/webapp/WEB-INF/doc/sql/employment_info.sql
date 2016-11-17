/**********************************/
/* Table Name: 채용정보 */
/**********************************/



DROP TABLE blogcategory;
DROP TABLE code; 

DROP TABLE board;
DROP TABLE division;
DROP TABLE category;
DROP TABLE IEP_MEMBER;
DROP TABLE employment_info;

CREATE TABLE employment_info(
    -- boardno                        NUMBER(7)        NOT NULL      PRIMARY KEY,      -- 게시판 번호
    -- boardno                           NUMBER(7)        NOT NULL,                       -- 게시판 번호
    -- divisionno                        NUMBER(7)        NOT NULL,                       -- 카테고리번호
    -- ei_no                          NUMBER(7)        NOT NULL       PRIMARY KEY,     -- 기업정보 번호
    -- ei_no                             NUMBER(7)        NOT NULL,                       -- 기업정보 번호
    -- em_no                          NUMBER(7)        NOT NULL       PRIMARY KEY,     -- 채용정보 번호
    em_no                             NUMBER(7)        NOT NULL,                       -- 채용정보 번호   
    em_title                          VARCHAR2(120)    NOT NULL,                       -- 채용 제목
    -- em_content                        VARCHAR2(4000)   NOT NULL,                       -- 채용 내용                 
    -- em_mainbusiness                   VARCHAR2(1000)   NOT NULL,                       -- 주요 업무
    em_cof                            VARCHAR2(1000)   NOT NULL,                       -- 자격 요건 (핵샘 직무 영량)
    em_pi                             VARCHAR2(1000)   NOT NULL,                       -- 자격 요건 (우대사항)
    em_rp                             VARCHAR2(1000)   NOT NULL,                       -- 채용절차
    em_howtoapply                     VARCHAR2(1000)   NOT NULL,                       -- 채용절차 (지원방법)
    em_occupations                    VARCHAR2(30)     NOT NULL,                       -- 상세정보(직종)
    em_et                             VARCHAR2(30)     NOT NULL,                       -- 상세정보(고용형태)
    em_lastschool                     VARCHAR2(30)     NOT NULL,                       -- 상세정보(최종학력)
    em_salary                         VARCHAR2(30)     NOT NULL,                       -- 상세정보(급여)
    em_rank                           VARCHAR2(30)     NOT NULL,                       -- 상세정보(직급)
    em_position                       VARCHAR2(30)     NOT NULL,                       -- 상세정보(직책)
    em_url                            VARCHAR2(500)        NULL,                       -- 기타 (홈페이지 채용 URL)
    em_workplace                      VARCHAR2(1000)   NOT NULL,                       -- 기타 (근무지)
    em_startdate                      VARCHAR2(16)         NULL,                       -- 채용 접수 시작일
    -- em_deadline                       VARCHAR2(1000)   NOT NULL,                    -- 채용 접수 마감일                   
    em_enddate                        VARCHAR2(16)         NULL,                       -- 채용 접수 마감일
    em_statedate                      VARCHAR2(16)         NULL,                       -- 채용 서류 발표일
    em_interviewdate                  VARCHAR2(16)         NULL,                       -- 채용 면접 일자
    em_supportformfile1               VARCHAR2(100)        NULL,                       -- 지원양식 파일명 1
    em_supportformsize1               NUMBER(8)        DEFAULT 0     NULL,             -- 지원양식 크기 1
    em_cnt                            NUMBER(7)        DEFAULT 0     NOT NULL,         -- 조회수
    em_date                           DATE             NOT NULL,                       -- 등록날짜
    -- me_no                             NUMBER(7)        NOT NULL,                       -- 회원 번호
    ei_no                             NUMBER(7)        NOT NULL,                       -- 기업정보 번호
    PRIMARY KEY (em_no),                                                                -- 채용정보 번호 PRIMARY KEY
--   FOREIGN KEY (boardno)    REFERENCES board (boardno),                              -- 보드번호, 기본게시판 참조
    -- FOREIGN KEY (divisionno) REFERENCES division (divisionno),                         -- 카테고리번호
    FOREIGN KEY (ei_no)      REFERENCES enterprise_info (ei_no)                       -- 기업정보 FOREIGN KEY
    -- FOREIGN KEY (me_no)      REFERENCES IEP_MEMBER (me_no)                             -- 회원정보 FOREIGN KEY
);


-- 채용정보 등록

INSERT INTO employment_info (em_no, ei_no, em_title, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, em_et, 
                             em_lastschool, em_salary, em_rank, em_position, em_url, em_workplace, em_startdate, em_enddate, 
                             em_statedate, em_interviewdate, em_supportformfile1, em_supportformsize1, em_cnt, em_date)
VALUES((SELECT NVL(MAX(em_no), 0)+1 as em_no FROM employment_info), 1, '웹개발자(JSP) 채용공고(신입/경력)',  
        '- 4년제 컴퓨터/전산/전자/수학 계열 공과대학 졸업(예정)자 - C, C++ 개발 가능자 - 해외여행에 결격사유가 없는 자', 
        '- Linux, Mobile Platform, iOS, Android, Windows 프로그램 개발 경험 - 리눅스/안드로이드 커널 드라이버 개발 경험자 
         - 외국어 능통자 우대 - 국가보훈 대상자 및 장애인은 관계 법령에 의거 우대', '- 서류심사 > 인,적성검사/필기전형 > 면접전형 > 
        합격자 발표 ** 개발직군만 필기전형 실시', '채용공고 내 지원하기를 통해 채용홈페이지 이동 후 입사 지원', '소프트웨어엔지니어', 
        '정규직',  '대학교졸업 (4년) 졸업', '회사내규에 따름', '사원-대졸', '팀원', 'www.selvashealthcare.com', 
        '대전광역시 유성구 가정로 174 (042-864-4460(213)', '2016-05-17 09:30', '2016-11-17 18:30', '2016-11-17 18:30', 
        '2016-11-17 18:30', 'recruit.doc', '10000', 0, sysdate);




INSERT INTO employment_info (em_no, ei_no, em_title, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, em_et, 
                             em_lastschool, em_salary, em_rank, em_position, em_url, em_workplace, em_startdate, em_enddate, 
                             em_statedate, em_interviewdate, em_supportformfile1, em_supportformsize1, em_cnt, em_date)
VALUES((SELECT NVL(MAX(em_no), 0)+1 as em_no FROM employment_info), 1, '웹개발자(JSP) 채용공고(신입/경력)',  
        '- 4년제 컴퓨터/전산/전자/수학 계열 공과대학 졸업(예정)자 - C, C++ 개발 가능자 - 해외여행에 결격사유가 없는 자', 
        '- Linux, Mobile Platform, iOS, Android, Windows 프로그램 개발 경험 - 리눅스/안드로이드 커널 드라이버 개발 경험자 
         - 외국어 능통자 우대 - 국가보훈 대상자 및 장애인은 관계 법령에 의거 우대', '- 서류심사 > 인,적성검사/필기전형 > 면접전형 > 
        합격자 발표 ** 개발직군만 필기전형 실시', '채용공고 내 지원하기를 통해 채용홈페이지 이동 후 입사 지원', '소프트웨어엔지니어', 
        '정규직',  '대학교졸업 (4년) 졸업', '회사내규에 따름', '사원-대졸', '팀원', 'www.selvashealthcare.com', 
        '대전광역시 유성구 가정로 174 (042-864-4460(213)', '2016-05-17 09:30', '2016-11-17 18:30', '2016-11-17 18:30', 
        '2016-11-17 18:30', 'recruit.doc', '10000', 0, sysdate);
        

INSERT INTO employment_info (em_no, me_no, ei_no, em_title, em_mainbusiness, em_cof, em_pi, em_rp, em_howtoapply, 
                             em_occupations, em_et, em_lastschool, em_salary, em_rank, em_position, em_url, em_workplace, 
                             em_startdate, em_enddate, em_statedate, em_interviewdate, em_supportformfile1, 
                             em_supportformsize1, em_cnt, em_date)
VALUES((SELECT NVL(MAX(em_no), 0)+1 as em_no FROM employment_info), 1, 1, '웹개발자(JSP) 채용공고(신입/경력)', 
        '헬스케어제품(보조공학기기, 의료진단기기)SW 연구 및 개발', 
        '- 4년제 컴퓨터/전산/전자/수학 계열 공과대학 졸업(예정)자 - C, C++ 개발 가능자 - 해외여행에 결격사유가 없는 자', 
        '- Linux, Mobile Platform, iOS, Android, Windows 프로그램 개발 경험 - 리눅스/안드로이드 커널 드라이버 개발 경험자 
         - 외국어 능통자 우대 - 국가보훈 대상자 및 장애인은 관계 법령에 의거 우대', '- 서류심사 > 인,적성검사/필기전형 > 면접전형 > 
        합격자 발표 ** 개발직군만 필기전형 실시', '채용공고 내 지원하기를 통해 채용홈페이지 이동 후 입사 지원', '소프트웨어엔지니어', 
        '정규직',  '대학교졸업 (4년) 졸업', '회사내규에 따름', '사원-대졸', '팀원', 'www.selvashealthcare.com', 
        '대전광역시 유성구 가정로 174 (042-864-4460(213)', '2016-05-17 09:30', '2016-11-17 18:30', '2016-11-17 18:30', 
        '2016-11-17 18:30', 'recruit.doc', '10000', 0, sysdate);


INSERT INTO employment_info (em_no, me_no, ei_no, em_mainbusiness, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, 
                             em_et, em_lastschool, em_salary, em_rank, em_position, em_url, em_workplace, em_startdate, 
                             em_enddate, em_statedate, em_interviewdate, em_supportformfile1, em_supportformsize1, 
                             em_cnt, em_date)
VALUES((SELECT NVL(MAX(em_no), 0)+1 as em_no FROM employment_info), 1, 1, '헬스케어제품(보조공학기기, 의료진단기기)SW 연구 및 개발', 
        '- 4년제 컴퓨터/전산/전자/수학 계열 공과대학 졸업(예정)자 - C, C++ 개발 가능자 - 해외여행에 결격사유가 없는 자', 
        '- Linux, Mobile Platform, iOS, Android, Windows 프로그램 개발 경험 - 리눅스/안드로이드 커널 드라이버 개발 경험자 
         - 외국어 능통자 우대 - 국가보훈 대상자 및 장애인은 관계 법령에 의거 우대', '- 서류심사 > 인,적성검사/필기전형 > 면접전형 > 
        합격자 발표 ** 개발직군만 필기전형 실시', '채용공고 내 지원하기를 통해 채용홈페이지 이동 후 입사 지원', '소프트웨어엔지니어', 
        '정규직',  '대학교졸업 (4년) 졸업', '회사내규에 따름', '사원-대졸', '팀원', 'www.selvashealthcare.com', 
        '대전광역시 유성구 가정로 174 (042-864-4460(213)', '2016.10.31 09:00', '2016.11.13 24:00', 'recruit.doc', '10000', 0, sysdate);


INSERT INTO employment_info (em_no, me_no, ei_no, em_mainbusiness, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, 
                             em_et, em_lastschool, em_salary, em_rank, em_position, 
                             em_url, em_workplace, em_startdate, em_deadline, em_supportformfile1, em_supportformsize1, 
                             em_cnt, em_date)
VALUES((SELECT NVL(MAX(em_no), 0)+1 as em_no FROM employment_info), 1, 1, '헬스케어제품(보조공학기기, 의료진단기기)SW 연구 및 개발', 
        '- 4년제 컴퓨터/전산/전자/수학 계열 공과대학 졸업(예정)자 - C, C++ 개발 가능자 - 해외여행에 결격사유가 없는 자', 
        '- Linux, Mobile Platform, iOS, Android, Windows 프로그램 개발 경험 - 리눅스/안드로이드 커널 드라이버 개발 경험자 
         - 외국어 능통자 우대 - 국가보훈 대상자 및 장애인은 관계 법령에 의거 우대', '- 서류심사 > 인,적성검사/필기전형 > 면접전형 > 
        합격자 발표 ** 개발직군만 필기전형 실시', '채용공고 내 지원하기를 통해 채용홈페이지 이동 후 입사 지원', '소프트웨어엔지니어', 
        '정규직',  '대학교졸업 (4년) 졸업', '회사내규에 따름', '사원-대졸', '팀원', 'www.selvashealthcare.com', 
        '대전광역시 유성구 가정로 174 (042-864-4460(213)', '2016.10.31 09:00', '2016.11.13 24:00', 'recruit.doc', '10000', 0, sysdate);
        
        

INSERT INTO employment_info (em_no, me_no, ei_no, em_mainbusiness, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, 
                             em_et, em_lastschool, em_salary, em_rank, em_position, 
                             em_url, em_workplace, em_startdate, em_deadline, em_supportformfile1, em_supportformsize1, em_cnt, 
                             em_date)
VALUES((SELECT NVL(MAX(em_no), 0)+1 as em_no FROM employment_info), 1, 1, '헬스케어제품(보조공학기기, 의료진단기기)SW 연구 및 개발', 
        '- 4년제 컴퓨터/전산/전자/수학 계열 공과대학 졸업(예정)자 - C, C++ 개발 가능자 - 해외여행에 결격사유가 없는 자', 
        '- Linux, Mobile Platform, iOS, Android, Windows 프로그램 개발 경험 - 리눅스/안드로이드 커널 드라이버 개발 경험자 
         - 외국어 능통자 우대 - 국가보훈 대상자 및 장애인은 관계 법령에 의거 우대', '- 서류심사 > 인,적성검사/필기전형 > 면접전형 > 
        합격자 발표 ** 개발직군만 필기전형 실시 ', '채용공고 내 '지원하기'를 통해 채용홈페이지 이동 후 입사 지원', '소프트웨어엔지니어', 
        '정규직',  '대학교졸업 (4년) 졸업', '회사내규에 따름', '사원-대졸', '팀원', 'www.selvashealthcare.com', 
        '대전광역시 유성구 가정로 174 (042-864-4460(213)', '2016.10.31 09:00', '2016.11.13 24:00', 'recruit.doc', '10000', 0, sysdate);
        
        
INSERT INTO employment_info (em_no, me_no, ei_no, em_mainbusiness, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, 
                             em_et, em_lastschool, em_salary, em_rank, em_position, 
                             em_url, em_workplace, em_startdate, em_deadline, em_supportformfile1, em_supportformfile2, 
                             em_supportformsize2, em_cnt, em_date)
VALUES((SELECT NVL(MAX(em_no), 0)+1 as em_no FROM employment_info), 1, 1, 'a', 'b', 'c', 'd', 'e', 'f', 'g', 
        '대학교졸업 (4년) 졸업', '회사내규에 따름', '사원-대졸', '팀원', 'www.selvashealthcare.com', 
        '대전광역시 유성구 가정로 174 (042-864-4460(213)', '2016.10.31 09:00', '2016.11.13 24:00', 'recruit.doc', 
        'recruit.doc', '10000', 0, sysdate);






INSERT INTO employment_info (boardno, divisionno, me_no, ei_no, em_no, em_id, em_password, em_email, em_title,
                             em_content, em_mainbusiness, em_cof, em_pi, em_startdate, em_deadline, em_rp, 
                             em_other, em_occupations, em_et, em_lastschool, em_salary, em_rank, em_position, 
                             em_url, em_file1, em_size1, em_cnt, em_date)
VALUES(1, 1, 1, 1, (SELECT NVL(MAX(em_no), 0)+1 as em_no FROM employment_info), '', '1234', '02-6901-7061', 
       'iep@iep.com', '중소기업', '101-86-50485', 'IEP', '엄기흥', '서울특별시 종로구 종로12길', 
       '15 (관철동 13-13)', '03190', sysdate);

       
SELECT COUNT(ei.ei_id) as ei.ei_id
FROM enterprise_info ei, member m;
WHERE ei.ei_id = m.ei_id;
  


       
-- 채용정보 전체 조회

SELECT em_no, ei_no, em_title, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, em_et, 
       em_lastschool, em_salary, em_rank, em_position, em_url, em_workplace, em_startdate, em_enddate, em_statedate, 
       em_interviewdate, em_supportformfile1, em_supportformsize1, em_cnt, em_date
FROM employment_info
ORDER BY em_no ASC;


SELECT em_no, me_no, ei_no, em_title, em_mainbusiness, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, em_et, 
       em_lastschool, em_salary, em_rank, em_position, em_url, em_workplace, em_startdate, em_enddate, em_statedate, 
       em_interviewdate, em_supportformfile1, em_supportformsize1, em_cnt, em_date
FROM employment_info
ORDER BY em_no ASC;




SELECT em_no, me_no, ei_no, em_mainbusiness, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, em_et, em_lastschool, 
       em_salary, em_rank, em_position, em_url, em_workplace, em_startdate, em_deadline, em_supportformfile1, 
       em_supportformsize1, em_cnt, em_date
FROM employment_info
ORDER BY em_no ASC;


-- 채용정보 조회
SELECT em_no, ei_no, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, em_et, em_lastschool, 
       em_salary, em_rank, em_position, em_url, em_workplace, em_startdate, em_enddate, em_statedate, em_interviewdate, 
       em_supportformfile1, em_supportformsize1, em_cnt, em_date
FROM employment_info
WHERE ei_no = 1;





SELECT em_no, me_no, ei_no, em_mainbusiness, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, em_et, em_lastschool, 
       em_salary, em_rank, em_position, em_url, em_workplace, em_startdate, em_enddate, em_statedate, em_interviewdate, 
       em_supportformfile1, em_supportformsize1, em_cnt, em_date
FROM employment_info
WHERE ei_no = 1;



SELECT em_no, me_no, ei_no, em_mainbusiness, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, em_et, em_lastschool, 
       em_salary, em_rank, em_position, em_url, em_workplace, em_startdate, em_deadline, em_supportformfile1, 
       em_supportformsize1, em_cnt, em_date
FROM employment_info
WHERE ei_no = 1;




-- 채용정보 수정
UPDATE employment_info
SET em_cof='- 4년제 컴퓨터/전산/전자/수학 계열 공과대학 졸업(예정)자- C, C++ 개발 가능자 - 해외여행에 결격사유가 없는 자', 
    em_pi='- Linux, Mobile Platform, iOS, Android, Windows 프로그램 개발 경험 - 리눅스/안드로이드 커널 드라이버 개발 경험자 
    - 외국어 능통자 우대 - 국가보훈 대상자 및 장애인은 관계 법령에 의거 우대', em_rp='- 서류심사 > 인,적성검사/필기전형 > 면접전형 > 
    합격자 발표 ** 개발직군만 필기전형 실시', em_howtoapply='채용공고 내 지원하기를 통해 채용홈페이지 이동 후 입사 지원', 
    em_occupations='소프트웨어엔지니어', em_et='정규직', em_lastschool='대학교졸업 (4년) 졸업', em_salary='회사내규에 따름', 
    em_rank='사원-대졸', em_position='팀원', em_url='www.selvashealthcare.com', em_workplace='대전광역시 유성구 가정로 174 
    (042-864-4460(213)', em_startdate='2016.05.17 09:30', em_enddate='2016.11.17 18:30', em_statedate='2016.11.17 18:30', 
    em_interviewdate='2016.11.17 18:30', em_supportformfile1='recruit.doc', em_supportformsize1=10000, em_cnt=0
WHERE ei_no = 1;


UPDATE employment_info
SET em_mainbusiness='헬스케어제품(보조공학기기, 의료진단기기)SW 연구 및 개발', 
    em_cof='- 4년제 컴퓨터/전산/전자/수학 계열 공과대학 졸업(예정)자- C, C++ 개발 가능자 - 해외여행에 결격사유가 없는 자', 
    em_pi='- Linux, Mobile Platform, iOS, Android, Windows 프로그램 개발 경험 - 리눅스/안드로이드 커널 드라이버 개발 경험자 
    - 외국어 능통자 우대 - 국가보훈 대상자 및 장애인은 관계 법령에 의거 우대', em_rp='- 서류심사 > 인,적성검사/필기전형 > 면접전형 > 
    합격자 발표 ** 개발직군만 필기전형 실시', em_howtoapply='채용공고 내 지원하기를 통해 채용홈페이지 이동 후 입사 지원', 
    em_occupations='소프트웨어엔지니어', em_et='정규직', em_lastschool='대학교졸업 (4년) 졸업', em_salary='회사내규에 따름', 
    em_rank='사원-대졸', em_position='팀원', em_url='www.selvashealthcare.com', em_workplace='대전광역시 유성구 가정로 174 
    (042-864-4460(213)', em_startdate='2016.05.17 09:30', em_enddate='2016.11.17 18:30', em_statedate='2016.11.17 18:30', 
    em_interviewdate='2016.11.17 18:30', em_supportformfile1='recruit.doc', em_supportformsize1=10000, em_cnt=0
WHERE ei_no = 1;
       
-- 채용정보 삭제
DELETE FROM enterprise_info
WHERE ei_no=1;      



--------------------------------------------------------------------------------------------------------------------------
