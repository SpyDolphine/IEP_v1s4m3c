<커뮤니티> 
자유게시판     정보공유방       스터디정모방      상담 / 공감방


-- 자유게시판(실시간 업데이트) : 커뮤니티 메인 페이지
create table commu_free (
 cm_no        NUMBER(7)        not null,    -- 글 번호
 cm_nick      varchar2(30)     not null,    -- 닉네임
 cm_title     varchar2(120)    not null,    -- 게시글 제목
 cm_content   varchar2(4000)   not null,    -- 글 내용
 cm_likeit    NUMBER(7)        default 0,   -- 좋아요기능                        
 cm_rdate     DATE             not null,    -- 등록날짜
 PRIMARY KEY(cm_no)
);

1. 글추가
INSERT INTO commu_free(cm_no, cm_nick, cm_title, cm_content, cm_likeit, cm_rdate)
VALUES((SELECT NVL(MAX(cm_no), 0)+1 as cm_no FROM commu_free), '닉네임', '제목','내용', 0, sysdate);

2. 목록
SELECT cm_no, cm_nick, cm_title, cm_content, cm_likeit, cm_rdate
FROM commu_free
ORDER BY cm_no ASC;

drop table commu_free;
delete from commu_free;


----------------------------------------------------------------------------------------------------------------------



-- 정보공유방(사진/파일/동영상(썸네일) 들어가야함)
create table commu_info (
 cm_id        varchar2(100)     not null,              -- 이메일
 cm_nick      varchar2(30)     not null,               -- 닉네임
 cm_title     varchar2(120)     not null,              -- 게시글 제목
 cm_content   varchar2(4000)    not null,              -- 글 내용
 cm_likeit    NUMBER(7)         default 0,             -- 좋아요기능
 cm_map       varchar2(1024)    null,                  -- 지도
 cm_url       varchar2(500)     null,                  -- 출처  
 cm_cnt       NUMBER(7)         default 0,             -- 조회수
 cm_rdate     DATE              not null,              -- 등록날짜
 PRIMARY KEY(cm_no),
 FOREIGN KEY (divisionno) REFERENCES division (divisionno), -- 카테고리번호
 FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no)          --회원번호  
);

1. 글추가
INSERT INTO commu_info(cm_no, cm_id, cm_nick, cm_title, cm_content, cm_map, cm_url, cm_rdate)
VALUES((SELECT NVL(MAX(cm_no), 0)+1 as cm_no FROM commu_info), 'cm_id','cm_nick', 'cm_title','cm_content', 'cm_map', 'cm_url', sysdate);

2. 목록
SELECT cm_no, cm_nick, cm_title, cm_content, cm_likeit, cm_map, cm_url, cm_rdate
FROM commu_info
ORDER BY cm_no ASC;

----------------------------------------------------------------------------------------------------------------------

drop table commu_study
-- 스터디 정모방(사진/파일/동영상(썸네일) 들어가야함)
create table commu_meet (
 cm_no        NUMBER(7)        not null,                         -- 글 번호
 cm_nick      varchar2(30)     not null,                         -- 닉네임
 cm_title     varchar2(120)    not null,                         -- 게시글 제목
 cm_content   varchar2(4000)   not null,                         -- 글 내용
 cm_file1     VARCHAR2(100)    NULL ,
 cm_file2     VARCHAR2(50)     NULL ,
 cm_size2     NUMBER(9)        DEFAULT 0 ,
 cm_likeit    NUMBER(7)        default 0,                        -- 좋아요기능
 cm_map       varchar2(1024)   null,                             -- 지도
 cm_url       varchar2(500)    null,                             -- 출처  
 cm_cnt       NUMBER(7)        default 0,                        -- 조회수
 cm_date      DATE             not null,                         -- 등록날짜
 replycnt     NUMBER(7)        DEFAULT 0       NOT NULL, 
 grpno        NUMBER(7)        NOT NULL,
 indent       NUMBER(2)        DEFAULT 0       NOT NULL,
 ansnum       NUMBER(5)        DEFAULT 0       NOT NULL, 
 PRIMARY KEY(cm_no)
);

1. 글추가
INSERT INTO commu_meet(cm_no, cm_nick, cm_title, cm_content, cm_file1, cm_file2, cm_size2, cm_likeit, cm_map, cm_url, 
                        cm_cnt, cm_date, replycnt, grpno, indent, ansnum)
VALUES((SELECT NVL(MAX(cm_no), 0)+1 as cm_no FROM commu_meet),'nick', '1title','content', 'ummer_m.jpg', 'summer.jpg',
        0, 0, 'map', 'url', 0, sysdate, 0 ,0, 0, 0);

2. 목록

SELECT cm_no, cm_nick, cm_title, cm_content, cm_file1, cm_file2, cm_size2, cm_likeit, cm_map, cm_url, cm_cnt, cm_date,
       replycnt, grpno, indent, ansnum, r
FROM(
         SELECT cm_no, cm_nick, cm_title, cm_content, cm_file1, cm_file2, cm_size2, cm_likeit, cm_map, cm_url, cm_cnt, cm_date,
                replycnt, grpno, indent, ansnum, rownum as r
         FROM(
                  SELECT cm_no, cm_nick, cm_title, cm_content, cm_file1, cm_file2, cm_size2, cm_likeit, cm_map, cm_url, cm_cnt, cm_date,
                         replycnt, grpno, indent, ansnum
                  FROM commu_meet
                  ORDER BY grpno DESC, ansnum ASC
         )
)
WHERE r >=1 AND r <= 3;


3. 새로운 답변을 최신으로 등록하기위해 기존 답변을 뒤로 미룹니다.

UPDATE commu_meet
SET ansnum = ansnum + 1
WHERE grpno = 1 AND ansnum > 1;
----------------------------------------------------------------------------------------------------------------------

-- 상담/공감방(사진/파일/동영상(썸네일) 들어가야함)
create table commu_info (
 cm_no        NUMBER(7)         not null,                         -- 글 번호
 cm_id        varchar2(100)     not null,                         -- 이메일
 cm_nick      varchar2(30)      not null,                         -- 닉네임
 cm_title     varchar2(200)     not null,                         -- 게시글 제목
 cm_content   varchar2(4000)    not null,                         -- 글 내용
 cm_likeit    NUMBER(7)         default 0,                        -- 좋아요기능
 cm_url       varchar2(500)     null,                             -- 출처  
 cm_cnt       NUMBER(7)         default 0,                        -- 조회수
 cm_rdate     DATE              not null,                         -- 등록날짜
 PRIMARY KEY(cm_no),
 FOREIGN KEY (divisionno) REFERENCES division (divisionno), -- 카테고리번호
 FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no)          --회원번호 
);

1. 글추가
INSERT INTO commu_info(cm_no, cm_id, cm_nick, cm_title, cm_content, cm_url, cm_rdate)
VALUES((SELECT NVL(MAX(cm_no), 0)+1 as cm_no FROM commu_study), 'cm_id','cm_nick', 'cm_title','cm_content', 'cm_url', sysdate);

2. 목록
SELECT cm_no, cm_nick, cm_title, cm_content, cm_likeit, cm_url, cm_rdate
FROM commu_info
ORDER BY cm_no ASC;

----------------------------------------------------------------------------------------------------------------------



-- 댓글
create table commu_comment (
 cm_no        NUMBER(7)       not null,                       -- 글 번호
 cm_id        varchar2(100)   not null,                       -- 이메일
 cm_nick      varchar2(30)    not null,                       -- 닉네임
 cm_content   varchar2(4000)  not null,                       -- 글 내용
 cm_likeit    NUMBER(7)       default 0,                      -- 좋아요기능
 cm_rdate     DATE            not null,                       -- 등록날짜
 PRIMARY KEY(cm_no)
);
