1. 테이블 구조
DROP TABLE tip;

CREATE TABLE tip (
  tp_no      NUMBER(7)       NOT NULL,   -- 글 번호
  tp_title   VARCHAR2(4000)  NOT NULL,  -- 제목
  tp_content VARCHAR2(4000)  NOT NULL,   -- 내용
  tp_ch      VARCHAR2(2)     NOT NULL,   -- 구분표어
  tp_date    DATE            default sysdate,   -- 등록 시간
  PRIMARY KEY (tp_no)            -- 한번 등록된 값은 중복 안됨
);



2. 등록
  INSERT into tip(tp_no, 
                    tp_title, tp_content, tp_ch)
  VALUES((SELECT NVL(MAX(tp_no), 0)+1 as tp_no FROM tip), 
                    #{tp_title}, #{tp_content}, #{tp_ch})
                    
  INSERT into tip(tp_no, tp_title, tp_content, tp_ch)
    VALUES((SELECT NVL(MAX(tp_no), 0)+1 as tp_no FROM tip), '제목', '내용', 'A')
                    
  INSERT into tip(tp_no, tp_title, tp_content , tp_ch)
    VALUES((SELECT NVL(MAX(tp_no), 0)+1 as tp_no FROM tip), 1, '제목', '내용', 'C')

3. 전체 목록
    SELECT tp_no, tp_title, tp_content, tp_ch
    FROM tip
    ORDER BY tp_no DESC
    
4. 게시판별 목록
-- 자소서 테이블
    SELECT tp_no, tp_title, tp_content, tp_ch
    FROM tip
    WHERE tp_ch = 'A'
    ORDER BY tp_no DESC
-- 면접 테이블    
    SELECT tp_no, tp_title, tp_content, tp_ch
    FROM tip
    WHERE tp_ch = 'I'
    ORDER BY tp_no DESC

    SELECT tp_no, tp_title, tp_content, tp_ch
    FROM tip
    WHERE tp_ch = #{tp_ch}
    ORDER BY tp_no DESC
    
5. 수정
    UPDATE tip 
    SET tp_title='질문 수정', tp_content='답변 수정' , tp_ch='A'
    WHERE tp_no=1
6. 삭제
    DELETE FROM tip
    WHERE tp_no=1