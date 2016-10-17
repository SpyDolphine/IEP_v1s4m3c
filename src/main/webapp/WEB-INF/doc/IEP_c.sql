CREATE TABLE category( --대분류
  categoryno  NUMBER(7)     NOT NULL PRIMARY KEY,  -- 대분류 번호
  sort        VARCHAR2(50)  NOT NULL,              -- 대분류
  seqno       NUMBER(7)     DEFAULT 0 NOT NULL     -- 출력 순서
);

1) 등록
INSERT INTO category(categoryno, sort, seqno)
  VALUES((SELECT NVL(MAX(categoryno), 0)+1 as categoryno FROM category),   
  '공지사항', 1)
  
2) 조회
SELECT categoryno, sort, seqno
FROM category
ORDER BY categoryno ASC

CREATE TABLE division( -- 중분류
  divisionno    NUMBER(7)                          NOT NULL, -- 카테고리 번호
  categoryno    NUMBER(10)                         NOT NULL, -- 대분류 번호
  title         VARCHAR2(50)                       NOT NULL, -- 카테고리 이름
  seqno         NUMBER(3)       DEFAULT 1          NOT NULL, -- 카테고리 출력 순서
  visible       CHAR(1)         DEFAULT 'Y'        NOT NULL, -- 출력 모드
  ids           CHAR(1)         DEFAULT 'M'    NOT NULL, -- 접근 계정
  cnt           NUMBER(6)       DEFAULT 0          NOT NULL, -- 등록된 글 수
  PRIMARY KEY(divisionno),
  FOREIGN KEY (categoryno) REFERENCES category (categoryno), -- 대분류 번호
  FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no)          -- 회원번호
);

1) 등록
INSERT INTO division(divisionno, categoryno, title, seqno, visible, ids)
VALUES((SELECT NVL(MAX(divisionno), 0)+1 as divisionno FROM division),
             1, '공지사항', 1, 'Y', 'M');

2) 조회
SELECT divisionno, categoryno, title, seqno, visible, ids
FROM division 
ORDER BY seqno ASC;

CREATE TABLE board( -- 게시판
  boardno      NUMBER(7)        NOT NULL        PRIMARY KEY, -- 게시판 번호
  divisionno   NUMBER(7)        NOT NULL ,                   -- 카테고리번호
  me_no        NUMBER(7)        NOT NULL ,                   -- 회원 번호
  title        VARCHAR2(200)    NOT NULL,                    -- 게시판 이름
  content      VARCHAR2(4000)   NOT NULL,                    -- 게시판 내용
  good         NUMBER(7)        DEFAULT 0       NOT NULL,    -- 추천수
  file1        VARCHAR2(100)    NULL ,                       -- Thumb 파일
  file2        VARCHAR2(50)     NULL ,                       -- 파일 2
  size2        NUMBER(9)        DEFAULT 0       NULL ,       -- 파일 2 크기
  map          VARCHAR2(500)    NULL ,                       -- 지도
  cnt          NUMBER(7)        DEFAULT 0       NOT NULL,    -- 조회수
  replycnt     NUMBER(7)        DEFAULT 0       NOT NULL,    -- 댓글수
  rdate        DATE             NOT NULL,                    -- 등록일
  grpno        NUMBER(7)        NOT NULL,                    -- 그룹 번호
  indent       NUMBER(2)        DEFAULT 0       NOT NULL,    -- 답변 차수
  ansnum       NUMBER(5)        DEFAULT 0       NOT NULL,    -- 답변 순서
  FOREIGN KEY (divisionno) REFERENCES division (divisionno), -- 카테고리번호
  FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no),          --회원번호
  PRIMARY KEY(boardno)
);

1)등록 
INSERT INTO board(blogno,
                          blogcategoryno, me_no, title, content, good, file1, file2, size2, map, cnt, replycnt, rdate, 
                          grpno, indent, ansnum)  
VALUES((SELECT NVL(MAX(boardno), 0) + 1 as boardno FROM board),
            1, 4, '제목', '내용', 0, 'fall_m.jpg', 'fall.jpg', 0, 'map', 0, 0, sysdate,
            (SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM blog), 0, 0);



