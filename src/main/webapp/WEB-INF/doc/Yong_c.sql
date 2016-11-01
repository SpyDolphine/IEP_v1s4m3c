DROP TABLE ITOS;

----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE ITOS ( -- It Table Old Sell 테이블
  io_no       NUMBER(7)     NOT NULL PRIMARY KEY, -- 글 번호
  io_title       VARCHAR2(120)  NOT NULL, -- 제목
  io_content  VARCHAR2(4000) NOT NULL, -- 내용
  io_good  NUMBER(7)  DEFAULT 0 NOT NULL,--추천수
  io_file1  VARCHAR2(100)        NULL ,--Thumb 파일
  io_file2  VARCHAR2(500)        NULL ,--파일2
  io_size2  NUMBER(9)        DEFAULT 0       NULL ,--파일2크기
  io_cnt        NUMBER(7)        DEFAULT 0       NOT NULL,--조회수
  io_replycnt  NUMBER(7)        DEFAULT 0       NOT NULL,--댓글수
  io_date     DATE          NOT NULL,        -- 등록시간   
  io_cost     VARCHAR2(200) NOT NULL,-- 금액
  io_grpno    NUMBER(2)       DEFAULT 0       NOT NULL,--답변그룹?몰라
  io_indent   NUMBER(2)        DEFAULT 0       NOT NULL,--답변차수
  io_ansnum NUMBER(5)        DEFAULT 0       NOT NULL--답변순서
);

  FOREIGN KEY (boardno) REFERENCES board(boardno),     -- 보드게시판 기본구조 참조
  FOREIGN KEY (divisionno) REFERENCES division(divisionno) ,-- 카테고리 번호
  FOREIGN KEY (me_no) REFERENCES IEP_MEMBER(me_no)         -- 회원번호

1) 등록  

INSERT INTO ITOS(io_no, io_title, io_content, io_good, io_file1, io_file2, io_size2,
                         io_cnt, io_replycnt, io_date, io_cost, io_grpno, io_indent, io_ansnum)
VALUES((SELECT NVL(MAX(io_no), 0)+1 as io_no FROM ITOS),
         '바보재현이', '재현이는 귀여워', 0, 'fall_m.jpg',  'fall.jpg', 0, 0, 0, sysdate, '금액', 0, 0, 0);
        
2) 조회
select * from ITOS;
 
3) 전체 목록(댓글 구현)
SELECT io_no,
           io_title, io_good, io_file1, io_file2, io_size2, io_cnt, io_replycnt, io_date, io_cost, 
           io_grpno, io_indent, io_ansnum
FROM ITOS
ORDER BY io_no desc;

4) 조회
SELECT io_no,
           io_title, io_content, io_good, io_file1, io_file2, io_size2, io_cnt, io_replycnt, io_date,
           io_cost, io_indent, io_ansnum
FROM ITOS
WHERE io_no=1; 

5) 수정
UPDATE ITOS
SET io_title='권재현', io_content='바보재현이', io_file1='fall_m.jpg', io_file2='fall.jpg', io_size2=1500
WHERE io_no=1;

6) 삭제
DELETE FROM ITOS
WHERE io_no=1;

7) 새로운 답변을 최신으로 등록하기위해 기존 답변을 뒤로 미룹니다.
UPDATE ITOS
SET io_ansnum = io_ansnum + 1
WHERE io_no=1  AND io_grpno=1  AND io_ansnum > 1;

8) 답변 등록
INSERT INTO ITOS(io_no,
                          io_title, io_content, io_good, io_file1, io_file2, io_size2, io_cnt, io_replycnt, io_date, 
                          io_cost, io_grpno, io_indent, io_ansnum)  
VALUES((SELECT NVL(MAX(io_no), 0)+1 as io_no FROM ITOS),
            '제목', '내용', 0, 'summer_m.jpg', 'summer.jpg', 0, 0, 0, sysdate,
            '금액', 1, 1, 1);
   
9) 답변에 따른 정렬 순서 변경 
SELECT io_no, io_title, io_content, io_good, 
           io_file1, io_file2, io_size2, io_cnt, io_replycnt, io_date, io_cost, io_grpno, io_indent, io_ansnum, r
FROM(
         SELECT io_no, io_title, io_content, io_good,
                    io_file1, io_file2, io_size2, io_cnt, io_replycnt, io_date, io_cost, io_indent, io_grpno, io_ansnum, rownum as r
         FROM(
                  SELECT io_no, io_title, io_content, io_good,
                             io_file1, io_file2, io_size2, io_cnt, io_replycnt, io_date, io_cost, io_grpno , io_indent, io_ansnum
                  FROM ITOS
                  WHERE io_no=1
                  ORDER BY io_grpno DESC, io_ansnum ASC
         )
)
WHERE r >=1 AND r <= 3;

----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE APP  ( -- It Table Application
  ap_no       NUMBER(7)     NOT NULL PRIMARY KEY, -- 글 번호
  ap_title    VARCHAR2(120)  NOT NULL, -- 제목
  ap_content  VARCHAR2(4000) NOT NULL, -- 내용
  ap_good  NUMBER(7)  DEFAULT 0 NOT NULL,--추천수
  ap_file1  VARCHAR2(100)        NULL ,--Thumb 파일
  ap_file2  VARCHAR2(500)        NULL ,--파일2
  ap_size2  NUMBER(9)        DEFAULT 0       NULL ,--파일2크기
  ap_cnt        NUMBER(7)        DEFAULT 0       NOT NULL,--조회수
  ap_replycnt  NUMBER(7)        DEFAULT 0       NOT NULL,--댓글수
  ap_date     DATE          NOT NULL,        -- 등록시간  
  ap_grpno    NUMBER(2)       DEFAULT 0       NOT NULL,--답변그룹?몰라번혼가?
  ap_indent  NUMBER(2)        DEFAULT 0       NOT NULL,--답변차수
  ap_ansnum NUMBER(5)        DEFAULT 0       NOT NULL--답변순서
);

drop table app
1) 등록  
INSERT INTO APP(ap_no, ap_title, ap_content, ap_good, ap_file1, ap_file2, ap_size2,
                         ap_cnt, ap_replycnt, ap_date, ap_grpno, ap_indent, ap_ansnum)
VALUES((SELECT NVL(MAX(ap_no), 0)+1 as ap_no FROM APP),
         '바보재현이', '재현이는 귀여워', 0, 'fall_m.jpg',  'fall.jpg', 0, 0, 0, sysdate, 0, 0, 0);


2) 조회
select * from APP;

3) 전체 목록(댓글 구현)
SELECT ap_no,
          ap_title, ap_content, ap_good, ap_file1, ap_file2, ap_size2, ap_cnt, ap_replycnt, ap_date, 
          ap_grpno, ap_indent, ap_ansnum
FROM APP
ORDER BY ap_no asc;

4) 조회
SELECT ap_no,
          ap_title, ap_content, ap_good, ap_file1, ap_file2, ap_size2, ap_cnt, ap_replycnt, ap_date,
          ap_grpno, ap_indent, ap_ansnum
FROM APP
WHERE ap_no=1; 

5) 수정
UPDATE APP
SET ap_title='권재현', ap_content='바보재현이', ap_file1='fall_m.jpg', ap_file2='fall.jpg', ap_size2=1500
WHERE ap_no=1;

6) 삭제
DELETE FROM APP
WHERE ap_no=1;

7) 새로운 답변을 최신으로 등록하기위해 기존 답변을 뒤로 미룹니다.
UPDATE APP
SET ap_ansnum = ap_ansnum + 1
WHERE ap_no=1  AND ap_grpno=1  AND ap_ansnum > 1;

8) 답변 등록
INSERT INTO APP(ap_no,
                          ap_title, ap_content, ap_good, ap_file1, ap_file2, ap_size2, ap_cnt, ap_replycnt, ap_date, 
                          ap_grpno, ap_indent, ap_ansnum)  
VALUES((SELECT NVL(MAX(ap_no), 0)+1 as ap_no FROM APP),
            '제목', '내용', 0, 'summer_m.jpg', 'summer.jpg', 0, 0, 0, sysdate,
            1, 1, 1);
   
9) 답변에 따른 정렬 순서 변경 
SELECT ap_no, ap_title, ap_content, ap_good, 
           ap_file1, ap_file2, ap_size2, ap_cnt, ap_replycnt, ap_date, ap_grpno, ap_indent, ap_ansnum, r
FROM(
         SELECT ap_no, ap_title, ap_content, ap_good,
                    ap_file1, ap_file2, ap_size2, ap_cnt, ap_replycnt, ap_date, ap_indent, ap_grpno, ap_ansnum, rownum as r
         FROM(
                  SELECT ap_no, ap_title, ap_content, ap_good,
                             ap_file1, ap_file2, ap_size2, ap_cnt, ap_replycnt, ap_date, ap_grpno , ap_indent, ap_ansnum
                  FROM APP
                  WHERE ap_no=1
                  ORDER BY ap_grpno DESC, ap_ansnum ASC
         )
)
WHERE r >=1 AND r <= 3;
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE WEB  ( --It Table Web
  wb_no       NUMBER(7)     NOT NULL PRIMARY KEY, -- 글 번호
  wb_title    VARCHAR2(120)  NOT NULL, -- 제목
  wb_content  VARCHAR2(4000) NOT NULL, -- 내용
  wb_good  NUMBER(7)  DEFAULT 0 NOT NULL,--추천수
  wb_file1  VARCHAR2(100)        NULL ,--Thumb 파일
  wb_file2  VARCHAR2(500)        NULL ,--파일2
  wb_size2  NUMBER(9)        DEFAULT 0       NULL ,--파일2크기
  wb_cnt        NUMBER(7)        DEFAULT 0       NOT NULL,--조회수
  wb_replycnt  NUMBER(7)        DEFAULT 0       NOT NULL,--댓글수
  wb_date     DATE          NOT NULL,        -- 등록시간   
  wb_grpno    NUMBER(2)       DEFAULT 0       NOT NULL,--답변그룹?몰라번혼가?
  wb_indent  NUMBER(2)        DEFAULT 0       NOT NULL,--답변차수
  wb_ansnum NUMBER(5)        DEFAULT 0       NOT NULL--답변순서 
);
drop table WEB;
1) 등록  
INSERT INTO WEB(wb_no, wb_title, wb_content, wb_good, wb_file1, wb_file2, wb_size2,
                         wb_cnt, wb_replycnt, wb_date, wb_grpno, wb_indent, wb_ansnum)
VALUES((SELECT NVL(MAX(wb_no), 0)+1 as wb_no FROM WEB),
         '바보재현이', '재현이는 귀여워', 0, 'fall_m.jpg',  'fall.jpg', 0, 0, 0, sysdate, 0, 0, 0);
       
2) 조회
select * from WEB;

3) 전체 목록(댓글 구현)
SELECT wb_no,
          wb_title, wb_content, wb_good, wb_file1, wb_file2, wb_size2, wb_cnt, wb_replycnt, wb_date, 
          wb_grpno, wb_indent, wb_ansnum
FROM WEB
ORDER BY wb_no asc;

4) 조회
SELECT wb_no,
          wb_title, wb_content, wb_good, wb_file1, wb_file2, wb_size2, wb_cnt, wb_replycnt, wb_date,
          wb_grpno, wb_indent, wb_ansnum
FROM WEB
WHERE wb_no=1; 

5) 수정
UPDATE WEB
SET wb_title='권재현', wb_content='바보재현이', wb_file1='fall_m.jpg', wb_file2='fall.jpg', wb_size2=1500
WHERE wb_no=1;

6) 삭제 
DELETE FROM WEB
WHERE wb_no=1;


7) 새로운 답변을 최신으로 등록하기위해 기존 답변을 뒤로 미룹니다.
UPDATE WEB
SET wb_ansnum = wb_ansnum + 1
WHERE wb_no=1  AND wb_grpno=1  AND wb_ansnum > 1;

8) 답변 등록
INSERT INTO WEB(wb_no,
                          wb_title, wb_content, wb_good, wb_file1, wb_file2, wb_size2, wb_cnt, wb_replycnt, wb_date, 
                          wb_grpno, wb_indent, wb_ansnum)  
VALUES((SELECT NVL(MAX(wb_no), 0)+1 as wb_no FROM WEB),
            '제목', '내용', 0, 'summer_m.jpg', 'summer.jpg', 0, 0, 0, sysdate,
            1, 1, 1);
   
9) 답변에 따른 정렬 순서 변경 
SELECT wb_no, wb_title, wb_content, wb_good, 
           wb_file1, wb_file2, wb_size2, wb_cnt, wb_replycnt, wb_date, wb_grpno, wb_indent, wb_ansnum, r
FROM(
         SELECT wb_no, wb_title, wb_content, wb_good,
                    wb_file1, wb_file2, wb_size2, wb_cnt, wb_replycnt, wb_date, wb_indent, wb_grpno, wb_ansnum, rownum as r
         FROM(
                  SELECT wb_no, wb_title, wb_content, wb_good,
                             wb_file1, wb_file2, wb_size2, wb_cnt, wb_replycnt, wb_date, wb_grpno , wb_indent, wb_ansnum
                  FROM WEB
                  WHERE wb_no=1
                  ORDER BY wb_grpno DESC, wb_ansnum ASC
         )
)
WHERE r >=1 AND r <= 3;
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE TQNA  ( --Table Q&A
  qa_no       NUMBER(7)     NOT NULL PRIMARY KEY, -- 글 번호
  qa_title    VARCHAR2(120)  NOT NULL, -- 제목
  qa_content  VARCHAR2(4000) NOT NULL, -- 내용
  qa_good  NUMBER(7)  DEFAULT 0 NOT NULL,--추천수
  qa_file1  VARCHAR2(100)        NULL ,--Thumb 파일
  qa_file2  VARCHAR2(500)        NULL ,--파일2
  qa_size2  NUMBER(9)        DEFAULT 0       NULL ,--파일2크기
  qa_cnt        NUMBER(7)        DEFAULT 0       NOT NULL,--조회수
  qa_replycnt  NUMBER(7)        DEFAULT 0       NOT NULL,--댓글수
  qa_date     DATE          NOT NULL,        -- 등록시간   
  qa_grpno    NUMBER(2)       DEFAULT 0       NOT NULL,--답변그룹?몰라번혼가?
  qa_indent  NUMBER(2)        DEFAULT 0       NOT NULL,--답변차수
  qa_ansnum NUMBER(5)        DEFAULT 0       NOT NULL--답변순서 
);
drop table TQNA;

1) 등록  
INSERT INTO TQNA(qa_no, qa_title, qa_content, qa_good, qa_file1, qa_file2, qa_size2,
                          qa_cnt, qa_replycnt, qa_date, qa_grpno, qa_indent, qa_ansnum)
VALUES((SELECT NVL(MAX(qa_no), 0)+1 as qa_no FROM TQNA),
         '바보재현이', '재현이는 귀여워', 0, 'fall_m.jpg',  'fall.jpg', 0, 0, 0, sysdate, 0, 0, 0);
        
2) 조회
select * from TQNA;

3) 전체 목록(댓글 구현)
SELECT qa_no,
          qa_title, qa_content, qa_good, qa_file1, qa_file2, qa_size2, qa_cnt, qa_replycnt, qa_date, 
          qa_grpno, qa_indent, qa_ansnum
FROM TQNA
ORDER BY qa_no asc;

4) 조회
SELECT qa_no,
          qa_title, qa_content, qa_good, qa_file1, qa_file2, qa_size2, qa_cnt, qa_replycnt, qa_date,
          qa_grpno, qa_indent, qa_ansnum
FROM TQNA
WHERE qa_no=1; 

5) 수정
UPDATE TQNA
SET qa_title='권재현', qa_content='바보재현이', qa_file1='fall_m.jpg', qa_file2='fall.jpg', qa_size2=1500
WHERE qa_no=1;

6) 삭제 
DELETE FROM TQNA
WHERE qa_no=1;


7) 새로운 답변을 최신으로 등록하기위해 기존 답변을 뒤로 미룹니다.
UPDATE TQNA
SET qa_ansnum = qa_ansnum + 1
WHERE qa_no=1  AND qa_grpno=1  AND qa_ansnum > 1;

8) 답변 등록
INSERT INTO TQNA(qa_no,
                          qa_title, qa_content, qa_good, qa_file1, qa_file2, qa_size2, qa_cnt, qa_replycnt, qa_date, 
                          qa_grpno, qa_indent, qa_ansnum)  
VALUES((SELECT NVL(MAX(qa_no), 0)+1 as qa_no FROM TQNA),
            '제목', '내용', 0, 'summer_m.jpg', 'summer.jpg', 0, 0, 0, sysdate,
            1, 1, 1);
   
9) 답변에 따른 정렬 순서 변경 
SELECT qa_no, qa_title, qa_content, qa_good, 
           qa_file1, qa_file2, qa_size2, qa_cnt, qa_replycnt, qa_date, qa_grpno, qa_indent, qa_ansnum, r
FROM(
         SELECT qa_no, qa_title, qa_content, qa_good,
                    qa_file1, qa_file2, qa_size2, qa_cnt, qa_replycnt, qa_date, qa_indent, qa_grpno, qa_ansnum, rownum as r
         FROM(
                  SELECT qa_no, qa_title, qa_content, qa_good,
                             qa_file1, qa_file2, qa_size2, qa_cnt, qa_replycnt, qa_date, qa_grpno , qa_indent, qa_ansnum
                  FROM TQNA
                  WHERE qa_no=1
                  ORDER BY qa_grpno DESC, qa_ansnum ASC
         )
)
WHERE r >=1 AND r <= 3;

----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE license  ( --It Table Web
  lc_no       NUMBER(7)     NOT NULL PRIMARY KEY, -- 글 번호
  lc_title    VARCHAR2(120)  NOT NULL, -- 제목
  lc_content  VARCHAR2(4000) NOT NULL, -- 내용
  lc_good  NUMBER(7)  DEFAULT 0 NOT NULL,--추천수
  lc_file1  VARCHAR2(100)        NULL ,--Thumb 파일
  lc_file2  VARCHAR2(500)        NULL ,--파일2
  lc_size2  NUMBER(9)        DEFAULT 0       NULL ,--파일2크기
  lc_cnt        NUMBER(7)        DEFAULT 0       NOT NULL,--조회수
  lc_replycnt  NUMBER(7)        DEFAULT 0       NOT NULL,--댓글수
  lc_date     DATE          NOT NULL,        -- 등록시간
  lc_grpno    NUMBER(2)       DEFAULT 0       NOT NULL,--답변그룹?몰라   
  lc_indent  NUMBER(2)        DEFAULT 0       NOT NULL,--답변차수
  lc_ansnum NUMBER(5)        DEFAULT 0       NOT NULL--답변순서 
);
drop table license;

1) 등록  
INSERT INTO license(lc_no, lc_title, lc_content, lc_good, lc_file1, lc_file2, lc_size2,
                         lc_cnt, lc_replycnt, lc_date, lc_grpno, lc_indent, lc_ansnum)
VALUES((SELECT NVL(MAX(lc_no), 0)+1 as lc_no FROM license),
         '바보재현이', '재현이는 귀여워', 0, 'fall_m.jpg',  'fall.jpg', 0, 0, 0, sysdate, 0, 0, 0);
        
2) 조회
select * from license;

3) 전체 목록(댓글 구현)
SELECT lc_no,
          lc_title, lc_content, lc_good, lc_file1, lc_file2, lc_size2, lc_cnt, lc_replycnt, lc_date, 
          lc_grpno, lc_indent, lc_ansnum
FROM license
ORDER BY lc_no asc;

4) 조회
SELECT lc_no,
          lc_title, lc_content, lc_good, lc_file1, lc_file2, lc_size2, lc_cnt, lc_replycnt, lc_date,
          lc_grpno, lc_indent, lc_ansnum
FROM license
WHERE lc_no=1; 

5) 수정
UPDATE license
SET lc_title='권재현', lc_content='바보재현이', lc_file1='fall_m.jpg', lc_file2='fall.jpg', lc_size2=1500
WHERE lc_no=1;

6) 삭제 
DELETE FROM license
WHERE lc_no=1;


7) 새로운 답변을 최신으로 등록하기위해 기존 답변을 뒤로 미룹니다.
UPDATE license
SET lc_ansnum = lc_ansnum + 1
WHERE lc_no=1  AND lc_grpno=1  AND lc_ansnum > 1;

8) 답변 등록
INSERT INTO license(lc_no,
                          lc_title, lc_content, lc_good, lc_file1, lc_file2, lc_size2, lc_cnt, lc_replycnt, lc_date, 
                          lc_grpno, lc_indent, lc_ansnum)  
VALUES((SELECT NVL(MAX(lc_no), 0)+1 as lc_no FROM license),
            '제목', '내용', 0, 'summer_m.jpg', 'summer.jpg', 0, 0, 0, sysdate,
            1, 1, 1);
   
9) 답변에 따른 정렬 순서 변경 
SELECT lc_no, lc_title, lc_content, lc_good, 
           lc_file1, lc_file2, lc_size2, lc_cnt, lc_replycnt, lc_date, lc_grpno, lc_indent, lc_ansnum, r
FROM(
         SELECT lc_no, lc_title, lc_content, lc_good,
                    lc_file1, lc_file2, lc_size2, lc_cnt, lc_replycnt, lc_date, lc_indent, lc_grpno, lc_ansnum, rownum as r
         FROM(
                  SELECT lc_no, lc_title, lc_content, lc_good,
                             lc_file1, lc_file2, lc_size2, lc_cnt, lc_replycnt, lc_date, lc_grpno , lc_indent, lc_ansnum
                  FROM license
                  WHERE lc_no=1
                  ORDER BY lc_grpno DESC, lc_ansnum ASC
         )
)
WHERE r >=1 AND r <= 3;
