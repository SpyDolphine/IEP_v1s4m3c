1. 테이블 구조
DROP TABLE aboutme;

CREATE TABLE aboutme (             -- 자소서 테이블
  am_no      NUMBER(7)       NOT NULL,   -- 글 번호
  am_title   VARCHAR2(4000)  NOT NULL,  -- 제목
  am_content VARCHAR2(4000)  NOT NULL,   -- 내용
  am_date    DATE            default sysdate,   -- 등록 시간
  PRIMARY KEY (am_no)            -- 한번 등록된 값은 중복 안됨
);



2. 등록
  INSERT into aboutme(am_no, 
                    am_title, am_content, fq_CH)
  VALUES((SELECT NVL(MAX(am_no), 0)+1 as am_no FROM aboutme), 
                    #{am_title}, #{am_content}, #{fq_CH})
  INSERT into aboutme(am_no, am_title, am_content)
 VALUES((SELECT NVL(MAX(am_no), 0)+1 as am_no FROM aboutme), '제목', '내용')
                    
INSERT into aboutme(am_no, am_title, am_content , fq_CH)
  VALUES((SELECT NVL(MAX(am_no), 0)+1 as am_no FROM aboutme), 1, '제목', '내용', 'C')

3. 전체 목록
    SELECT am_no, am_title, am_content
    FROM aboutme
    ORDER BY am_no ASC
    
5. 수정
    UPDATE aboutme 
    SET am_title='질문 수정', am_content='답변 수정' 
    WHERE am_no=1
6. 삭제
    DELETE FROM notice
    WHERE am_no=1