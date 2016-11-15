CREATE TABLE TQNA  ( --Table Q&A
  qa_no       NUMBER(7)     NOT NULL PRIMARY KEY, -- 글 번호
  qa_title    VARCHAR2(120)  NOT NULL, -- 제목
  qa_content  VARCHAR2(4000) NOT NULL, -- 내용
  qa_good  NUMBER(7)  DEFAULT 0 NOT NULL,--추천수
  qa_cnt        NUMBER(7)        DEFAULT 0       NOT NULL,--조회수
  qa_date     DATE          NOT NULL       -- 등록시간
);
drop table TQNA;

1) 등록  
INSERT INTO TQNA(qa_no, qa_title, qa_content, qa_good,
                          qa_cnt, qa_date)
VALUES((SELECT NVL(MAX(qa_no), 0)+1 as qa_no FROM TQNA),
         '바보재현이', '재현이는 귀여워', 0, 0, sysdate);
        
2) 조회
select * from TQNA;

3) 전체 목록(댓글 구현)
SELECT qa_no,
          qa_title, qa_content, qa_good, qa_cnt, qa_date
FROM TQNA
ORDER BY qa_no DESC;

4) 조회
SELECT qa_no,
          qa_title, qa_content, qa_good, qa_cnt, qa_date
FROM TQNA
WHERE qa_no=1; 

5) 수정
UPDATE TQNA
SET qa_title='권재현', qa_content='바보재현이'
WHERE qa_no=1;

6) 삭제 
DELETE FROM TQNA
WHERE qa_no=1;
