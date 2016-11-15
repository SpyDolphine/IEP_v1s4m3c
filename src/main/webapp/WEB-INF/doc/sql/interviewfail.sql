<취업 실패후기>
- 조건 : 익명게시판
- 칼럼 : 취업지원계열, 직급 및 직무, 근무지역, 학력 및 경력, 성별, 면접 질문, 답변, 채용방식, 발표시기, 취업과정(서류준비 및 면접과정)
         면접 난이도(1~5), 면접 경험(긍정적, 부정적, 보통), 취업경로(온라인지원, 추천, 공개채용, 취업지원센터, 헤드헌터, 기타)
         
drop table interview_fail
delete from interview_fail where if_no=1;
         
create table interview_fail (
   if_no       NUMBER(7)      not null,                     -- 글번호
   if_title    VARCHAR2(200)  NOT NULL,                     -- 한줄평
   if_id       varchar2(100)  not null,                     -- 이메일
   if_nick     varchar2(30)   not null,                     -- 닉네임
   if_gender   varchar2(10)   not null,                     -- 성별(radio)
   if_company  varchar2(100)  not null,                     -- 취업지원계열
   if_position varchar2(300)  not null,                     -- 직급 및 직무
   if_region   varchar2(20)   not null,                     -- 근무지역
   if_content  varchar2(3000) not null,                     -- 취업과정(서류준비/포폴 및 면접과정)
   if_q        varchar2(3000) not null,                     -- 면접 질문
   if_a        varchar2(3000) not null,                     -- 면접 답변
   if_level    varchar2(30)   not null,                     -- 면접 난이도 (radio)
   if_exper    varchar2(20)   not null,                     -- 면접 경험 (radio)
   if_where    varchar2(100)  not null,                     -- 취업경로(radio)
   if_how      varchar2(200)  not null,                     -- 채용방식
   if_when     varchar2(50)   null,                         -- 발표시기
   if_likeit   number(7)      default 0,                    -- 좋아요(추천합니다)
   if_date     date           not null,                     -- 날짜
   if_cnt      NUMBER(7)      default 0,                    -- 조회수
   PRIMARY KEY(if_no)
);
select * from interview_fail
1. 등록
-- INSERT
INSERT INTO interview_fail(if_no,if_title,if_id,if_nick,if_gender,if_company,if_position,if_region,if_content,if_q,if_a,if_level,if_exper,if_where,if_how,if_when,if_date)
VALUES((SELECT NVL(MAX(if_no), 0)+1 as if_no FROM interview_fail),'1','1','1','남자','1','1',
'1','1','1','1','1','1','1','1','1',sysdate)
 ...);
 
 
2. 검색
  SELECT if_no, if_title, if_id, if_nick, if_gender, if_company, if_position, if_region, if_content, if_q, if_a,
         if_level, if_exper, if_where, if_how, if_when, if_date
  FROM interview_fail
  ORDER BY if_no ASC;
  
3. 읽기
	SELECT if_no, if_title, if_id, if_nick, if_gender, if_company, if_position, if_region, if_content, if_q, if_a,
	       if_level, if_exper, if_where, if_how, if_when, if_date
	FROM interview_fail
	WHERE if_no= 1;

4. 조회수 증가
update interview_fail
set if_cnt = if_cnt + 1
where if_no = 7

5. 많이본글 정렬
select if_cnt, if_no, if_title, if_date
from interview_fail
order by if_cnt desc


	-------------------------------------------------------------------------------------------------------------------------
-- 댓글
select * from failReply
drop table failReply
delete from failReply

create table failReply(
 rno          NUMBER(7)       not null,                   -- 글 번호
 if_no        NUMBER(7)       not null,                   -- 글 번호
 rnick        varchar2(30)    not null,                   -- 닉네임
 rcontent     varchar2(4000)  not null,                   -- 글 내용
 likeup       NUMBER(7)       default 0,                  -- 추천
 likedown     NUMBER(7)       default 0,                  -- 비추천
 grpno        NUMBER(7)       NOT NULL,
 indent       NUMBER(2)       DEFAULT 0,
 ansnum       NUMBER(5)       DEFAULT 0,  
 rdate        DATE            not null,                   -- 등록날짜
 FOREIGN KEY (if_no) REFERENCES interview_fail(if_no) on delete cascade,
 PRIMARY KEY(rno)
)

    SELECT rno, if_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum
    FROM failReply
    WHERE cm_no = 7

1. 조회
   SELECT rno, if_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum, r
   FROM(
           SELECT rno, if_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum, rownum as r
           FROM(
                    SELECT rno, if_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum
                    FROM failReply
                    ORDER BY grpno DESC, ansnum ASC
             )
    )
 WHERE rownum >=1;
 
2. 글작성
INSERT INTO failReply(rno, if_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum)
VALUES((SELECT NVL(MAX(rno), 0)+1 as rno FROM failReply), 3, 'nick2', 'content', 0, 0, sysdate, 
       (SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM failReply), 0, 0);  

3. 새로운 답변을 최신으로 등록하기위해 기존 답변을 뒤로 미룹니다.
UPDATE failReply
SET ansnum = ansnum + 1
WHERE if_no=3 and grpno = 1 AND ansnum > 1;

4. 댓글 수 조회
select count(*)rno
from failReply
where if_no = 3

5. 댓글 읽기
SELECT rno, if_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum
FROM failReply
WHERE rno = 21	

6. 추천많은 댓글 정렬
select likeup, if_no, rcontent, rdate
from failReply
order by likeup desc