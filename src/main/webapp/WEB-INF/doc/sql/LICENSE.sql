CREATE TABLE LICENSE  ( --It Table Web
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
drop table LICENSE;

1) 등록  
INSERT INTO LICENSE(lc_no, lc_title, lc_content, lc_good, lc_file1, lc_file2, lc_size2,
                         lc_cnt, lc_replycnt, lc_date, lc_grpno, lc_indent, lc_ansnum)
VALUES((SELECT NVL(MAX(lc_no), 0)+1 as lc_no FROM LICENSE),
         '바보재현이', '재현이는 귀여워', 0, 'fall_m.jpg',  'fall.jpg', 0, 0, 0, sysdate, 0, 0, 0);
        
2) 조회
select * from LICENSE;

3) 전체 목록(댓글 구현)
SELECT lc_no,
          lc_title, lc_content, lc_good, lc_file1, lc_file2, lc_size2, lc_cnt, lc_replycnt, lc_date, 
          lc_grpno, lc_indent, lc_ansnum
FROM LICENSE
ORDER BY lc_no asc;

4) 조회
SELECT lc_no,
          lc_title, lc_content, lc_good, lc_file1, lc_file2, lc_size2, lc_cnt, lc_replycnt, lc_date,
          lc_grpno, lc_indent, lc_ansnum
FROM LICENSE
WHERE lc_no=1; 

5) 수정
UPDATE LICENSE
SET lc_title='권재현', lc_content='바보재현이', lc_file1='fall_m.jpg', lc_file2='fall.jpg', lc_size2=1500
WHERE lc_no=1;

6) 삭제 
DELETE FROM LICENSE
WHERE lc_no=1;


7) 새로운 답변을 최신으로 등록하기위해 기존 답변을 뒤로 미룹니다.
UPDATE LICENSE
SET lc_ansnum = lc_ansnum + 1
WHERE lc_no=1  AND lc_grpno=1  AND lc_ansnum > 1;

8) 답변 등록
INSERT INTO LICENSE(lc_no,
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
                  FROM LICENSE
                  WHERE lc_no=1
                  ORDER BY lc_grpno DESC, lc_ansnum ASC
         )
)
WHERE r >=1 AND r <= 3;
