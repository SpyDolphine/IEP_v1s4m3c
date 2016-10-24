-- 회원가입 테이블 삭제 
drop table IEP_MEMBER;

-- 회원가입 테이블 생성
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
    me_visible          number(1) default 1,
    primary key(me_no)
);

COMMENT ON TABLE member is '회원정보';
COMMENT ON COLUMN member.me_no is '회원번호';
COMMENT ON COLUMN member.me_id is '회원아이디';
COMMENT ON COLUMN member.me_pw is '회원비밀번호';
COMMENT ON COLUMN member.me_nick is '회원닉네임';
COMMENT ON COLUMN member.me_name is '회원아이디';
COMMENT ON COLUMN member.me_grade is '회원등급';
COMMENT ON COLUMN member.me_zip is '우편번호';
COMMENT ON COLUMN member.me_addr1 is '주소';
COMMENT ON COLUMN member.me_addr2 is '상세주소';
COMMENT ON COLUMN member.me_tel is '전화번호';
COMMENT ON COLUMN member.me_date is '등록일';

-- 회원가입 insert
INSERT INTO IEP_MEMBER(me_no, me_id, me_pw, me_nick, me_name, me_grade, me_zipcode, me_addr1, me_addr2, me_tel, me_date, me_visible)
VALUES ((SELECT NVL(MAX(me_no), 0)+1 as me_no FROM IEP_MEMBER),
'admin', '1234', '배병건', '컴퓨터천재', 'A', '12345', '인천 광역시 ', '동아아 9-1109', '010-8784-8591', sysdate, 1);

-- 목록 (관리자 권한에서만확인)
select me_no, me_id, me_nick, me_addr1, me_tel, me_date, me_grade
from IEP_MEMBER;

select * from IEP_MEMBER 

-- 아이디 중복확인 
SELECT COUNT(me_id) as cnt
FROM iep_member
WHERE me_id='user1';

-- 닉네임 중복확인
SELECT COUNT(me_nick) as cnt
FROM iep_member
WHERE me_nick='메룽이';

-- 회원정보 수정
UPDATE iep_member 
SET me_zipcode = '12345', me_addr1='서울특별시 종로구 관철동' , me_addr2='123-123', me_tel='010-0000-0000'
WHERE me_no=1;

-- 패스워드 검사
SELECT COUNT(me_no) as cnt
FROM iep_member
WHERE me_no=1 AND me_pw='1234';
 
-- 패스워드 수정
UPDATE iep_member
SET me_pw='0000'
WHERE me_no=1;

-- 회원 탈퇴(삭제)
DELETE FROM iep_member
WHERE me_no=1;

-- 로그인
SELECT me_no, me_nick, me_grade, count(me_no) as cnt
FROM iep_member
WHERE me_id='shiningray12@naver.com' AND me_pw='dragon12'
group by me_no, me_nick, me_grade;

SELECT COUNT(me_no) as cnt
FROM iep_member
where me_id='shiningray12@naver.com' AND me_pw='dragon12'

  SELECT me_no, me_id, me_pw, me_nick, me_name, me_grade
  FROM IEP_MEMBER
  where me_no = #{me_no}; 



-- 회원가입 등록

INSERT INTO IEP_MEMBER(me_no, me_id, me_pw, me_nick, me_name, me_zipcode, me_addr1, me_addr2, me_tel, me_date)
VALUES ((SELECT NVL(MAX(me_no), 0)+1 as me_no FROM IEP_MEMBER),
'user1', '1234', '왕눈이', '배병건',  '12345', '인천 광역시 남동구 만수2동', '신동아아파트 9동 1109호', '010-8591-8784', sysdate);



select * from IEP_MEMBER;
-- 아이디 중복체크 
SELECT COUNT(me_id) as cnt
FROM IEP_MEMBER
WHERE me_id='user1';
-- 닉네임 중복 체크
SELECT COUNT(me_nick) as cnt
FROM IEP_MEMBER
WHERE me_nick='왕눈이';

delete from IEP_MEMBER;

select * from  iep_member;



CREATE TABLE IEP_MEMBER(
    me_no                         NUMBER(7)    NOT NULL  primary key,
    me_id                             VARCHAR2(100)    NOT NULL,
    me_pw                             VARCHAR2(20)     NOT NULL,
    me_nick                           VARCHAR2(40)     NOT NULL,
    me_name                           VARCHAR2(40)     NOT NULL,
    me_grade                          CHAR(1)    DEFAULT 'M'     NOT NULL,
    me_zipcode                        VARCHAR2(10)     NOT NULL,
    me_addr1                          VARCHAR2(100)    NOT NULL,
    me_addr2                          VARCHAR2(100)    NOT NULL,
    me_tel                            varchar2(20)     NOT NULL,
    me_date                           DATE     NOT NULL
);

SELECT COUNT(me_id) as cnt
FROM IEP_MEMBER
WHERE me_id='user1';
