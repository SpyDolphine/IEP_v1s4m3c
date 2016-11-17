CREATE TABLE LICENSE  ( --LICENSE
  lc_no       NUMBER(7)     NOT NULL PRIMARY KEY, -- 글 번호
  lc_title    VARCHAR2(120)  NOT NULL, -- 제목
  lc_content  VARCHAR2(4000) NOT NULL, -- 내용
  lc_file1    VARCHAR2(100)        NULL ,--Thumb 파일
  lc_file2    VARCHAR2(500)        NULL ,--파일2
  lc_size2    NUMBER(9) DEFAULT 0       NULL ,--파일2크기
  lc_date     DATE          NOT NULL,        -- 등록시간
  lc_date1    VARCHAR2(30)  NULL,        -- 시작일
  lc_date2    VARCHAR2(30)  NULL,        -- 종료일
  lc_date3    VARCHAR2(30)  NULL,        -- 시험날
  lc_date4    VARCHAR2(30)  NULL         -- 발표일
);
drop table LICENSE;

1) 등록  
INSERT INTO LICENSE(lc_no, lc_title, lc_content, lc_file1, lc_file2, lc_size2,
                    lc_date, lc_date1, lc_date2, lc_date3, lc_date4)
VALUES((SELECT NVL(MAX(lc_no), 0)+1 as lc_no FROM LICENSE),
         '자격증', '자격증 내용', 'fall_m.jpg',  'fall.jpg', 0, sysdate, '2016-11-10', '2016-11-15', '2016-11-17', '2016-11-18');
        
2) 조회
select * from LICENSE;

3) 전체 목록
SELECT lc_no,
          lc_title, lc_file1, lc_file2, lc_date,
          lc_date1, lc_date2, lc_date3, lc_date4      
FROM LICENSE
ORDER BY lc_no DESC;

4) 조회
SELECT lc_no,
          lc_title, lc_content, lc_file1, lc_file2, lc_size2, lc_date,
          lc_date1, lc_date2, lc_date3, lc_date4
FROM LICENSE
WHERE lc_no=1; 

5) 수정
UPDATE LICENSE
SET lc_title='정보처리기사', lc_content='정보처리기사 필기 실기 등등', lc_file1='fall_m.jpg', lc_file2='fall.jpg', lc_size2=1500,
    lc_date1='2016-1-1', lc_date2='2016-1-1', lc_date3='2016-1-1', lc_date4='2016-1-1'
WHERE lc_no=1;

6) 삭제 
DELETE FROM LICENSE
WHERE lc_no=1;
