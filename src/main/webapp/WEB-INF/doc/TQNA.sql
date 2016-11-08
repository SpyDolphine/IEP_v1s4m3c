CREATE TABLE TQNA  ( --Table Q&A
  qa_no       NUMBER(7)     NOT NULL PRIMARY KEY, -- 글 번호
  qa_title    VARCHAR2(120)  NOT NULL, -- 제목
  qa_content  VARCHAR2(4000) NOT NULL, -- 내용
  qa_good  NUMBER(7)  DEFAULT 0 NOT NULL,--추천수
  qa_cnt        NUMBER(7)        DEFAULT 0       NOT NULL,--조회수
  qa_replycnt  NUMBER(7)        DEFAULT 0       NOT NULL,--댓글수
  qa_date     DATE          NOT NULL,        -- 등록시간
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