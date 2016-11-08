/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE IEP_MEMBER(
		me_no                         		INTEGER(10)		 NULL ,
		me_id                         		VARCHAR2(100)		 NULL ,
		me_pw                         		VARCHAR2(20)		 NULL ,
		me_nick                       		VARCHAR2(40)		 NULL ,
		me_name                       		VARCHAR2(40)		 NULL ,
		me_grade                      		CHAR(1)		 NULL ,
		me_zipcode                    		VARCHAR2(10)		 NULL ,
		me_addr1                      		VARCHAR2(100)		 NULL ,
		me_addr2                      		VARCHAR2(100)		 NULL ,
		me_tel                        		VARCHAR2(20)		 NULL ,
		me_date                       		DATE		 NULL ,
		me_vis                        		CHAR(1)		 NULL 
);

COMMENT ON TABLE IEP_MEMBER is '회원';
COMMENT ON COLUMN IEP_MEMBER.me_no is '회원번호';
COMMENT ON COLUMN IEP_MEMBER.me_id is '회원아이디(이메일)';
COMMENT ON COLUMN IEP_MEMBER.me_pw is '비밀번호';
COMMENT ON COLUMN IEP_MEMBER.me_nick is '닉네임';
COMMENT ON COLUMN IEP_MEMBER.me_name is '이름';
COMMENT ON COLUMN IEP_MEMBER.me_grade is '등급';
COMMENT ON COLUMN IEP_MEMBER.me_zipcode is '우편번호';
COMMENT ON COLUMN IEP_MEMBER.me_addr1 is '주소1';
COMMENT ON COLUMN IEP_MEMBER.me_addr2 is '주소2';
COMMENT ON COLUMN IEP_MEMBER.me_tel is '전화번호';
COMMENT ON COLUMN IEP_MEMBER.me_date is '가입날짜';
COMMENT ON COLUMN IEP_MEMBER.me_vis is '탈퇴여부';


/**********************************/
/* Table Name: 설문조사게시판 */
/**********************************/
CREATE TABLE serveyboard(
		sb_no                         		NUMBER(7)		 NULL ,
		title                         		VARCHAR2(200)		 NULL ,
		content                       		VARCHAR2(4000)		 NULL ,
		rdate                         		DATE		 NULL 
);

COMMENT ON TABLE serveyboard is '설문조사게시판';
COMMENT ON COLUMN serveyboard.sb_no is '게시판번호';
COMMENT ON COLUMN serveyboard.title is '제목';
COMMENT ON COLUMN serveyboard.content is '내용';
COMMENT ON COLUMN serveyboard.rdate is '날짜';


/**********************************/
/* Table Name: 설문조사항목 */
/**********************************/
CREATE TABLE servey(
		serveyno                      		NUMBER(7)		 NULL ,
		item                          		VARCHAR2(200)		 NULL ,
		cnt                           		NUMBER(10)		 NULL ,
		COLUMN_4                      		INTEGER(10)		 NULL 
);

COMMENT ON TABLE servey is '설문조사항목';
COMMENT ON COLUMN servey.serveyno is '항목번호';
COMMENT ON COLUMN servey.item is '설문조사항목';
COMMENT ON COLUMN servey.cnt is 'Column3';
COMMENT ON COLUMN servey.COLUMN_4 is 'Column4';



ALTER TABLE IEP_MEMBER ADD CONSTRAINT IDX_IEP_MEMBER_PK PRIMARY KEY (me_no);

ALTER TABLE serveyboard ADD CONSTRAINT IDX_serveyboard_PK PRIMARY KEY (sb_no);

