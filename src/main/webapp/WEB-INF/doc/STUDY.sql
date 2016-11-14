CREATE TABLE STUDY  ( --It Table Web
  sy_no    NUMBER(7)                 NOT NULL PRIMARY KEY, -- 글 번호
  title       VARCHAR2(120)          NOT NULL, -- 제목
  content  VARCHAR2(4000)         NOT NULL, -- 내용
  file1      VARCHAR2(100)                 NULL ,--Thumb 파일
  file2       VARCHAR2(500)                NULL ,--파일2
  size2      NUMBER(9)  DEFAULT 0      NULL ,--파일2크기
  cnt        NUMBER(7)  DEFAULT 0 NOT NULL,--조회수
  sy_date    DATE                        NOT NULL,-- 게시물 등록시간   
  gate       VARCHAR2(10)           NOT NULL-- APP(AC,AP,AJ),WEB(WJ,WC,WH)
);
drop table STUDY;
1) 등록  
INSERT INTO STUDY(sy_no, title, content, file1, file2, size2,
                            cnt, sy_date, gate)
VALUES((SELECT NVL(MAX(sy_no), 0)+1 as sy_no FROM STUDY),
         '공부', '열심히 해보아요', 'fall_m.jpg', 'fall.jpg', 0, 0, sysdate, 'WJ');
       
2) 조회()
select * from STUDY;

3) 전체 목록(list)
  SELECT sy_no, title, gate, sy_date, cnt 
  FROM STUDY 
  WHERE gate = gate;

4) 조회(read)
SELECT sy_no,
          title, content, file1, file2, size2, cnt, sy_date, gate
FROM STUDY
WHERE sy_no=1; 

5) 수정
UPDATE STUDY
SET title='JAVA', content='JAVA 첫걸음', file1='fall_m.jpg', file2='fall.jpg', size2=1500
WHERE sy_no=1;

6) 삭제 
DELETE FROM STUDY
WHERE sy_no=1;

     SELECT sy_no, title, content, sy_date, gate , r
  FROM (
            SELECT sy_no, title, content, sy_date, gate , rownum as r
            FROM (
                      SELECT sy_no, title, content, sy_date, gate
                      FROM STUDY
                      ORDER BY sy_no DESC
                      )
  )
  WHERE r =1 AND r<= 3 AND gate='WJ'
  
