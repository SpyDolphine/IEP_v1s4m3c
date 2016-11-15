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
                  ORDER BY io_grpno DESC, io_ansnum ASC
         )
)
WHERE r >=1 AND r <= 3;
