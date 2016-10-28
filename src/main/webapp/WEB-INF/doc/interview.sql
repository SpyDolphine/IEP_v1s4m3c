1. 테이블 구조
DROP TABLE interview;

CREATE TABLE interview (                 -- 면접 테이블
  iv_no      NUMBER(7)       NOT NULL,   -- 글 번호
  iv_title   VARCHAR2(120)   NOT NULL,   -- 제목
  iv_content VARCHAR2(4000)  NOT NULL,   -- 내용
  iv_date    DATE            default sysdate,   -- 등록 시간
  PRIMARY KEY (iv_no)            -- 한번 등록된 값은 중복 안됨
);


2. 등록
  INSERT into interview(iv_no, 
                    iv_title, iv_content)
  VALUES((SELECT NVL(MAX(iv_no), 0)+1 as iv_no FROM interview), 
                    #{iv_title}, #{iv_content})
                    
 INSERT into interview(iv_no, iv_title, iv_content)
 VALUES((SELECT NVL(MAX(iv_no), 0)+1 as iv_no FROM interview), '제목', '내용')
                    
INSERT into interview(iv_no, iv_title, iv_content)
  VALUES((SELECT NVL(MAX(iv_no), 0)+1 as iv_no FROM interview), '제목', '내용')

3. 전체 목록
    SELECT iv_no, iv_title, iv_content
    FROM interview
    ORDER BY iv_no DESC
    
5. 수정
    UPDATE interview 
    SET iv_title='질문 수정', iv_content='답변 수정' 
    WHERE iv_no=1
    
6. 삭제
    DELETE FROM interview
    WHERE iv_no=1