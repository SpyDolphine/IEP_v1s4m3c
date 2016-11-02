CREATE TABLE IEP_MEMBER(
    me_no              NUMBER(7)    NOT NULL ,  -- 회원 번호
    me_id               VARCHAR2(100)   unique  NOT NULL,-- 회원 아이디(이메일로)
    me_pw              VARCHAR2(20)     NOT NULL,-- 회원 비밀번호
    me_nick            VARCHAR2(40)     NOT NULL,-- 회원 닉네임
    me_name          VARCHAR2(40)     NOT NULL,-- 회원 이름
    me_grade          CHAR(1)    DEFAULT 'M',-- 회원 등급
    me_zipcode       VARCHAR2(10)     NOT NULL,-- 회원 우편번호
    me_addr1          VARCHAR2(100)    NOT NULL,-- 회원 주소
    me_addr2          VARCHAR2(100)    NOT NULL,-- 회원 상세주소
    me_tel               varchar2(20)     NOT NULL,-- 회원 전화번호
    me_date            DATE     NOT NULL,-- 회원 등록일
    me_vis          char(1)       default 'y'   not null, --  회원 탈퇴여부
    primary key(me_no)
);

select * from IEP_MEMBER

update IEP_MEMBER


  update iep_member
  set me_vis = 'y'
  where me_no=1