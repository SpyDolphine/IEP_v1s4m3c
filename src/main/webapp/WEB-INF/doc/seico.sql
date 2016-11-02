1. 테이블 삭제

drop table seico

2. 테이블 제작

drop table seico
--2)취업 성공 후기
CREATE TABLE seico(
    sc_no                              NUMBER(7)        NOT NULL    PRIMARY KEY, --글 번호
    sc_area                            VARCHAR2(40)     NOT NULL,                --지역
    sc_jobs                            VARCHAR2(40)     NOT NULL,                --직종
    sc_gender                          VARCHAR2(10)     NOT NULL,                -- 성별(radio)
    sc_position                        VARCHAR2(300)    NOT NULL,                -- 직급 및 직무
    sc_title                           VARCHAR2(200)    NOT NULL,                --제목
    sc_name                            VARCHAR2(100)    NOT NULL,
    sc_cont                            VARCHAR2(4000)   NOT NULL,                --내용
    sc_q                               VARCHAR2(4000)   NOT NULL,                --면접 질의답변
    sc_tip                             VARCHAR2(4000)   NOT NULL,                --성공 팁
    sc_stars                           VARCHAR2(30)     NOT NULL,                --면접 난이도 (radio)
    sc_ex                              VARCHAR2(20)     NOT NULL,                --면접 경험 (radio)
    sc_where                           VARCHAR2(100)     NOT NULL,               --취업경로(radio)
    sc_cnt                             NUMBER(7)        DEFAULT 0    NOT NULL ,  --조회수
    sc_like                            NUMBER(7)        DEFAULT 0     NULL ,     --좋아요
    --sc_heat                            NUMBER(7)            NULL,              --좋아요 100개 이상 heat
    sc_date                            DATE             NOT NULL,                --날짜
    file1                            VARCHAR2(100)        NULL,                  --파일
    file2                            VARCHAR2(100)        NULL,                  --파일
    size2                            NUMBER(9)        DEFAULT 0  NULL            --파일 크기
    );
  FOREIGN KEY (divisionno) REFERENCES division (divisionno), -- 카테고리번호
  FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no)          --회원번호
    
);

 INSERT INTO seico(sc_no, 
                  sc_area, sc_jobs, sc_gender, sc_position, sc_title, sc_name,
                  sc_cont, sc_q, sc_tip, sc_stars, 
                  sc_ex, sc_where, sc_cnt, sc_like, sc_date, file1, file2, size2)
VALUES((SELECT NVL(MAX(sc_no), 0)+1 as sc_no FROM seico),
                  '1','1','남자','1','1','1',
                  '1','1','1','1',
                  '1','1',0, 0, sysdate,'1','1',0 );

                  
    SELECT sc_no, sc_area, sc_jobs, sc_gender, sc_position, sc_title, sc_name, sc_cont,sc_q, sc_tip, sc_stars,
           sc_cnt,sc_like, sc_ex, sc_where, sc_date, file1, file2, size2
    FROM seico
    WHERE sc_no


INSERT INTO seico(sc_no, 
            sc_area, sc_jobs, sc_title, sc_name, sc_cont, sc_cnt, sc_like, sc_date, file1, file2, size2 )  
VALUES((SELECT NVL(MAX(sc_no), 0) + 1 as sc_no FROM seico),
            '서울', 'SE', '합격했다능', '손마늘', '아싸', 0, 0, sysdate, 'fall.jpg','fall.jpg', 0 );
INSERT INTO seico(sc_no, 
            sc_area, sc_jobs, sc_title, sc_name, sc_cont, sc_cnt, sc_like, sc_date, file1, file2, size2 )  
VALUES((SELECT NVL(MAX(sc_no), 0) + 1 as sc_no FROM seico),
            '서울', 'SE', '합격했다능', '손마늘', '아싸', 0, 0, sysdate, 'fall.jpg','fall.jpg', 0 );
INSERT INTO seico(sc_no, 
            sc_area, sc_jobs, sc_title, sc_name, sc_cont, sc_cnt, sc_like, sc_date, file1, file2, size2 )  
VALUES((SELECT NVL(MAX(sc_no), 0) + 1 as sc_no FROM seico),
            '서울', 'SE', '합격했다능', '손마늘', '아싸', 0, 0, sysdate, 'fall.jpg','fall.jpg', 0 );
INSERT INTO seico(sc_no, 
            sc_area, sc_jobs, sc_title, sc_name, sc_cont, sc_cnt, sc_like, sc_date, file1, file2, size2 )  
VALUES((SELECT NVL(MAX(sc_no), 0) + 1 as sc_no FROM seico),
            '서울', 'SE', '합격했다능', '손마늘', '아싸', 0, 0, sysdate, 'fall.jpg','fall.jpg', 0 );
INSERT INTO seico(sc_no, 
            sc_area, sc_jobs, sc_title, sc_name, sc_cont, sc_cnt, sc_like, sc_date, file1, file2, size2 )  
VALUES((SELECT NVL(MAX(sc_no), 0) + 1 as sc_no FROM seico),
            '서울', 'SE', '합격했다능', '손마늘', '아싸', 0, 0, sysdate, 'fall.jpg','fall.jpg', 0 );
INSERT INTO seico(sc_no, 
            sc_area, sc_jobs, sc_title, sc_name, sc_cont, sc_cnt, sc_like, sc_date, file1, file2, size2 )  
VALUES((SELECT NVL(MAX(sc_no), 0) + 1 as sc_no FROM seico),
            '서울', 'SE', '합격했다능', '손마늘', '아싸', 0, 0, sysdate, 'fall.jpg','fall.jpg', 0 );
INSERT INTO seico(sc_no, 
            sc_area, sc_jobs, sc_title, sc_name, sc_cont, sc_cnt, sc_like, sc_date, file1, file2, size2 )  
VALUES((SELECT NVL(MAX(sc_no), 0) + 1 as sc_no FROM seico),
            '서울', 'SE', '합격했다능', '손마늘', '아싸', 0, 0, sysdate, 'fall.jpg','fall.jpg', 0 );
            
            
            
    SELECT sc_no, sc_area, sc_jobs, sc_title, sc_name, sc_cnt, sc_date, file1, file2, size2, r
    FROM(
         SELECT sc_no, sc_area, sc_jobs, sc_title, sc_name, sc_cnt, sc_date, file1, file2, size2,  rownum as r
         FROM(
            SELECT sc_no, sc_area, sc_jobs, sc_title, sc_name, sc_cnt, sc_date, file1, file2, size2
            FROM seico


                 WHERE sc_title LIKE '%' || '사장' || '%' 

            ORDER BY sc_no DESC   )
    )
    
    
    SELECT sc_no, sc_area, sc_jobs, sc_title, sc_name, sc_cnt, sc_date, file1, file2, size2, r
    FROM(
       SELECT sc_no, sc_area, sc_jobs, sc_title, sc_name, sc_cnt, sc_date, file1, file2, size2, rownum as r
       FROM(
            SELECT sc_no, sc_area, sc_jobs, sc_title, sc_name, sc_cnt, sc_date, file1, file2, size2
            FROM seico
