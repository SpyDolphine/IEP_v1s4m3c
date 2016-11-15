1. 테이블 구조
DROP TABLE notice;

CREATE TABLE notice ( -- 공지사항 테이블
  nt_no       NUMBER(7)      NOT NULL, -- 글 번호
  nt_nt       CHAR(1)      default 'N', -- 공지사항여부
  nt_title    VARCHAR2(120)  NOT NULL, -- 제목
  nt_content  VARCHAR2(4000) NOT NULL, -- 내용
  nt_date       DATE        default sysdate  NOT NULL, -- 등록시간    
  PRIMARY KEY (nt_no)       -- 한번 등록된 값은 중복 안됨
);


2. 등록

INSERT INTO notice(nt_no, me_no, nt_title, nt_content )
  VALUES((SELECT NVL(MAX(nt_no), 0)+1 as nt_no FROM notice), 1, '제목', '내용')

3. 목록
    SELECT nt_no, nt_title
    FROM notice
    ORDER BY nt_no ASC 
    
4. 조회
    SELECT nt_no, me_no, nt_title, nt_content, nt_date 
    FROM notice
    WHERE nt_no= 1
    
5. 수정
    UPDATE notice 
    SET nt_title='제목 수정', nt_content='내용 수정' 
    WHERE nt_no=1
6. 삭제
    DELETE FROM notice
    WHERE nt_no=1
    
    
select * from notice