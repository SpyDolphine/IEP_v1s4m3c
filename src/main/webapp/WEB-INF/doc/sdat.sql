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

drop table sdat
CREATE TABLE sdat(
    sd_no                               NUMBER(7)      NOT NULL PRIMARY KEY,    -- 댓글 번호
    sc_no                             NUMBER(7)      NOT NULL,                -- 맛집 글 번호
    sd_name                            VARCHAR2(100)  NOT NULL,                -- 닉네임
    sd_cont                            VARCHAR2(4000) NOT NULL,                -- 내용
    sd_date                            DATE           NOT NULL,                -- 날짜
    likeup                            NUMBER(7)       default 0,                  -- 추천
    likedown                          NUMBER(7)       default 0,                  -- 비추천
    grpno                             NUMBER(7)       NOT NULL,
    indent                            NUMBER(2)       DEFAULT 0,
    ansnum                            NUMBER(5)       DEFAULT 0,  
   FOREIGN KEY (sc_no) REFERENCES seico(sc_no) on delete cascade
 );
);