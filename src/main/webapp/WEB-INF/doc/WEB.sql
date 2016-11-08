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