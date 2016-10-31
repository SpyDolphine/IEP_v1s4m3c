1. 테이블 구조
DROP TABLE fnq;

CREATE TABLE fnq (                         -- 자주묻는 질문
  fq_no           NUMBER(7)      NOT NULL, -- 글 번호
  me_no           NUMBER(7)      ,         -- 회원번호
  fq_question     VARCHAR2(4000) NOT NULL, -- 질문
  fq_answer       VARCHAR2(4000) NOT NULL, -- 답변
  fq_date         DATE        default sysdate  NOT NULL, -- 등록시간    
  fq_CH           CHAR      NOT NULL,            -- 홈페이지질문인지 회사질문이지 분별
  --FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no), -- 카테고리번호
  PRIMARY KEY (fq_no)       -- 한번 등록된 값은 중복 안됨
);



2. 등록
  INSERT into fnq(fq_no, 
                    me_no, fq_question, fq_answer, fq_CH)
  VALUES((SELECT NVL(MAX(fq_no), 0)+1 as fq_no FROM fnq), 
                    #{me_no}, #{fq_question}, #{fq_answer}, #{fq_CH})
  INSERT into fnq(fq_no, 
                    me_no, fq_question, fq_answer, fq_CH)
 VALUES((SELECT NVL(MAX(fq_no), 0)+1 as fq_no FROM fnq), 1, '제목', '내용', 'C')
                    
INSERT into fnq(fq_no, me_no, fq_question, fq_answer , fq_CH)
  VALUES((SELECT NVL(MAX(fq_no), 0)+1 as fq_no FROM fnq), 1, '제목', '내용', 'C')

3. 전체 목록
    SELECT fq_no, fq_question, fq_answer, fq_CH
    FROM fnq
    ORDER BY fq_no ASC
3-1. 회사질문 목록

    SELECT fq_no, fq_question, fq_answer
    FROM fnq
    where fq_CH = 'C'
    ORDER BY fq_no ASC 
    
3-2. 홈페이지 목록

    SELECT fq_no, fq_question, fq_answer
    FROM fnq
    where fq_CH = 'H'
    ORDER BY fq_no ASC 
    
5. 수정
    UPDATE fnq 
    SET fq_question='질문 수정', fq_answer='답변 수정' 
    WHERE fq_no=1
6. 삭제
    DELETE FROM notice
    WHERE fq_no=1
    
    
        SELECT COUNT(*) as cnt
    FROM (select fq_ch
            from fnq 
             where fq_ch = 'H' )
        WHERE fq_question LIKE %a% and fq_ch = 'H'