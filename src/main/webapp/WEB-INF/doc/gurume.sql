1. 테이블 삭제

drop table gurume

2. 테이블 제작

--gurume)맛집
CREATE TABLE gurume(
    gu_no                             NUMBER(7)      NOT NULL    PRIMARY KEY, -- 글 번호
    gu_area                           VARCHAR2(40)   NOT NULL,                -- 지역
    gu_menu                           VARCHAR2(40)   NOT NULL,                -- 메뉴 종류
    gu_title                          VARCHAR2(200)  NOT NULL,                -- 맛집명&제목
    gu_name                           VARCHAR2(100)  NOT NULL,
   -- me_no                             NUMBER(7)    NOT NULL ,            -- 회원
   --boardno                           NUMBER(7)     NOT NULL        PRIMARY KEY, -- 게시판 번호
   --divisionno                        NUMBER(7)     NOT NULL ,           -- 카테고리번호
    gu_cont                           VARCHAR2(4000) NOT NULL,               -- 내용
    gu_cnt                            NUMBER(7)      DEFAULT 0,              -- 조회수
    gu_stars                          VARCHAR2(200)  NOT NULL,                         -- 별점
    gu_date                           DATE           NOT NULL,               -- 날짜
    file1                             VARCHAR2(100)      NULL ,                       -- Thumb 파일
    file2                             VARCHAR2(50)       NULL ,                       -- 파일 2
    size2                             NUMBER(9)       DEFAULT 0 NULL ,       -- 파일 2 크기
    gu_map                            VARCHAR2(500)      NULL                     -- 지도
    );
  FOREIGN KEY (divisionno) REFERENCES division (divisionno), -- 카테고리번호
  FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no)          --회원번호

);

INSERT INTO gurume(gu_no, gu_area, gu_menu, gu_title, gu_name, gu_cont, gu_cnt, gu_stars, gu_date, file1, file2,
size2, gu_map)  
VALUES((SELECT NVL(MAX(gu_no), 0) + 1 as gu_no FROM gurume),
            '서울', '한식', '계란말이', '손양파', '꿀맛', 0, '★', sysdate, 'fall_m.jpg', 'fall.jpg',  0, 'map');
INSERT INTO gurume(gu_no, gu_area, gu_menu, gu_title, gu_name, gu_cont, gu_cnt, gu_stars, gu_date, file1, file2,
size2, gu_map)  
VALUES((SELECT NVL(MAX(gu_no), 0) + 1 as gu_no FROM gurume),
            '서울', '한식', '양파 계란말이', '손양파', '꿀맛', 0, '★', sysdate, 'fall_m.jpg', 'fall.jpg',  0, 'map');
INSERT INTO gurume(gu_no, gu_area, gu_menu, gu_title, gu_name, gu_cont, gu_cnt, gu_stars, gu_date, file1, file2,
size2, gu_map)  
VALUES((SELECT NVL(MAX(gu_no), 0) + 1 as gu_no FROM gurume),
            '서울', '한식', '양파 계란말이', '손양파', '꿀맛', 0, '★', sysdate, 'fall_m.jpg', 'fall.jpg',  0, 'map');
INSERT INTO gurume(gu_no, gu_area, gu_menu, gu_title, gu_name, gu_cont, gu_cnt, gu_stars, gu_date, file1, file2,
size2, gu_map)  
VALUES((SELECT NVL(MAX(gu_no), 0) + 1 as gu_no FROM gurume),
            '서울', '한식', '양파 계란말이', '손양파', '꿀맛', 0, '★', sysdate, 'fall_m.jpg', 'fall.jpg',  0, 'map');
INSERT INTO gurume(gu_no, gu_area, gu_menu, gu_title, gu_name, gu_cont, gu_cnt, gu_stars, gu_date, file1, file2,
size2, gu_map)  
VALUES((SELECT NVL(MAX(gu_no), 0) + 1 as gu_no FROM gurume),
            '서울', '한식', '양파 계란말이', '손양파', '꿀맛', 0, '★', sysdate, 'fall_m.jpg', 'fall.jpg',  0, 'map');
            
SELECT gu_no, gu_area, gu_menu, gu_title, gu_name, gu_cont, gu_cnt, gu_stars, gu_date , gu_file1, gu_file2, gu_size2, gu_cnt
FROM gurume
ORDER BY gu_no ASC;
            
INSERT INTO gurume(gu_no, gu_area, gu_menu, gu_title, gu_name, gu_cont, gu_cnt, gu_stars, gu_date, file1,file2,
                   size2, gu_map)  
VALUES((SELECT NVL(MAX(gu_no), 0) + 1 as gu_no FROM gurume),
            '지역', '분류', '젬고', '이르,ㅁ', '내용', 0, '☆',sysdate, null,null ,null , null)            
            
drop table seico
--2)취업 성공 후기
CREATE TABLE seico(
    sc_no                             NUMBER(7)        NOT NULL    PRIMARY KEY, --글 번호
    sc_area                            VARCHAR2(40)     NOT NULL,                --지역
    sc_jobs                            VARCHAR2(40)     NOT NULL,                --직종
    sc_title                           VARCHAR2(200)    NOT NULL,                --제목
    sc_cont                            VARCHAR2(4000)   NOT NULL,                --내용
    sc_cnt                             NUMBER(7)        DEFAULT 0    NOT NULL ,     --조회수
    sc_like                            NUMBER(7)        DEFAULT 0     NULL ,     --좋아요
    --sc_heat                            NUMBER(7)            NULL,              --좋아요 100개 이상 heat
    sc_date                            DATE             NOT NULL,                --날짜
    sc_file                            VARCHAR2(100)        NULL,                --파일
    sc_size                            NUMBER(7)        DEFAULT 0                --파일 크기
    );
  FOREIGN KEY (divisionno) REFERENCES division (divisionno), -- 카테고리번호
  FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no)          --회원번호
    
);
INSERT INTO seico(sc_no, sc_area, sc_jobs, sc_title, sc_name, sc_cont, sc_cnt, sc_like, sc_date, sc_file, sc_size )  
VALUES((SELECT NVL(MAX(sc_no), 0) + 1 as sc_no FROM seico),
            '서울', 'SE', '합격했다능', '손마늘', '아싸', 0, 0, sysdate, 'fall.jpg', 0 );