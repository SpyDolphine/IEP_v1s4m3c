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