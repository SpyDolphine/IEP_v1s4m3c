1. 테이블 구조
DROP TABLE notice;

CREATE TABLE fnq ( -- 공지사항 테이블
  fq_no           NUMBER(7)      NOT NULL, -- 글 번호
  me_no           NUMBER(7)      ,         -- 회원번호
  fq_question     VARCHAR2(4000)  NOT NULL, -- 질문
  fq_answer       VARCHAR2(4000) NOT NULL, -- 답변
  fq_date         DATE        default sysdate  NOT NULL, -- 등록시간    
  --FOREIGN KEY (me_id) REFERENCES IEP_MEMBER (me_id), -- 카테고리번호
  PRIMARY KEY (fq_no)       -- 한번 등록된 값은 중복 안됨
);


2. 등록

INSERT IfqO notice(fq_no, me_no, fq_question, fq_answer )
  VALUES((SELECT NVL(MAX(fq_no), 0)+1 as fq_no FROM notice), 1, '제목', '내용')

3. 목록
    SELECT fq_no, fq_question
    FROM notice
    ORDER BY fq_no ASC 
    
4. 조회
    SELECT fq_no, me_no, fq_question, fq_answer, fq_date 
    FROM notice
    WHERE fq_no= 1
    
5. 수정
    UPDATE notice 
    SET fq_question='질문 수정', fq_answer='답변 수정' 
    WHERE fq_no=1
6. 삭제
    DELETE FROM notice
    WHERE fq_no=1