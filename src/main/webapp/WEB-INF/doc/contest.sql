create table iep_contest (
ct_no              number(7) primary key,   --공모전 번호
me_no             number(7) not null,        -- 회원번호
ct_title              varchar2(300) not null,     -- 공모전 제목
ct_host             varchar2(100) null,            -- 공모전 주최
ct_supervision    varchar2(100) null,           -- 공모전 주관
ct_entry              varchar2(50) null,            -- 공모전 참가자격
ct_enter              varchar2(50) null,           -- 접수방법
ct_award            varchar2(50) null,            -- 시상자격
ct_startdate        varchar2(50) null,            -- 접수 시작일
ct_enddate        varchar2(50) null,             -- 접수 마감일
ct_statedate       varchar2(50) null,            -- 발표 일
ct_url                varchar2(100)  null,           -- 공모전 관련 홈페이지
ct_content          varchar2(4000)  not null,     -- 공모전 상세내용
ct_file1               VARCHAR2(100)        NULL ,  -- 파일
ct_file2               VARCHAR2(50)         NULL ,  -- 파일 2
ct_size2               NUMBER(9)        DEFAULT 0       NULL ,  -- 파일 사이즈
ct_rdate              date  not null,                             -- 공모전 등록일
ct_cnt                number(7)  DEFAULT 0   not null,                       --조회수
FOREIGN KEY (Me_NO) REFERENCES iep_MEMBER (Me_NO)
);
drop table iep_contest;

1. 등록
insert into iep_contest (ct_no, me_no, ct_title, ct_host, ct_supervision, ct_entry, ct_enter, ct_award, ct_startdate, ct_enddate, ct_statedate, ct_url, ct_content, ct_file1, ct_file2, ct_size2, ct_rdate, ct_cnt)
values ((select nvl(max(ct_no), 0)+1 as ct_no from iep_contest), 1, '공모전 제목', '공모전 주최', '공모전 주관', '공모전 참가자격', '접수방법', '시상종류', '2016-10-25', '2016-11-11', '2016-12-12', 'www.naver.com', '그럼 그럼', 'file1.jpg', 'file2.jpg', 0, sysdate, 0);

2. 전체 목록
select ct_no, ct_title, ct_host, ct_startdate, ct_enddate, ct_cnt  from iep_contest order by ct_no DESC;

select ct_no, ct_title, ct_host, ct_startdate, ct_enddate, ct_cnt  
from iep_contest 
order by ct_no DESC

3. 조회
select ct_title, ct_host, ct_supervision, ct_entry, ct_enter, ct_award, ct_startdate, ct_enddate, ct_statedate, ct_url, ct_content, ct_file1, ct_file2, ct_size2, ct_rdate, ct_cnt from iep_contest where ct_no=1;

4. 수정
UPDATE iep_contest
SET ct_title='제목 공모전', ct_host = '주최 공모전', ct_supervision='주관 공모전', ct_entry = '참가자격 공모전', ct_enter='접수방버 공모전', ct_award='시상종류 공모전', ct_startdate = '2016-10-28', ct_enddate='2016-12-12' , ct_statedate = '2016-12-25', ct_url = 'www.google.com', ct_content = '123', ct_file1 = 'file1_2.jps', ct_file2 = 'file2_1.jpg', ct_size2= 0
WHERE ct_no=1;

update iep_member
set me_grade = 'A'
where me_no = 3;

5. 삭제
DELETE FROM iep_contest
WHERE ct_no=1;
 


    SELECT me_no, me_nick, me_name, me_grade
    FROM IEP_MEMBER
    where me_id=#{me_id}