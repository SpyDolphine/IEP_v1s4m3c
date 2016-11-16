CREATE TABLE IEP_MEMBER(
    me_no              NUMBER(7)    NOT NULL ,  -- 회원 번호
    me_id               VARCHAR2(100)   unique  NOT NULL,-- 회원 아이디(이메일로)
    me_pw              VARCHAR2(50)     NOT NULL,-- 회원 비밀번호
    me_nick            VARCHAR2(40)     NOT NULL,-- 회원 닉네임
    me_name          VARCHAR2(40)     NOT NULL,-- 회원 이름
    me_grade          CHAR(1)    DEFAULT 'M',-- 회원 등급 'M' 일반,'C'기업, 'A' 관리자, 
    me_zipcode       VARCHAR2(10)     NOT NULL,-- 회원 우편번호
    me_addr1          VARCHAR2(100)    NOT NULL,-- 회원 주소
    me_addr2          VARCHAR2(100)    NOT NULL,-- 회원 상세주소
    me_tel               varchar2(20)     NOT NULL,    -- 회원 전화번호
    me_date            DATE     NOT NULL,              -- 회원 등록일
    me_vis              char(1)        default 'y',           --  회원 탈퇴여부 'y'회원, 'n'탈퇴
    primary key(me_no)
);

select * from IEP_MEMBER

update iep_member
set me_grade = 'A'
where me_no = 3

alter table iep_member add(me_vis char(1))
alter table iep_member MODIFY( me_pw VARCHAR2(100))
CREATE TABLE uriLog(
   urilogno NUMBER(7)                   NOT NULL, -- 일련 번호
   id          VARCHAR(10) DEFAULT 'guest' NOT NULL, -- 아이디
   ip          VARCHAR(15)                 NOT NULL, -- 123.456.789.012
   uri         VARCHAR(50)                 NOT NULL, -- URI 주소
   uridate    VARCHAR(19)                 NOT NULL, -- 접속 날짜
   PRIMARY KEY(urilogno)
);
select * from URILOG;
update iep_member
set me_confirm = 'Y'
where me_id = 'shiningray12@admin.com' and auth='axd00000011111111';

update iep_member
set me_grade = 'A'
where me_no = 2

select * from IEP_MEMBER

update IEP_MEMBER

drop table iep_member;

delet * from IEP_MEMBER;

  update iep_member
  set me_vis = 'y'
  where me_no=1