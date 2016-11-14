<커뮤니티> 
자유게시판     정보공유방       스터디정모방      상담 / 공감방


create table community (
 cm_no        NUMBER(7)        not null,                         -- 글 번호
 cm_nick      varchar2(30)     not null,                         -- 닉네임
 cm_title     varchar2(120)    not null,                         -- 게시글 제목
 cm_content   varchar2(4000)   not null,                         -- 글 내용
 file1        VARCHAR2(100)    NULL ,
 file2        VARCHAR2(50)     NULL ,
 size2        NUMBER(9)        DEFAULT 0 ,
 cm_likeit    NUMBER(7)        default 0,                        -- 좋아요기능
 cm_map       varchar2(1024)   null,                             -- 지도
 cm_url       varchar2(500)    null,                             -- 출처  
 cm_cnt       NUMBER(7)        default 0,                        -- 조회수
 cm_date      DATE             not null,                         -- 등록날짜
 replycnt     NUMBER(7)        DEFAULT 0       NOT NULL,         -- 댓글수
 grpno        NUMBER(7)        NOT NULL,
 indent       NUMBER(2)        DEFAULT 0       NOT NULL,
 ansnum       NUMBER(5)        DEFAULT 0       NOT NULL, 
 cm_ch        CHAR             NOT NULL,                         -- 각 리스트 채널
 PRIMARY KEY(cm_no)
);

1. 글추가
INSERT INTO community(cm_no, cm_nick, cm_title, cm_content, file1, file2, size2, cm_likeit, cm_map, cm_url, 
                        cm_cnt, cm_date, replycnt, grpno, indent, ansnum, cm_ch)
VALUES((SELECT NVL(MAX(cm_no), 0)+1 as cm_no FROM community),'nick', '1title','content', 'ummer_m.jpg', 'summer.jpg',
        0, 0, 'map', 'url', 0, sysdate, 0 ,0, 0, 0, 'A');
        
INSERT INTO community(cm_no, cm_nick, cm_title, cm_content, file1, file2, size2, cm_likeit, cm_map, cm_url, 
                        cm_cnt, cm_date, replycnt, grpno, indent, ansnum, cm_ch)
VALUES((SELECT NVL(MAX(cm_no), 0)+1 as cm_no FROM community),'aaa', '1title','content', 'ummer_m.jpg', 'summer.jpg',
        0, 0, 'map', 'url', 0, sysdate, 0 ,0, 0, 0, 'A');   

INSERT INTO community(cm_no, cm_nick, cm_title, cm_content, file1, file2, size2, cm_likeit, cm_map, cm_url, 
                        cm_cnt, cm_date, replycnt, grpno, indent, ansnum, cm_ch)
VALUES((SELECT NVL(MAX(cm_no), 0)+1 as cm_no FROM community),'aaa', '1title','content', 'ummer_m.jpg', 'summer.jpg',
        0, 0, 'map', 'url', 0, sysdate, 0 ,0, 0, 0, 'B'); 
    

select * from community
2-1. 전체 목록(A)
SELECT cm_no, cm_nick, cm_title, cm_content, file1, file2, size2, cm_likeit, cm_map, cm_url, cm_cnt, cm_date,
        replycnt, grpno, indent, ansnum, cm_ch, r
 FROM(
           SELECT cm_no, cm_nick, cm_title, cm_content, file1, file2, size2, cm_likeit, cm_map, cm_url, cm_cnt, cm_date,
                  replycnt, grpno, indent, ansnum, cm_ch, rownum as r
           FROM(
                    SELECT cm_no, cm_nick, cm_title, cm_content, file1, file2, size2, cm_likeit, cm_map, cm_url, cm_cnt, cm_date,
                           replycnt, grpno, indent, ansnum, cm_ch
                    FROM community
                    where cm_ch = 'A'
                    ORDER BY grpno DESC, ansnum ASC
               )
           )
 WHERE rownum >=1;
 
2-2. 전체 목록(B)
SELECT cm_no, cm_nick, cm_title, cm_content, file1, file2, size2, cm_likeit, cm_map, cm_url, cm_cnt, cm_date,
        replycnt, grpno, indent, ansnum, cm_ch, r
 FROM(
           SELECT cm_no, cm_nick, cm_title, cm_content, file1, file2, size2, cm_likeit, cm_map, cm_url, cm_cnt, cm_date,
                  replycnt, grpno, indent, ansnum, cm_ch, rownum as r
           FROM(
                    SELECT cm_no, cm_nick, cm_title, cm_content, file1, file2, size2, cm_likeit, cm_map, cm_url, cm_cnt, cm_date,
                           replycnt, grpno, indent, ansnum, cm_ch
                    FROM community
                    where cm_ch = 'B'
                    ORDER BY grpno DESC, ansnum ASC
               )
           )
 WHERE rownum >=1;
 
3-1. 관련글 목록(A)
SELECT cm_no, cm_title, cm_date, grpno, cm_ch
FROM(         
    SELECT cm_no, cm_title, cm_date, grpno, cm_ch, rownum
    from community
    where ansnum = 0 and cm_ch = 'A'
    order by cm_no
  )
  
3-2. 관련글 목록(B)
SELECT cm_no, cm_title, cm_date, grpno, cm_ch
FROM(         
    SELECT cm_no, cm_title, cm_date, grpno, cm_ch, rownum
    from community
    where ansnum = 0 and cm_ch = 'B'
    order by cm_no
  )
  
4. 관련글 Read
SELECT cm_no, cm_nick, cm_title, cm_content, file1, file2, size2, cm_likeit, cm_map, cm_url, 
                     cm_cnt, cm_date, replycnt, grpno, indent, ansnum, rownum, cm_ch
FROM(         
  SELECT cm_no, cm_nick, cm_title, cm_content, file1, file2, size2, cm_likeit, cm_map, cm_url, 
             cm_cnt, cm_date, replycnt, grpno, indent, ansnum, rownum, cm_ch
  from community
  where ansnum = 0 
  order by cm_no
)
where grpno = 1

5-1. 관련글 정렬 리스트(A)
select cm_no, cm_nick, cm_title, cm_date, grpno, indent, ansnum, cm_ch
from community
where grpno = 1 and cm_ch = 'A'
order by ansnum

5-2. 관련글 정렬 리스트(B)
select cm_no, cm_nick, cm_title, cm_date, grpno, indent, ansnum, cm_ch
from community
where grpno = 0 and cm_ch = 'B'
order by ansnum

6. 삭제
delete from community

-- 댓글
select * from commuReply
drop table commuReply
delete from commuReply

create table commuReply(
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
 replycnt     NUMBER(7)       DEFAULT 0,
 FOREIGN KEY (cm_no) REFERENCES community(cm_no) on delete cascade,
 PRIMARY KEY(rno)
)

    SELECT rno, cm_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum
    FROM failReply
    WHERE cm_no = 7

1. 조회
   SELECT rno, cm_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum, replycnt, r
   FROM(
           SELECT rno, cm_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum, replycnt, rownum as r
           FROM(
                    SELECT rno, cm_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum, replycnt
                    FROM commuReply
                    ORDER BY grpno DESC, ansnum ASC
             )
    )
 WHERE rownum >=1;
 
2. 글작성
INSERT INTO commuReply(rno, cm_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum, replycnt)
VALUES((SELECT NVL(MAX(rno), 0)+1 as rno FROM commuReply), 3, 'nick2', 'content', 0, 0, sysdate, 
       (SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM commuReply), 0, 0, 1);  

3. 새로운 답변을 최신으로 등록하기위해 기존 답변을 뒤로 미룹니다.
UPDATE commuReply
SET ansnum = ansnum + 1
WHERE cm_no=3 and grpno = 1 AND ansnum > 1;

4. 댓글 수 조회
select count(*)rno
from commuReply
where cm_no = 3

5. 댓글 읽기
SELECT rno, cm_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum
FROM commuReply
WHERE rno = 21  

6. 추천많은 댓글 정렬
select likeup, cm_no, rcontent, rdate
from commuReply
order by likeup desc


--------------------------------------------------------------------------------------------------------------

-- 댓글
select * from reply
drop table reply
delete from reply

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
 FOREIGN KEY (cm_no) REFERENCES commu_free(cm_no) on delete cascade
)

    SELECT rno, cm_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum
    FROM reply
    WHERE cm_no = 7

1. 조회
   SELECT rno, cm_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum, r
   FROM(
           SELECT rno, cm_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum, rownum as r
           FROM(
                    SELECT rno, cm_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum
                    FROM reply
                    ORDER BY grpno DESC, ansnum ASC
             )
    )
 WHERE rownum >=1;
 
2. 글작성
INSERT INTO reply(rno, cm_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum)
VALUES((SELECT NVL(MAX(rno), 0)+1 as rno FROM reply), 5, 'nick', 'content', 0, 0, sysdate, 
       (SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM reply), 0, 0);  

INSERT INTO reply(rno, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum)
VALUES((SELECT NVL(MAX(rno), 0)+1 as rno FROM reply),'nick', 'content', 0, 0, sysdate, 
       (SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM reply), 0, 1);  
 
INSERT INTO reply(rno, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum)
VALUES((SELECT NVL(MAX(rno), 0)+1 as rno FROM reply),'nick', 'content', 0, 0, sysdate, 
       (SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM reply), 0, 2);         
       
3. 새로운 답변을 최신으로 등록하기위해 기존 답변을 뒤로 미룹니다.
UPDATE reply
SET ansnum = ansnum + 1
WHERE cm_no=3 and grpno = 1 AND ansnum > 1;

4. 댓글 수 조회
select count(*)rno
from reply
where cm_no = 4

5. 댓글 읽기
SELECT rno, cm_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum
FROM reply
WHERE rno = 21


-------------------------------------------------------------------------------------------------------------------------------
