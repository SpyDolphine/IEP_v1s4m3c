/*
create table reply(
 rno          NUMBER(7)       not null,                   -- 글 번호
 cm_no        NUMBER(7)       not null,                   -- 글 번호
 rnick        varchar2(30)    not null,                   -- 닉네임
 rcontent     varchar2(4000)  not null,                   -- 글 내용
 likeup       NUMBER(7)       default 0,                  -- 추천
 likedown     NUMBER(7)       default 0,                  -- 비추천
 grpno        NUMBER(7)       NOT NULL,
 indent       NUMBER(2)       DEFAULT 0,
 ansnum       NUMBER(5)       DEFAULT 0,  
 rdate        DATE            not null,                   -- 등록날짜
 PRIMARY KEY(rno), 
 FOREIGN KEY (cm_no) REFERENCES commu_free(cm_no)
 
)
 */

drop table dat
drop table reply
CREATE TABLE dat(
    dno                               NUMBER(7)      NOT NULL PRIMARY KEY,    -- 댓글 번호
    gu_no                             NUMBER(7)      NOT NULL,                -- 맛집 글 번호
    d_name                            VARCHAR2(100)  NOT NULL,                -- 닉네임
    d_cont                            VARCHAR2(4000) NOT NULL,                -- 내용
    d_date                            DATE           NOT NULL,                -- 날짜
    likeup                            NUMBER(7)       default 0,                  -- 추천
    likedown                          NUMBER(7)       default 0,                  -- 비추천
    grpno                             NUMBER(7)       NOT NULL,
    indent                            NUMBER(2)       DEFAULT 0,
    ansnum                            NUMBER(5)       DEFAULT 0,  
   FOREIGN KEY (gu_no) REFERENCES gurume(gu_no) on delete cascade
 );
);